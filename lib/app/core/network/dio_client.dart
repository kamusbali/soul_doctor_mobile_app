import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/refresh_api_client.dart';
import 'package:soul_doctor/app/core/network/api_url.dart';

import '../infrastructure/auth/token_manager.dart';

class DioClient {
  static Dio? _dio;
  static final _tokenManager = TokenManager.instance;
  static final _refreshClient = RefreshApiClient();

  static Dio get instance {
    if (_dio == null) {
      _dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl ?? ""));

      _dio!.interceptors.add(
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

            if (status == 401 && !alreadyRetried) {
              try {
                final refreshToken = await _tokenManager.getRefreshToken();

                if (refreshToken == null) return handler.next(error);

                req.extra['__ret'] = true;

                var authStatusResponse = await _refreshClient.refresh(
                  refreshToken,
                );

                if (authStatusResponse.accessToken == null ||
                    authStatusResponse.refreshToken == null) {
                  throw DioException(
                    requestOptions: error.requestOptions,
                    type: DioExceptionType.badResponse,
                    message: error.response?.data?["message"],
                  );
                }

                _tokenManager.saveAccessToken(authStatusResponse.accessToken!);
                _tokenManager.saveRefreshToken(
                  authStatusResponse.refreshToken!,
                );

                try {
                  final retryResp = await _dio!.fetch(req);
                  return handler.resolve(retryResp);
                } on DioException catch (e) {
                  return handler.next(e);
                }
              } catch (e) {
                return handler.next(error);
              }
            }

            return handler.next(error);
          },
        ),
      );

      _dio!.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          responseBody: true,
          requestBody: true,
        ),
      );
    }

    return _dio!;
  }
}
