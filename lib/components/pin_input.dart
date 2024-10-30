import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomPinInput extends StatefulWidget {
  final Function onCompleted;

  const CustomPinInput({super.key, required this.onCompleted});

  @override
  State<CustomPinInput> createState() => _CustomPinInput();
}

class _CustomPinInput extends State<CustomPinInput> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color focusedBorderColor = CustomColors.primary(CustomPrimaryKeys.k60);
    Color fillColor = CustomColors.neutral(CustomNeutralKeys.k100);
    Color borderColor = CustomColors.neutral(CustomNeutralKeys.k80);

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 72,
      textStyle: CustomTypography.body(CustomBodyKeys.k1Semibold).copyWith(color: CustomColors.neutral(CustomNeutralKeys.k100)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Adaptive.px(4)),
        border: Border.all(color: borderColor),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: pinController,
        focusNode: focusNode,
        length: 6,
        defaultPinTheme: defaultPinTheme,
        separatorBuilder: (index) => SizedBox(width: Adaptive.px(8)),
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          widget.onCompleted(pin);
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            border: Border.all(color: borderColor),
          ),
        ),
      ),
    );
  }
}