import 'dart:async';
import 'dart:io';

//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';

class MyAuthenticator implements Authenticator {
  MyAuthenticator();

  @override
  FutureOr<Request?> authenticate(
      Request request,
      Response response, [
        Request? originalRequest,
      ]) async {

    if (response.statusCode == HttpStatus.unauthorized) {
      // Trying to update token only 1 time
      if (request.headers['Retry-Count'] == '1') {
        return null;
      }

      try {
        final newToken = await _refreshToken();

        return applyHeaders(
          request,
          {
            HttpHeaders.authorizationHeader: newToken,
            // Setting the retry count to not end up in an infinite loop
            // of unsuccessful updates
            'Retry-Count': '1',
          },
        );
      } catch (e) {
        Logger().e('[AUTHENTICATOR]: $e');
        return null;
      }
    }

    return null;
  }

  Completer<String>? _completer;

  Future<String> _refreshToken() {
    var completer = hasChanged ? _completer : null;

    if (!hasChanged) {
      hasChanged = true;
    }

    if (completer != null && !completer.isCompleted) {
      return completer.future;
    }

    completer = Completer<String>();
    _completer = completer;

    getToken().then((s) {
      // Completing with a new token
      completer?.complete(s);
    }).onError((error, stackTrace) {
      // Completing with an error
      completer?.completeError(error ?? 'Refresh token error', stackTrace);
    });

    return completer.future;
  }

  void clearTokenCache() {
    _completer = null;
  }

  Future<String> getToken () async {
    //final authSession = (await Amplify.Auth.fetchAuthSession()) as CognitoAuthSession;
    //return authSession.userPoolTokensResult.value.accessToken.toJson();
    return '';
  }

  static bool hasChanged = true;

  @override
  AuthenticationCallback? get onAuthenticationFailed => null;

  @override
  AuthenticationCallback? get onAuthenticationSuccessful => null;
}