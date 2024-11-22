import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/badge.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Badge', type: CustomBadge)
Widget buildSearchBarUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        CustomBadge(
          number: context.knobs.int.input(label: 'CustomBadge Number', initialValue: 3),
          type: context.knobs.list(label: 'CustomBadge Type', options: CustomBadgeType.values)
        ),
      ],
    ),
  );
}