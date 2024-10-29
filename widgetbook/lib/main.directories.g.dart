// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/components/app_bar.dart' as _i2;
import 'package:widgetbook_workspace/components/avatar_button.dart' as _i3;
import 'package:widgetbook_workspace/components/button.dart' as _i4;
import 'package:widgetbook_workspace/components/chip.dart' as _i5;
import 'package:widgetbook_workspace/components/header.dart' as _i6;
import 'package:widgetbook_workspace/components/icon_button.dart' as _i7;
import 'package:widgetbook_workspace/components/search_bar.dart' as _i8;
import 'package:widgetbook_workspace/components/tag.dart' as _i9;
import 'package:widgetbook_workspace/components/text_field.dart' as _i10;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'CustomAppBar',
        useCase: _i1.WidgetbookUseCase(
          name: 'TopBar v1',
          builder: _i2.buildAppBarUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CustomAvatarButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Avatar Button',
          builder: _i3.buildAvatarButtonUseCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'CustomButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Alert Button',
            builder: _i4.buildAlertButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Primary Button',
            builder: _i4.buildPrimaryButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Secondary Button',
            builder: _i4.buildSecondaryButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Tertiary Button',
            builder: _i4.buildTertiaryButtonUseCase,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CustomChip',
        useCase: _i1.WidgetbookUseCase(
          name: 'Chip',
          builder: _i5.buildChipUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CustomHeader',
        useCase: _i1.WidgetbookUseCase(
          name: 'Tag',
          builder: _i6.buildTagUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CustomIconButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Icon Button',
          builder: _i7.buildIconButtonUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CustomSearchBar',
        useCase: _i1.WidgetbookUseCase(
          name: 'SearchBar',
          builder: _i8.buildSearchBarUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CustomTag',
        useCase: _i1.WidgetbookUseCase(
          name: 'Tag',
          builder: _i9.buildTagUseCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'CustomTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Text Field with Icon',
            builder: _i10.buildTextFieldWithIconUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Text Field without Icon',
            builder: _i10.buildTextFieldWithoutIconUseCase,
          ),
        ],
      ),
    ],
  )
];
