import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/button.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomMessageDialogConfirmType {
  primary,
  alert
}

class CustomMessageDialog extends StatefulWidget {
  final String title;
  final String dismissLabel;
  final Function onDismiss;
  final String confirmLabel;
  final CustomMessageDialogConfirmType confirmType;
  final Function onConfirm;

  const CustomMessageDialog({
    super.key,
    required this.title,
    required this.dismissLabel,
    required this.confirmLabel,
    required this.confirmType,
    required this.onDismiss,
    required this.onConfirm,
  });

  @override
  State<CustomMessageDialog> createState() => _CustomMessageDialog();
}

class _CustomMessageDialog extends State<CustomMessageDialog> {
  bool buttonLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Adaptive.px(20)), side: BorderSide(color: CustomColors.neutral(CustomNeutralKeys.k90), width: 1)),
      insetPadding: EdgeInsets.all(Adaptive.px(24)),
      child: Container(
        width: double.infinity,
        padding:  EdgeInsets.all(Adaptive.px(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: CustomTypography.title(CustomTitleKeys.k3).copyWith(
                  color: CustomColors.text(CustomTextKeys.k20)
              ),
            ),
            SizedBox(height: Adaptive.px(24),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                    type: CustomButtonType.tertiary,
                    fit: CustomButtonFit.fit,
                    label: widget.dismissLabel,
                    isLoading: false,
                    onPressed: () {
                      widget.onDismiss();
                    }
                ),
                CustomButton(
                    type: widget.confirmType == CustomMessageDialogConfirmType.alert ? CustomButtonType.alert : CustomButtonType.primary,
                    fit: CustomButtonFit.fit,
                    label: widget.confirmLabel,
                    isLoading: buttonLoading,
                    onPressed: () {
                      buttonLoading = true;
                      setState(() {});
                      widget.onConfirm();
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}