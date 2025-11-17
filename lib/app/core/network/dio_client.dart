import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/refresh_api_client.dart';
import 'package:soul_doctor/app/core/network/api_url.dart';

import '../../data/source/local/provider/token_provider.dart';

class DioClient {
  static Dio? _dio;
  static final _tokenManager = TokenProvider.instance;
  static final _refreshClient = RefreshApiClient();

  static Dio get instance {
    _dio ??= _createDio();
    return _dio!;
  }

  static Dio _createDio() {
    final dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl ?? ""));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await _tokenManager.getAccessToken();

          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
        onError: (error, handler) async {
          final req = error.requestOptions;
          final status = error.response?.statusCode ?? 0;
          final alreadyRetried = req.extra['__ret'] == true;

          // Hanya handle 401 sekali
          if (status == 401 && !alreadyRetried) {
            try {
              final refreshToken = await _tokenManager.getRefreshToken();

              // Kalau gak ada refresh token, lempar error saja
              if (refreshToken == null || refreshToken.isEmpty) {
                return handler.next(error);
              }

              print("Refreshing token...");

              final authStatusResponse = await _refreshClient.refresh(
                refreshToken,
              );

              if (authStatusResponse.accessToken == null ||
                  authStatusResponse.refreshToken == null) {
                // Refresh gagal → biarkan error naik (nanti di UI bisa logout paksa)
                return handler.next(error);
              }

              // Simpan token baru
              await _tokenManager.saveAccessToken(
                authStatusResponse.accessToken!,
              );
              await _tokenManager.saveRefreshToken(
                authStatusResponse.refreshToken!,
              );

              // Buat ulang request dengan header Authorization yang baru
              final newRequest = req.copyWith(
                headers: {
                  ...req.headers,
                  'Authorization': 'Bearer ${authStatusResponse.accessToken}',
                },
                extra: {
                  ...req.extra,
                  '__ret': true, // penanda sudah pernah di-retry
                },
              );

              // Kirim ulang request
              final response = await dio.fetch(newRequest);
              return handler.resolve(response);
            } catch (e) {
              // Kalau refresh token juga error / gagal
              return handler.next(error);
            }
          }

          // Selain itu, teruskan error seperti biasa
          return handler.next(error);
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        responseBody: true,
        requestBody: true,
      ),
    );

    return dio;
  }
}
