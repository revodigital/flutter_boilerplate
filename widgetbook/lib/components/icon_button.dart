import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/icon_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icon Button', type: CustomIconButton)
Widget buildIconButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: CustomIconButton(
      type: context.knobs.list(label: 'Button Type', options: CustomIconButtonType.values),
      isLoading: context.knobs.boolean(label: 'Button Loading', initialValue: false),
      disabled: context.knobs.boolean(label: 'Button Disabled', initialValue: false),
      icon: context.knobs.list(label: 'Button Icon', options: [Icons.add, Icons.arrow_left], initialOption: Icons.add),
      onPressed: () {
      },
    ),
  );
}