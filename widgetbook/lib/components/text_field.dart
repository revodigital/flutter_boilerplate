import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/text_field.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Text Field with Icon', type: CustomTextField)
Widget buildTextFieldWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        CustomTextField(
          disabled: false,
          onChangeValue: () {},
          type: CustomTextFieldType.text,
          status: CustomTextFieldStatus.normal,
          placeholder: 'Placeholder',
          label: 'Label',
          icon: Icons.visibility,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextField(
          disabled: false,
          onChangeValue: () {},
          type: CustomTextFieldType.text,
          status: CustomTextFieldStatus.error,
          placeholder: 'Placeholder',
          label: 'Label',
          icon: Icons.visibility,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextField(
          disabled: true,
          onChangeValue: () {},
          type: CustomTextFieldType.text,
          status: CustomTextFieldStatus.normal,
          placeholder: 'Placeholder',
          label: 'Label',
          icon: Icons.visibility,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Text Field without Icon', type: CustomTextField)
Widget buildTextFieldWithoutIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        CustomTextField(
          disabled: false,
          onChangeValue: () {},
          type: CustomTextFieldType.text,
          status: CustomTextFieldStatus.normal,
          placeholder: 'Placeholder',
          label: 'Label',
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextField(
          disabled: false,
          onChangeValue: () {},
          type: CustomTextFieldType.text,
          status: CustomTextFieldStatus.error,
          placeholder: 'Placeholder',
          label: 'Label',
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextField(
          disabled: true,
          onChangeValue: () {},
          type: CustomTextFieldType.text,
          status: CustomTextFieldStatus.normal,
          placeholder: 'Placeholder',
          label: 'Label',
        ),
      ],
    ),
  );
}