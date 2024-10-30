import 'package:flutter/material.dart';
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
                color: CustomColors.neutral(CustomNeutralKeys.k80)
            ),
            color: CustomColors.neutral(CustomNeutralKeys.k100)
        ),
        child: DropdownButton(
          items: disabled ? null : list,
          value: value,
          onChanged: disabled ? null : (dynamic l) {
          },
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16), vertical: Adaptive.px(3)),
          underline: SizedBox(),
          style: CustomTypography.body(CustomBodyKeys.k1Medium),
          hint: Text(
            hint,
            style: CustomTypography.body(CustomBodyKeys.k1Medium).copyWith(
              color: CustomColors.text(CustomTextKeys.k30).withOpacity(0.8)
            ),
          ),
          dropdownColor: CustomColors.neutral(CustomNeutralKeys.k100),
          icon: iconWidget,
        ),
      ),
    );
  }
}