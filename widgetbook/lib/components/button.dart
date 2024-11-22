import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Button', type: CustomButton)
Widget buildPrimaryButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: CustomButton(
      label: context.knobs.string(label: 'Button Label', initialValue: 'Ciao'),
      type: context.knobs.list(label: 'Button Type', options: CustomButtonType.values),
      fit: context.knobs.list(label: 'Button Fit', options: CustomButtonFit.values),
      isLoading: context.knobs.boolean(label: 'Button Loading', initialValue: false),
      disabled: context.knobs.boolean(label: 'Button Disabled', initialValue: false),
      iconLeft: context.knobs.listOrNull(label: 'Button Icon Left', options: [Icons.add, Icons.arrow_left], initialOption: null),
      iconRight: context.knobs.listOrNull(label: 'Button Icon Right', options: [Icons.add, Icons.arrow_right], initialOption: null),
      onPressed: () {
      },
    ),
  );
}