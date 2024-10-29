import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/app_bar.dart';
import 'package:flutter_revo_boilerplate/components/avatar_button.dart';
import 'package:flutter_revo_boilerplate/components/icon_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'TopBar v1', type: CustomAppBar)
Widget buildAppBarUseCase(BuildContext context) {
  return Column(
    children: [
      const CustomAppBar(
        title: 'MC2',
      ),
      const SizedBox(
        height: 50,
      ),
      const CustomAppBar(
        title: 'MC2',
        actions: [
          CustomAvatarButton(size: CustomAvatarButtonSize.s)
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      CustomAppBar(
        title: 'MC2',
        actions: [
          CustomIconButton(
            icon: Icons.chat,
            onPressed: () {},
          ),
          const CustomAvatarButton(size: CustomAvatarButtonSize.s)
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      CustomAppBar(
        title: '',
        onPressBack: () {},
        actions: const [
          CustomAvatarButton(size: CustomAvatarButtonSize.s)
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      CustomAppBar(
        title: '',
        onPressBack: () {},
        actions: [],
      ),
    ],
  );
}