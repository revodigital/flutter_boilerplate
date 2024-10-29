import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomMessageType {
  normal,
  error
}

class CustomMessage extends StatelessWidget {
  final CustomMessageType type;
  final String title;
  final String description;

  const CustomMessage({
    super.key, 
    required this.type, 
    required this.title, 
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(8))),
        color: type == CustomMessageType.error ? CustomColors.error[30] : CustomColors.neutral[98]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Adaptive.px(12), horizontal: Adaptive.px(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTypography.title[3]!.copyWith(color: type == CustomMessageType.error ? CustomColors.neutral[100] : CustomColors.neutral[30]),
            ),
            SizedBox(height: Adaptive.px(4),),
            Text(
              description,
              style: CustomTypography.body['2-regular']!.copyWith(color: type == CustomMessageType.error ? CustomColors.neutral[100] : CustomColors.neutral[30]),
            )
          ],
        ),
      ),
    );
  }
}