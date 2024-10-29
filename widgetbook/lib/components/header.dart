import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/header.dart';
import 'package:flutter_revo_boilerplate/components/tag.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Tag', type: CustomHeader)
Widget buildTagUseCase(BuildContext context) {
  return Column(
    children: [
      CustomHeader(
        title: 'Questo è il title',
      ),
      SizedBox(
        height: 50,
      ),
      CustomHeader(
        title: 'Questo è il title',
        icon: Icons.add,
      ),
      SizedBox(
        height: 50,
      ),
      CustomHeader(
        title: 'Questo è il title',
        tag: CustomTag(type: CustomTagType.warning, label: 'Test'),
        icon: Icons.add,
        onPress: (){},
      ),
    ],
  );
}