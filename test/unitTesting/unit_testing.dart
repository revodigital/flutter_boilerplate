import 'package:flutter_revo_boilerplate/utils/TokenManager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void tokenManagerTest() {
  String ACCESS_TOKEN = "access_token";
  String REFRESH_TOKEN = "refresh_token";
  String INSTANCE_ID = "instance_id";

  group('TokenManager', () {
    test('Set all values of TokenManager', () async {
      print("[Set all values of TokenManager]: Starting with mock values");
      SharedPreferences.setMockInitialValues({});
      TokenManager tokenManager = TokenManager();


      print("[Set all values of TokenManager]: Setting all values");
      tokenManager.setAll(ACCESS_TOKEN, REFRESH_TOKEN, INSTANCE_ID);

      expect(await tokenManager.getInstanceId(), INSTANCE_ID);
      expect(await tokenManager.getAccessToken(), ACCESS_TOKEN);
      expect(await tokenManager.getRefreshToken(), REFRESH_TOKEN);
      print("[Set all values of TokenManager]: Completed");
    });

    test('Clear all values of TokenManager', () async {
      print("[Clear all values of TokenManager]: Starting with mock values");
      SharedPreferences.setMockInitialValues({});
      TokenManager tokenManager = TokenManager();


      print("[Clear all values of TokenManager]: Clearing all values");
      tokenManager.clearTokens();

      expect(await tokenManager.getInstanceId(), null);
      expect(await tokenManager.getAccessToken(), null);
      expect(await tokenManager.getRefreshToken(), null);
      print("[Clear all values of TokenManager]: Completed");
    });
  });
}