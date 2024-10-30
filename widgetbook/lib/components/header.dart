import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/header.dart';
import 'package:flutter_revo_boilerplate/components/tag.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Tag', type: CustomHeader)
Widget buildTagUseCase(BuildContext context) {
  return Column(
    children: [
      const CustomHeader(
        title: 'Questo è il title',
      ),
      const SizedBox(
        height: 50,
      ),
      const CustomHeader(
        title: 'Questo è il title',
        icon: Icons.add,
      ),
      const SizedBox(
        height: 50,
      ),
      CustomHeader(
        title: 'Questo è il title',
        tag: const CustomTag(type: CustomTagType.warning, label: 'Test'),
        icon: Icons.add,
        onPress: (){},
      ),
    ],
  );
}