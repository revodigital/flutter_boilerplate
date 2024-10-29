import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/icon_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icon Button', type: CustomIconButton)
Widget buildIconButtonUseCase(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          CustomIconButton(
            icon: Icons.plus_one,
            onPressed: () {},
          ),
        ],
      ),
    ],
  );
}