/*import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_revo_boilerplate/api/api_client.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import '../api/generated/mc2_api.models.swagger.dart';

Future<String> customUploadImage (XFile image) async {
  return '';
  /*try {
    String imageName = basename(image.path);

    UploadFileUrlResponse? response = (await MC2ApiClient.client.uploadFileUrlPost(body: UploadFileUrlRequest(
      name: imageName,
      contentType: 'image/jpg',
      metafields: {},
      description: "desc",
      directory: 'reviews'
    ))).body;

    Logger().e(response);

    if (response != null && response.signedUrl != null && response.key != null) {
      String substringToRemove = "https://ydfkiaiiz4.execute-api.eu-west-1.amazonaws.com/dev";
      Uri uri = Uri.parse(response.signedUrl!.replaceAll(substringToRemove, ''));
      Uint8List? list = await FlutterImageCompress.compressWithFile(
        image.path,
        quality: 80
      );

      if (list != null) {
        await http.put(uri, body: list, headers: {
          "Content-Type": "image/jpg"
        });

        return response.key!;
      } else {
        Logger().e('qui');
        throw 'Error';
      }
    } else {
      Logger().e('qua');
      throw 'Error';
    }
  } catch (e) {
    rethrow;
  }*/
}*/