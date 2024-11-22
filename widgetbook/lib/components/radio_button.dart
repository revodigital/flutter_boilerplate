import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/radio_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'RadioButton', type: CustomRadioButton)
Widget buildPrimaryButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: CustomRadioButton(
      groupValue: 'selected',
      activeValue: context.knobs.list(label: 'RadioButton Value', options: ['selected', 'unselected']),
      onChange: (String? b) {},
      disabled: context.knobs.booleanOrNull(label: 'RadioButton Disabled', initialValue: false),
    ),
  );
}