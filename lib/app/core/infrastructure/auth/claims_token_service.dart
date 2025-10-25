import 'package:get_storage/get_storage.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';

class ClaimsTokenService {
  ClaimsTokenService._internal();
  static final ClaimsTokenService _instance = ClaimsTokenService._internal();
  static ClaimsTokenService get instance => _instance;

  final box = GetStorage();

  final _claimsKey = "claims_key";

  Future<void> saveSessionData(SessionData data) async {
    await box.write(_claimsKey, data.toJson());
  }

  Future<SessionData?> getSessionData() async {
    return SessionData.fromJson(box.read(_claimsKey));
  }
}
