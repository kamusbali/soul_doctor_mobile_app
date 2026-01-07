import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/network/api_url.dart';
import 'package:soul_doctor/app/data/source/remote/dto/common/response_wrapper.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/change_pin_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/create_pin_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/login_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/otp_phone_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/verify_otp_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/auth_status_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/transaction_otp_response_dto.dart';

import '../../../../core/network/dio_client.dart';

class AuthProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper<TransactionOtpResponseDto>> register(
    OtpEmailRequest email,
  ) async {
    try {
      var response = await _dio.post(ApiUrl.register, data: email.toJson());
      var result = ResponseWrapper<TransactionOtpResponseDto>.fromJson(
        response.data,
        (json) =>
            TransactionOtpResponseDto.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }

    // return ResponseWrapper.fromJson(
    //   {
    //     "status": 200,
    //     "message": "OTP for register sent",
    //     "data": {"transaction_id": "1312acab"},
    //   },
    //   (json) =>
    //       TransactionOtpResponseDto.fromJson(json as Map<String, dynamic>),
    // );
  }

  Future<ResponseWrapper> verifyOtp(VerifyOtpRequest verifyOtpRequest) async {
    try {
      var response = await _dio.post(
        ApiUrl.verifyOtp,
        data: verifyOtpRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }

    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "registration success",
    //   "data": null,
    // }, (json) => null);
  }

  Future<ResponseWrapper> createPin(CreatePinRequest createPinRequest) async {
    try {
      var response = await _dio.post(
        ApiUrl.createPin,
        data: createPinRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "registration success",
    //   "data": null,
    // }, (json) => null);
  }

  Future<ResponseWrapper<AuthStatusResponse>> login(
    LoginRequest loginRequest,
  ) async {
    try {
      var response = await _dio.post(ApiUrl.login, data: loginRequest.toJson());
      var result = ResponseWrapper<AuthStatusResponse>.fromJson(
        response.data,
        (json) => AuthStatusResponse.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "login success",
    //   "data": {
    //     "access_token":
    //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.KMUFsIDTnFmyG3nMiGM6H9FNFUROf3wh7SmqJp-QV30",
    //     "refresh_token":
    //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.KMUFsIDTnFmyG3nMiGM6H9FNFUROf3wh7SmqJp-QV30",
    //     "is_profile_complete": false,
    //   },
    // }, (json) => AuthStatusResponse.fromJson(json as Map<String, dynamic>));
  }

  Future<ResponseWrapper> changePin(ChangePinRequest changePinRequest) async {
    try {
      var response = await _dio.post(
        ApiUrl.changePin,
        data: changePinRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "pin changed successfully",
    //   "data": null,
    // }, (json) => null);
  }

  Future<ResponseWrapper<TransactionOtpResponseDto>> forgetPassword(
    OtpEmailRequest phone,
  ) async {
    try {
      var response = await _dio.post(
        ApiUrl.forgetPassword,
        data: phone.toJson(),
      );
      var result = ResponseWrapper<TransactionOtpResponseDto>.fromJson(
        response.data,
        (json) =>
            TransactionOtpResponseDto.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson(
    //   {
    //     "status": 200,
    //     "message": "OTP for forget pin sent",
    //     "data": {"transaction_id": "1312acab"},
    //   },
    //   (json) =>
    //       TransactionOtpResponseDto.fromJson(json as Map<String, dynamic>),
    // );
  }
}
