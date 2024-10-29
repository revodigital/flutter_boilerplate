import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/chip.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Chip', type: CustomChip)
Widget buildChipUseCase(BuildContext context) {
  return Column(
    children: [
      CustomChip(
        label: 'Test',
        value: '',
        onPressed: () {},
        isActive: false,
      ),
      Container(
        height: 50,
      ),
      CustomChip(
        label: 'Test',
        value: '',
        onPressed: () {},
        isActive: true,
      ),
    ],
  );
}