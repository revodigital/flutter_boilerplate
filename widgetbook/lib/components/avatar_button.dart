import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/avatar_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Avatar Button', type: CustomAvatarButton)
Widget buildAvatarButtonUseCase(BuildContext context) {
  return const Column(
    children: [
      Row(
        children: [
          CustomAvatarButton(
            size: CustomAvatarButtonSize.s,
          ),
          CustomAvatarButton(
            size: CustomAvatarButtonSize.s,
            imageUrl: 'https://plus.unsplash.com/premium_photo-1663840344832-2b69b167acd7?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ],
      ),
      SizedBox(
        height: 50,
      ),
      Row(
        children: [
          CustomAvatarButton(
            size: CustomAvatarButtonSize.m,
          ),
          CustomAvatarButton(
            size: CustomAvatarButtonSize.m,
            imageUrl: 'https://plus.unsplash.com/premium_photo-1663840344832-2b69b167acd7?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ],
      ),
      SizedBox(
        height: 50,
      ),
      Row(
        children: [
          CustomAvatarButton(
            size: CustomAvatarButtonSize.l,
          ),
          CustomAvatarButton(
            size: CustomAvatarButtonSize.l,
            imageUrl: 'https://plus.unsplash.com/premium_photo-1663840344832-2b69b167acd7?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ],
      ),
    ],
  );
}