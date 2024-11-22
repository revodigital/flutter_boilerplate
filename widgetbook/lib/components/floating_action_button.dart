import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/floating_action_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Floating Action Button', type: CustomFloatingActionButton)
Widget buildIconButtonUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    floatingActionButton: CustomFloatingActionButton(
      label: context.knobs.string(label: 'Button Label', initialValue: 'Ciao'),
      type: context.knobs.list(label: 'Button Type', options: CustomFloatingActionButtonType.values),
      fit: context.knobs.list(label: 'Button Fit', options: CustomFloatingActionButtonFit.values),
      isLoading: context.knobs.boolean(label: 'Button Loading', initialValue: false),
      disabled: context.knobs.boolean(label: 'Button Disabled', initialValue: false),
      iconLeft: context.knobs.listOrNull(label: 'Button Icon Left', options: [Icons.add, Icons.arrow_left], initialOption: Icons.add,),
      iconRight: context.knobs.listOrNull(label: 'Button Icon Right', options: [Icons.add, Icons.arrow_right], initialOption: null),
      onPressed: () {
      },
    ),
  );
}