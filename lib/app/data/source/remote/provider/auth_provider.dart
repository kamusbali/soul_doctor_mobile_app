import 'package:soul_doctor/app/data/source/remote/dto/common/response_wrapper.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/change_pin_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/create_pin_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/login_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/otp_phone_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/verify_otp_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/auth_status_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/transaction_otp_response_dto.dart';

class AuthProvider {
  Future<ResponseWrapper<TransactionOtpResponseDto>> register(
    OtpPhoneRequest phone,
  ) async {
    return ResponseWrapper.fromJson(
      {
        "status": 200,
        "message": "OTP for register sent",
        "data": {"transaction_id": "1312acab"},
      },
      (json) =>
          TransactionOtpResponseDto.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ResponseWrapper> verifyOtp(VerifyOtpRequest verifyOtpRequest) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "registration success",
      "data": null,
    }, (json) => null);
  }

  Future<ResponseWrapper> createPin(CreatePinRequest createPinRequest) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "registration success",
      "data": null,
    }, (json) => null);
  }

  Future<ResponseWrapper<AuthStatusResponse>> login(
    LoginRequest loginRequest,
  ) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "login success",
      "data": {
        "access_token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.KMUFsIDTnFmyG3nMiGM6H9FNFUROf3wh7SmqJp-QV30",
        "refresh_token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.KMUFsIDTnFmyG3nMiGM6H9FNFUROf3wh7SmqJp-QV30",
        "is_profile_complete": false,
      },
    }, (json) => AuthStatusResponse.fromJson(json as Map<String, dynamic>));
  }

  Future<ResponseWrapper> changePin(ChangePinRequest changePinRequest) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "pin changed successfully",
      "data": null,
    }, (json) => null);
  }

  Future<ResponseWrapper<TransactionOtpResponseDto>> forgetPassword(
    OtpPhoneRequest phone,
  ) async {
    return ResponseWrapper.fromJson(
      {
        "status": 200,
        "message": "OTP for forget pin sent",
        "data": {"transaction_id": "1312acab"},
      },
      (json) =>
          TransactionOtpResponseDto.fromJson(json as Map<String, dynamic>),
    );
  }
}
