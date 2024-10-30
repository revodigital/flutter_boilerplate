import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary Button', type: CustomButton)
Widget buildPrimaryButtonUseCase(BuildContext context) {
  return Column(
    children: [
      CustomButton(
        type: CustomButtonType.primary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.primary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: true,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.primary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: true,
        onPressed: () {
        },
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Secondary Button', type: CustomButton)
Widget buildSecondaryButtonUseCase(BuildContext context) {
  return Column(
    children: [
      CustomButton(
        type: CustomButtonType.secondary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.secondary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: true,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.secondary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: true,
        onPressed: () {
        },
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Tertiary Button', type: CustomButton)
Widget buildTertiaryButtonUseCase(BuildContext context) {
  return Column(
    children: [
      CustomButton(
        type: CustomButtonType.tertiary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.tertiary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: true,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.tertiary,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: true,
        onPressed: () {
        },
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Alert Button', type: CustomButton)
Widget buildAlertButtonUseCase(BuildContext context) {
  return Column(
    children: [
      CustomButton(
        type: CustomButtonType.alert,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.alert,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: true,
        disabled: false,
        onPressed: () {
        },
      ),
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        type: CustomButtonType.alert,
        fit: CustomButtonFit.full,
        label: 'Ciao',
        isLoading: false,
        disabled: true,
        onPressed: () {
        },
      ),
    ],
  );
}