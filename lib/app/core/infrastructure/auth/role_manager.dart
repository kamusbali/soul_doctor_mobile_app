import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soul_doctor/app/domain/model/role.dart';

class RoleManager {
  RoleManager._internal();
  static final RoleManager _instance = RoleManager._internal();
  static RoleManager get instance => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final _roleKey = "role";

  Future<void> saveCurrentRole(int role) async {
    await _storage.write(key: _roleKey, value: role.toString());
  }

  Future<Role?> getCurrentRole() async {
    var roleString = await _storage.read(key: _roleKey) ?? "";
    try {
      return Role.getRoleById(int.parse(roleString));
    } catch (e) {
      return null;
    }
  }
}
