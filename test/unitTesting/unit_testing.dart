import 'package:flutter_revo_boilerplate/utils/TokenManager.dart';
import 'package:flutter_test/flutter_test.dart';

void tokenManagerTest() {
  String ACCESS_TOKEN = "access_token";
  String REFRESH_TOKEN = "refresh_token";
  String INSTANCE_ID = "instance_id";

  group('TokenManager', () {
    test('Set access/refresh token and instanceId', () async {
      TokenManager tokenManager = TokenManager();
      String? instanceId = await tokenManager.getInstanceId();
      String? accessToken = await tokenManager.getAccessToken();
      String? refreshToken = await tokenManager.getRefreshToken();

      print('Changing TokenManager values');
      tokenManager.setAll(ACCESS_TOKEN, REFRESH_TOKEN, INSTANCE_ID);

      expect(await tokenManager.getInstanceId(), INSTANCE_ID);
      expect(await tokenManager.getAccessToken(), ACCESS_TOKEN);
      expect(await tokenManager.getRefreshToken(), REFRESH_TOKEN);

      print('Restoring true TokenManager values');
      if(instanceId != null && accessToken != null && refreshToken != null){
        tokenManager.setAll(accessToken, refreshToken, instanceId);
      } else {
        tokenManager.clearTokens();
      }
    });

    test('Clearing values', () async {
      TokenManager tokenManager = TokenManager();
      String? instanceId = await tokenManager.getInstanceId();
      String? accessToken = await tokenManager.getAccessToken();
      String? refreshToken = await tokenManager.getRefreshToken();

      print('Changing TokenManager values');
      tokenManager.clearTokens();

      expect(await tokenManager.getInstanceId(), null);
      expect(await tokenManager.getAccessToken(), null);
      expect(await tokenManager.getRefreshToken(), null);

      print('Restoring true TokenManager values');
      if(instanceId != null && accessToken != null && refreshToken != null){
        tokenManager.setAll(accessToken, refreshToken, instanceId);
      }
    });
  });
}