import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_revo_boilerplate/model/picsum_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'restApi.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient? _instance;

  static RestClient getInstance() {
    if (_instance == null) {
      final dio = Dio();
      final baseUrl = _getBaseUrl();
      _instance = RestClient(dio, baseUrl: baseUrl);
    }
    return _instance!;
  }

  @GET("/list")
  Future<List<PicSumModel>> getPictures();

  static String _getBaseUrl() {
    final isTest = dotenv.env['TEST_ENV'] == 'true';
    return isTest ? dotenv.env['REST_API_URL_TEST']! : dotenv.env['REST_API_URL']!;
  }
}