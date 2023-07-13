import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter_revo_boilerplate/components/CustomSnackBar.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';


import 'package:atlassian_apis/jira_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_revo_boilerplate/components/Modal/ModalWithHeader.dart';
import 'package:flutter_revo_boilerplate/feedback/jiraApi.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shake/shake.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';
import 'InputWithButton.dart';

class FeedbackHandler {
  ShakeDetector? _instance;
  bool _alreadyOpened = false;

  Future<void> initShakeCallback() async {
    _instance = ShakeDetector.autoStart(
        onPhoneShake: () {
          const uuid = Uuid();
          RenderRepaintBoundary boundary = MyApp.preview.currentContext!.findRenderObject() as RenderRepaintBoundary;
          handleFeedback(boundary, uuid.v1());
        }
    );
  }

  void disposeShakeCallback() {
    _instance!.stopListening();
  }

  void handleFeedback(RenderRepaintBoundary boundary, String uniqueId) async {
    File? image = await handleShake(boundary, uniqueId);
    if(image != null){
      if(!_alreadyOpened){
        _alreadyOpened = true;
        modalShakeCallback(image);
      }
    } else {
      CustomSnackBar.showSnackBar(MyApp.preview.currentContext!, "Impossibile inviare il feedback!", false);
    }
  }

  Future<File?> handleShake(RenderRepaintBoundary boundary, String filename) async {
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/$filename.png');
    await file.writeAsBytes(pngBytes);

    return file;
  }

  void modalShakeCallback(File image) {
    ModalWithHeader.show(
      context: MyApp.preview.currentContext!,
      headerLabel: "Feedback",
      whenCompleted: () {
        _alreadyOpened = false;
      },
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
          child: InputWithButton(image: image.readAsBytesSync(),callback: (String description) async {
            CreatedIssue createdIssue = await JiraClient().createFeedback(description);
            if(createdIssue.id != null){
              List<Attachment> attachments = await JiraClient().uploadScreenshot(createdIssue.key!, await MultipartFile.fromPath("file", image.path, filename: image.path.split('/').last, contentType: MediaType("multipart", "form-data", {
                "comment": "foo",
                "minorEdit": "true"
              })));
              if(attachments.isNotEmpty){
                _alreadyOpened = false;
                CustomSnackBar.showSnackBar(MyApp.preview.currentContext!, "Feedback inviato correttamente!", true);
              } else {
                _alreadyOpened = false;
                CustomSnackBar.showSnackBar(MyApp.preview.currentContext!, "Feedback NON inviato!", false);
              }
            } else {
              _alreadyOpened = false;
              CustomSnackBar.showSnackBar(MyApp.preview.currentContext!, "Feedback NON inviato!", false);
            }
          }),
        )
      ]
    );
  }
}