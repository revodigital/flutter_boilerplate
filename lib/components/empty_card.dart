import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/colors.dart';
import '../utils/typography.dart';

enum CustomEmptyCardType {
  full,
  onlyTitle,
  onlyDescription
}

class CustomEmptyCard extends StatelessWidget {
  final CustomEmptyCardType type;
  final String title;
  final String description;
  final Widget? icon;
  final List<Widget>? buttons;
  final TextAlign? textAlign;

  const CustomEmptyCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    required this.type,
    this.buttons,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon!,
          SizedBox(height: Adaptive.px(type == CustomEmptyCardType.full || type == CustomEmptyCardType.onlyTitle ? 32 : 16),),
        ],
        if (type == CustomEmptyCardType.full || type == CustomEmptyCardType.onlyTitle) Text(
          title,
          style: CustomTypography.title(CustomTitleKeys.k3),
        ),
        SizedBox(height: Adaptive.px(type == CustomEmptyCardType.full ? 8 : 0),),
        if (type == CustomEmptyCardType.full || type == CustomEmptyCardType.onlyDescription) Text(
          description,
          style: CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(
              color: CustomColors.text(CustomTextKeys.k40),
          ),
          textAlign: textAlign ?? TextAlign.center,
        ),
        SizedBox(height: Adaptive.px(buttons != null ? 32 : 0),),
        if (buttons != null) ...buttons!,
      ],
    );
  }
}