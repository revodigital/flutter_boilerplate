import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomFilterButtonType {
  position,
  normal
}

class CustomFilterButton extends StatelessWidget {
  final CustomFilterButtonType type;
  final String label;
  final Function onPress;

  const CustomFilterButton({
    super.key,
    required this.type,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: EdgeInsets.all(Adaptive.px(12)),
        decoration: BoxDecoration(
            color: CustomColors.neutral(CustomNeutralKeys.k100),
            border: Border.all(
                color: CustomColors.neutral(CustomNeutralKeys.k80),
                width: Adaptive.px(1)
            ),
            borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(8)))
        ),
        child: Row(
          children: [
            if (type == CustomFilterButtonType.position) ...[
              Icon(
                Icons.location_on_outlined,
                color: CustomColors.primary(CustomPrimaryKeys.k40),
                size: Adaptive.px(18),
              ),
              SizedBox(width: Adaptive.px(8),)
            ],
            Text(
              label,
              style: CustomTypography.body(CustomBodyKeys.k2Bold).copyWith(
                  color: CustomColors.neutral(CustomNeutralKeys.k100)
              ),
            ),
            if (type == CustomFilterButtonType.normal) ...[
              SizedBox(width: Adaptive.px(8),),
              Icon(
                Icons.keyboard_arrow_down,
                color: CustomColors.neutral(CustomNeutralKeys.k100),
                size: Adaptive.px(18),
              ),
            ],
          ],
        ),
      ),
    );
  }
}