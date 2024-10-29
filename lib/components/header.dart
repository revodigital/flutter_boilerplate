import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/components/icon_button.dart';
import 'package:flutter_revo_boilerplate/components/tag.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final IconData? icon;
  final Function? onPress;
  final CustomTag? tag;
  final Widget? dropdownIcon;

  const CustomHeader({
    super.key,
    required this.title,
    this.icon,
    this.onPress,
    this.tag,
    this.dropdownIcon,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Adaptive.px(24), right: Adaptive.px(16), top: tag != null ? 0 : icon != null ? Adaptive.px(10) : Adaptive.px(16), bottom: icon != null ? Adaptive.px(10) : Adaptive.px(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tag != null) ...[
            CustomTag(type: tag!.type, label: tag!.label),
            SizedBox(height: Adaptive.px(16),)
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    title,
                    style: CustomTypography.title[1]!.copyWith(
                        color: titleColor ?? CustomColors.text[20]
                    ),
                  ),
                ),
              ),
              if (icon != null || dropdownIcon != null) ...[
                if (dropdownIcon != null) dropdownIcon!
                else CustomIconButton(icon: icon!, onPressed: () {onPress!();})
              ]
            ],
          )
        ],
      ),
    );
  }

}