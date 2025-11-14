import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/claims_token_service.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';

class TokenProvider {
  TokenProvider._internal();
  static final TokenProvider _instance = TokenProvider._internal();
  static TokenProvider get instance => _instance;

  final ClaimsTokenService _claimsTokenService = ClaimsTokenService.instance;

  final _accessTokenKey = "access_token";
  final _refreshTokenKey = "refresh_token";

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
    await _claimsTokenService.saveSessionData(SessionData.fromToken(token));
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
