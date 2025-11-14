import 'package:get_storage/get_storage.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';

class ClaimsTokenService {
  ClaimsTokenService._internal();
  static final ClaimsTokenService _instance = ClaimsTokenService._internal();
  static ClaimsTokenService get instance => _instance;

  final _box = GetStorage();

  final _claimsKey = "claims_key";

  Future<void> saveSessionData(SessionData data) async {
    await _box.write(_claimsKey, data.toJson());
  }

  Future<SessionData?> getSessionData() async {
    return SessionData.fromJson(_box.read(_claimsKey));
  }

  Future<void> clearSessionData() async {
    await _box.remove(_claimsKey);
    print("Done");
  }
}
