import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_data_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/get_session_status_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/logout_use_case.dart';

class AuthUseCases {
  final GetSessionDataUseCases getSessionDataUseCases;
  final GetSessionStatusUseCase getSessionStatusUseCase;
  final LogoutUseCase logoutUseCase;

  AuthUseCases({
    required this.getSessionStatusUseCase,
    required this.logoutUseCase,
    required this.getSessionDataUseCases,
  });
}
