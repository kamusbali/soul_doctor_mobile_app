import 'package:soul_doctor/app/domain/use_case/auth_use_cases/create_pin_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_data_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_status_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/login_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/logout_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/register_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/update_pin_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/verify_otp_use_case.dart';

class AuthUseCases {
  final GetSessionDataUseCases getSessionDataUseCases;
  final GetSessionStatusUseCase getSessionStatusUseCase;
  final LogoutUseCase logoutUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final CreatePinUseCase createPinUseCase;
  final UpdatePinUseCase updatePinUseCase;

  AuthUseCases({
    required this.getSessionStatusUseCase,
    required this.logoutUseCase,
    required this.getSessionDataUseCases,
    required this.loginUseCase,
    required this.registerUseCase,
    required this.verifyOtpUseCase,
    required this.createPinUseCase,
    required this.updatePinUseCase,
  });
}
