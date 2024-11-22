import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/search_bar.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'SearchBar', type: CustomSearchBar)
Widget buildSearchBarUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        CustomSearchBar(
          placeholder: 'Search text',
          onValueChange: (t) {},
          disabled: context.knobs.booleanOrNull(label: 'SearchBar Disabled', initialValue: false),
          leadingWidget: Icon(
            Icons.search,
            size: 18,
            color: CustomColors.icon.neutral.subtle,
          ),
        ),
      ],
    ),
  );
}