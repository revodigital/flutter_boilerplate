import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/components/calendar_modal.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomModalSelectionButton extends StatelessWidget {
  final List<DropdownMenuItem> list;
  final String? value;
  final Function onChange;
  final bool disabled;
  final String hint;
  final Widget iconWidget;

  const CustomModalSelectionButton({
    super.key,
    required this.list,
    required this.onChange,
    required this.disabled,
    this.value,
    required this.hint,
    required this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.8 : 1,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(4))),
            border: Border.all(
                width: Adaptive.px(Adaptive.px(1)),
                color: CustomColors.neutral[80]!
            ),
            color: CustomColors.neutral[100]
        ),
        child: DropdownButton(
          items: disabled ? null : list,
          value: value,
          onChanged: disabled ? null : (dynamic l) {
          },
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16), vertical: Adaptive.px(3)),
          underline: SizedBox(),
          style: CustomTypography.body['1-medium'],
          hint: Text(
            hint,
            style: CustomTypography.body['1-medium']!.copyWith(
              color: CustomColors.text[30]!.withOpacity(0.8)
            ),
          ),
          dropdownColor: CustomColors.neutral[100],
          icon: iconWidget,
        ),
      ),
    );
  }
}