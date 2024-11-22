import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/text_field.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'TextField', type: CustomTextField)
Widget buildSearchBarUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        CustomTextField(
          placeholder: 'Placeholder...',
          onValueChange: (t) {},
          label: context.knobs.stringOrNull(label: 'TextField Label', initialValue: null),
          helpText: context.knobs.stringOrNull(label: 'TextField Supporting Text', initialValue: null),
          type: context.knobs.list(label: 'TextField Type', options: CustomTextFieldType.values),
          status: context.knobs.list(label: 'TextField Status', options: CustomTextFieldStatus.values),
          required: context.knobs.booleanOrNull(label: 'TextField Required', initialValue: false),
          disabled: context.knobs.booleanOrNull(label: 'TextField Disabled', initialValue: false),
          suffixIcon: context.knobs.listOrNull(label: 'TextField Suffix Icon', options: [Icons.add, Icons.arrow_left], initialOption: null),
          prefixIcon: context.knobs.listOrNull(label: 'TextField Prefix Icon', options: [Icons.add, Icons.arrow_left], initialOption: null),
        ),
      ],
    ),
  );
}