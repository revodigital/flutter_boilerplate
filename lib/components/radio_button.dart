import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';

class CustomRadioButton extends StatelessWidget {
  final String groupValue;
  final String activeValue;
  final Function(String? s) onChange;
  final bool? disabled;

  const CustomRadioButton({
    super.key,
    required this.activeValue,
    required this.groupValue,
    required this.onChange,
    this.disabled = false
  });

  @override
  Widget build(BuildContext context) {
    return Radio(
      groupValue: groupValue,
      value: activeValue,
      onChanged: disabled == true ? null : onChange,
      activeColor: disabled == true ? CustomColors.icon.disabled : CustomColors.background.primary.defaultEnabled,
    );
  }
}