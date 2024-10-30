/*import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';


import 'package:atlassian_apis/jira_platform.dart' as jira;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_revo_boilerplate/main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/snackbar.dart';
import '../colors.dart';
import '../typography.dart';
import 'input_with_button.dart';
import 'jira_api.dart';

class FeedbackHandler {
  bool _alreadyOpened = false;

  void handleFeedback(Uint8List? img, String uniqueId) async {
    File? image = await handleShake(img, uniqueId);
    if(!_alreadyOpened){
      _alreadyOpened = true;
      modalShakeCallback(image);
    }
  }

  Future<File?> handleShake(Uint8List? img, String filename) async {
    if (img != null){
      Directory directory = await getApplicationDocumentsDirectory();
      File imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(img);

      return imagePath;
    } else {
      return null;
    }
  }

  void modalShakeCallback(File? image) {
    showModalBottomSheet(
      context: MC2App.preview.currentContext!,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Adaptive.px(20)), topRight: Radius.circular(Adaptive.px(20))),
      ),
      backgroundColor: CustomColors.neutral(CustomNeutralKeys.k100),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, _) {
            return Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Adaptive.px(24), top: Adaptive.px(24)),
                              child: Text(
                                "Feedback",
                                style: CustomTypography.title(CustomTitleKeys.k2)!.copyWith(
                                    color: CustomColors.neutral(CustomNeutralKeys.k100)
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: Adaptive.px(24), top: Adaptive.px(24)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.close,
                                  size: Adaptive.px(24),
                                  color: CustomColors.neutral(CustomNeutralKeys.k100),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: Adaptive.px(24), vertical: Adaptive.px(24)),
                          child: InputWithButton(image: image?.readAsBytesSync(), callback: (String description) async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            jira.CreatedIssue createdIssue = await JiraClient().createFeedback(description);
                            if(createdIssue.id != null){
                              if (image != null) {
                                List<jira.Attachment> attachments = await JiraClient().uploadScreenshot(createdIssue.key!, await jira.MultipartFile.fromPath("file", image.path, filename: image.path.split('/').last, contentType: MediaType("multipart", "form-data", {
                                  "comment": "foo",
                                  "minorEdit": "true"
                                })));
                                if(attachments.isNotEmpty){
                                  _alreadyOpened = false;
                                  Navigator.pop(context);
                                  CustomSnackbar.showSnackbar(MC2App.preview.currentContext!, "Feedback inviato correttamente!", (){}, CustomSnackbarType.normal);
                                } else {
                                  _alreadyOpened = false;
                                  Navigator.pop(context);
                                  CustomSnackbar.showSnackbar(MC2App.preview.currentContext!, "Impossibile inviare il feedback!", (){}, CustomSnackbarType.error);
                                }
                              } else if (image == null) {
                                _alreadyOpened = false;
                                Navigator.pop(context);
                                CustomSnackbar.showSnackbar(MC2App.preview.currentContext!, "Feedback inviato correttamente!", (){}, CustomSnackbarType.normal);
                              }
                            } else {
                              _alreadyOpened = false;
                              Navigator.pop(context);
                              CustomSnackbar.showSnackbar(MC2App.preview.currentContext!, "Impossibile inviare il feedback!", (){}, CustomSnackbarType.error);
                            }
                          }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      }
    ).whenComplete(() {
      _alreadyOpened = false;
    });
  }
}*/