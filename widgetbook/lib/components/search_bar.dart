import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/search_bar.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'SearchBar', type: CustomSearchBar)
Widget buildSearchBarUseCase(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        CustomSearchBar(
          label: 'Label',
          onValueChange: (t) {},
          leadingWidget: Icon(
            Icons.search,
            size: 18,
            color: CustomColors.neutral[60],
          ),
          actionWidget: Icon(
            Icons.close,
            size: 18,
            color: CustomColors.neutral[60],
          ),
        ),
      ],
    ),
  );
}