import 'dart:async';
//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chopper/chopper.dart';

class AuthInterceptor implements Interceptor {
  const AuthInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    //final authSession = (await Amplify.Auth.fetchAuthSession()) as CognitoAuthSession;

    final request = applyHeader(chain.request, 'Authorization', /*authSession.userPoolTokensResult.value.idToken.toJson()*/ '');
    return chain.proceed(request);
  }
}