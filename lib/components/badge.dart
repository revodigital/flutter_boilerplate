import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomBadgeType {
  large,
  small
}

class CustomBadge extends StatelessWidget {
  final int number;
  final CustomBadgeType type;

  const CustomBadge({
    super.key,
    required this.number,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(type == CustomBadgeType.large ? 4 : 2), vertical: Adaptive.px(type == CustomBadgeType.large ? 0 : 2)),
      width: type == CustomBadgeType.large ? null : Adaptive.px(6),
      height: type == CustomBadgeType.large ? null : Adaptive.px(6),
      decoration: BoxDecoration(
        color: CustomColors.background.error.defaultEnabled,
        borderRadius: BorderRadius.all(Radius.circular(99))
      ),
      child: type == CustomBadgeType.large ? Text(
        '${number > 99 ? '99+' : number}',
        style: TextStyle(
          fontSize: Adaptive.px(10),
          fontWeight: FontWeight.w400,
          color: CustomColors.icon.inverse
        ),
        textAlign: TextAlign.center,
      ) : null,
    );
  }
}