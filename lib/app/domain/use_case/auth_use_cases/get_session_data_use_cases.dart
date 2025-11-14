import 'package:soul_doctor/app/domain/model/session_data.dart';
import 'package:soul_doctor/app/domain/repository/auth_repository.dart';

class GetSessionDataUseCases {
  final AuthRepository _authRepository;

  GetSessionDataUseCases(this._authRepository);

  Future<SessionData?> execute() async {
    try {
      return await _authRepository.getSessionData();
    } catch (_) {
      return null;
    }
  }
}
