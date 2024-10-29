import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_revo_boilerplate/api/generated/client_index.dart';
//import 'package:flutter_revo_boilerplate/api/generated/mc2_api.swagger.dart';
//import 'package:flutter_revo_boilerplate/api/utils/authenticator.dart';
//import 'package:flutter_revo_boilerplate/api/utils/interceptor.dart';

class AppApiClient {
  static final client = Openapi.create(
    baseUrl: Uri.parse(dotenv.env['REST_API_URL']!),
    interceptors: [
      //const AuthInterceptor()
    ],
    //authenticator: MyAuthenticator(),
  );
}