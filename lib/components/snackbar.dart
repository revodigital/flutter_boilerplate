import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomSnackbarType {
  normal,
  error
}

class CustomSnackbar {
  static showSnackbar (
      BuildContext context,
      String text,
      Function onClose,
      CustomSnackbarType type
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(4))),
              border: Border.all(
                color: type == CustomSnackbarType.normal ? CustomColors.neutral(CustomNeutralKeys.k90) : CustomColors.error(CustomErrorKeys.k30)
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(Adaptive.px(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    type == CustomSnackbarType.normal ? FontAwesomeIcons.circleCheck : FontAwesomeIcons.circleExclamation,
                    size: Adaptive.px(20),
                    color: type == CustomSnackbarType.normal ? CustomColors.success(CustomSuccessKeys.k30) : CustomColors.neutral(CustomNeutralKeys.k100),
                  ),
                  SizedBox(width: Adaptive.px(8),),
                  Text(
                    text,
                    style: CustomTypography.body(CustomBodyKeys.k2Semibold).copyWith(
                        color: type == CustomSnackbarType.normal ? CustomColors.text(CustomTextKeys.k30) : CustomColors.neutral(CustomNeutralKeys.k100)
                    ),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: type == CustomSnackbarType.normal ? CustomColors.neutral(CustomNeutralKeys.k95) : CustomColors.error(CustomErrorKeys.k30),
          duration: const Duration(seconds: 2),
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(bottom: Adaptive.px(29), left: Adaptive.px(24), right: Adaptive.px(24)),
          behavior: SnackBarBehavior.floating,
          showCloseIcon: false,
        )
    );
    Future.delayed(const Duration(seconds: 2), () {
      onClose();
    });
  }
}