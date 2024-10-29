import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomErrorMessage extends StatelessWidget {
  final String message;
  final bool? isDanger;
  final bool? isInfo;
  final Widget? overrideMessage;

  const CustomErrorMessage({
    super.key,
    required this.message,
    this.isDanger,
    this.isInfo,
    this.overrideMessage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Adaptive.px(16)),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(8))),
        color: isInfo == true ? CustomColors.neutral[95] : isDanger == true ? CustomColors.warning[30]!.withOpacity(0.1) : CustomColors.error[30]!.withOpacity(0.1)
      ),
      child: overrideMessage ?? Text(
        message,
        textAlign: TextAlign.left,
        style: CustomTypography.body['1-semibold']!.copyWith(
            color: isInfo == true ? CustomColors.text[20] : isDanger == true ? CustomColors.warning[30] : CustomColors.error[30]
        ),
      ),
    );
  }
}