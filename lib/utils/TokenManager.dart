import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageKeys {
  static String get ACCESS_TOKEN => 'access_token';
  static String get REFRESH_TOKEN => 'refresh_token';
  static String get INSTANCE_ID => 'instance_id';
}

class TokenManager {
  static final instance = TokenManager._internal();

  factory TokenManager() {
    return instance;
  }

  void setAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(LocalStorageKeys.ACCESS_TOKEN, accessToken);
  }

  void setRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalStorageKeys.REFRESH_TOKEN, refreshToken);
  }

  setInstanceId(instanceId) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(LocalStorageKeys.INSTANCE_ID, instanceId.toString());
  }

  void setTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalStorageKeys.ACCESS_TOKEN, accessToken);
    await prefs.setString(LocalStorageKeys.REFRESH_TOKEN, refreshToken);
  }

  void setAll(String accessToken, String refreshToken, instanceId) async {
    setTokens(accessToken, refreshToken);
    await setInstanceId(instanceId);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LocalStorageKeys.ACCESS_TOKEN);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LocalStorageKeys.REFRESH_TOKEN);
  }

  Future<String?> getInstanceId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LocalStorageKeys.INSTANCE_ID);
  }

  getTokens() {
    return {
      "accessToken": getAccessToken(),
      "refreshToken": getRefreshToken()
    };
  }

  clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKeys.ACCESS_TOKEN);
    await prefs.remove(LocalStorageKeys.REFRESH_TOKEN);
    await prefs.remove(LocalStorageKeys.INSTANCE_ID);
  }

  TokenManager._internal();
}

Map<String, dynamic>? parseJwtPayLoad(String? token) {
  if (token != null) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }

    return payloadMap;
  } else {
    return null;
  }
}
String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}

getTokenState (String? token) {
  const REFRESH_TOKEN_LEGROOM = 1 * 30;
  var time = DateTime.now();
  if (token == null) {
    return { "valid": false, "needRefresh": false };
  }

  var decoded = parseJwtPayLoad(token);
  if (decoded == null) {
    return { "valid": false, "needRefresh": false };
  } else if (decoded["exp"] != null && ((time.millisecondsSinceEpoch/1000) + REFRESH_TOKEN_LEGROOM) > decoded["exp"]) {
    return { "valid": true, "needRefresh": true };
  } else {
    return { "valid": true, "needRefresh": false };
  }
}