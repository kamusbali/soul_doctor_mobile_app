import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

class GetSessionStatusUseCase {
  final AuthRepository _authRepository;

  GetSessionStatusUseCase(this._authRepository);

  Future<bool> execute() async {
    return await _authRepository.getSessionStatus();
  }
}
