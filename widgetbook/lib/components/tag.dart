import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/tag.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Tag', type: CustomTag)
Widget buildTagUseCase(BuildContext context) {
  return const Column(
    children: [
      CustomTag(
        type: CustomTagType.info,
        label: 'Test',
      ),
      SizedBox(
        height: 50,
      ),
      CustomTag(
        type: CustomTagType.warning,
        label: 'Test',
      ),
      SizedBox(
        height: 50,
      ),
      CustomTag(
        type: CustomTagType.success,
        label: 'Test',
      ),
    ],
  );
}