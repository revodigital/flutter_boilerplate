import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomListTile extends StatelessWidget {
  final String label;
  final Function onPress;
  final IconData? iconData;

  const CustomListTile({
    super.key,
    required this.label,
    required this.onPress,
    this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Adaptive.px(16)),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: Adaptive.px(1),
              color: CustomColors.neutral[80]!
            )
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconData != null) ...[
                  Icon(
                    iconData,
                    size: Adaptive.px(20),
                    color: CustomColors.text[40],
                  ),
                  SizedBox(width: Adaptive.px(12),)
                ],
                Text(
                  label,
                  style: CustomTypography.body['1-semibold']!.copyWith(
                    color: CustomColors.text[40]
                  ),
                )
              ],
            ),
            Icon(
              FontAwesomeIcons.angleRight,
              size: Adaptive.px(20),
              color: CustomColors.text[40],
            ),
          ],
        ),
      ),
    );
  }
}