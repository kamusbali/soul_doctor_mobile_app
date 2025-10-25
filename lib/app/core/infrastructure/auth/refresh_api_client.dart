import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/network/network_content_type.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/refresh_token_request.dart';

import '../../../data/source/remote/dto/common/response_wrapper.dart';
import '../../../data/source/remote/dto/response/auth_status_response_dto.dart';
import '../../network/api_url.dart';

class RefreshApiClient {
  final Dio _client;
  RefreshApiClient()
    : _client = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl ?? ""));

  Future<AuthStatusResponse> refresh(String refreshToken) async {
    final resp = await _client.post(
      ApiUrl.refreshToken,
      data: RefreshTokenRequest(refreshToken: refreshToken).toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $refreshToken',
          ...NetworkContentType.applicationJson.header,
        },
      ),
    );

    final wrap = ResponseWrapper<AuthStatusResponse>.fromJson(
      resp.data,
      (json) => AuthStatusResponse.fromJson(json as Map<String, dynamic>),
    );
    if (resp.statusCode == 200 && wrap.data != null) return wrap.data!;

    throw DioException(
      requestOptions: resp.requestOptions,
      response: resp,
      type: DioExceptionType.badResponse,
      message: wrap.message ?? 'Refresh failed',
    );
  }
}
