import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiUrl {
  static final baseUrl = dotenv.env["BASE_URL"];

  static final register = "/auth/register";
  static final verifyOtp = "/auth/verify-otp";
  static final createPin = "/auth/create-pin";
  static final login = "/auth/login";
  static final changePin = "/auth/change-pin";
  static final forgetPassword = "/auth/change-pin";
  static final refreshToken = "/auth/refresh";

  static final profile = "/profile";

  static final consultation = "/consultations";

  static final visits = "/visits";
  static final visitsReport = '/visits/report';
  static final visitsReject = '/visits/reject';
  static final visitsAccept = "/visits/accept";

  static final diagnosis = "/diagnosis";

  static final patients = "/patients";

  static final volunteer = "/volunteers";
}
