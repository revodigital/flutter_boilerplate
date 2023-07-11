import 'package:dio/dio.dart';

import '../../../utils/TokenManager.dart';

class AuthService {
  Future<String?> get accessToken async {
    var token = await TokenManager().getAccessToken();
    return token;
  }

  Future<String?> refresh() async {
    /*var client = RestClient().getInstance();
    if (client == null){
      return null;
    } else {
      try {
        var res = funzioneRefresh();
        var newAccessToken = res.parsedData!.refresh.accessToken;
        TokenManager().setAccessToken(newAccessToken);

        return newAccessToken;
      } catch {
        return null;
      }
    }*/
  }
}

class AuthInterceptor extends Interceptor {
  final AuthService _authService;

  AuthInterceptor(this._authService);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _authService.accessToken;
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final accessToken = await _authService.refresh();
      final request = err.response?.requestOptions;
      request?.headers['Authorization'] = 'Bearer $accessToken';
      handler.resolve(await Dio().fetch(request!));
    } else {
      handler.next(err);
    }
  }
}