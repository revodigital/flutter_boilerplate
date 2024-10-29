import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomPinInput extends StatefulWidget {
  final Function onCompleted;

  const CustomPinInput({Key? key, required this.onCompleted}) : super(key: key);

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
    Color focusedBorderColor = CustomColors.primary[60]!;
    Color fillColor = CustomColors.neutral[100]!;
    Color borderColor = CustomColors.neutral[80]!;

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 72,
      textStyle: CustomTypography.body['1-semibold']!.copyWith(color: CustomColors.neutral[0]),
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