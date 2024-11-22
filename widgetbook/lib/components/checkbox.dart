import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/checkbox.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Checkbox', type: CustomCheckbox)
Widget buildPrimaryButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: CustomCheckbox(
      value: context.knobs.booleanOrNull(label: 'Checkbox Value', initialValue: null),
      onChange: (bool? b) {}, 
      disabled: context.knobs.booleanOrNull(label: 'Checkbox Disabled', initialValue: false),
    ),
  );
}