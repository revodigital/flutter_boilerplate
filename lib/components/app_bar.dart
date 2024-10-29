import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double height;
  final Function? onPressBack;
  final Color? color;
  final Color? titleColor;
  final double? paddingTop;
  final double? opacity;
  final bool? closeIcon;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.height = 48,
    this.onPressBack,
    this.color,
    this.paddingTop,
    this.opacity,
    this.closeIcon,
    this.titleColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(Adaptive.px(paddingTop ?? 0) + Adaptive.px(height) + Adaptive.px(actions == null ? 12 : 0));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.px(72 + (paddingTop ?? 0)),
      padding: EdgeInsets.only(left: Adaptive.px(0), right: Adaptive.px(24), top: Adaptive.px(paddingTop ?? 0)),
      decoration: BoxDecoration(
        color: color ?? CustomColors.neutral[98],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: opacity ?? 1,
            child: Row(
              children: [
                onPressBack != null ?
                GestureDetector(
                  onTap: () {
                    onPressBack!();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(padding: EdgeInsets.only(right: Adaptive.px(24), left: Adaptive.px(24), top: Adaptive.px(24), bottom: Adaptive.px(24)), child: Icon(closeIcon == true ? FontAwesomeIcons.xmark : FontAwesomeIcons.arrowLeft, color: titleColor ?? CustomColors.text[40], size: Adaptive.px(20),),),
                ) : Container(),
                Padding(
                  padding: EdgeInsets.only(left: Adaptive.px(24)),
                  child: Text(
                    title ?? '',
                    style: CustomTypography.title[1]!.copyWith(
                        color: titleColor ?? CustomColors.text[40]
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: actions ?? [],
              )
            ],
          )
        ],
      ),
    );
  }
}