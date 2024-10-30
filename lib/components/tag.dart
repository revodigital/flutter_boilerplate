import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomTagType {
  info,
  warning,
  success,
  utilityWater,
  utilityElectricity,
}

class CustomTag extends StatelessWidget {
  final CustomTagType type;
  final String label;

  const CustomTag({
    super.key,
    required this.type,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    if ([CustomTagType.utilityElectricity, CustomTagType.utilityWater].contains(type)) {
      return Row(
        children: [
          if (type == CustomTagType.utilityElectricity) ...[
            Icon(
              FontAwesomeIcons.plug,
              color: CustomColors.violet(CustomVioletKeys.k50),
              size: Adaptive.px(20),
            )
          ] else ...[
            Icon(
              FontAwesomeIcons.droplet,
              color: CustomColors.blue(CustomBlueKeys.k50),
              size: Adaptive.px(20),
            )
          ],
          SizedBox(width: Adaptive.px(8),),
          Text(
            type == CustomTagType.utilityElectricity ? 'ENERGIA' : 'ACQUA',
            style: CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(
              color: CustomColors.text(CustomTextKeys.k40)
            ),
          )
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: Adaptive.px(4), horizontal: Adaptive.px(12)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(4))),
            color: type == CustomTagType.info ? CustomColors.neutral(CustomNeutralKeys.k95) : type == CustomTagType.warning ? CustomColors.warning(CustomWarningKeys.k30).withOpacity(0.1) : CustomColors.success(CustomSuccessKeys.k30).withOpacity(0.1)
        ),
        child: Text(
          label,
          style: CustomTypography.caption(CustomCaptionKeys.kSemibold).copyWith(
              color: type == CustomTagType.info ? CustomColors.text(CustomTextKeys.k30) : type == CustomTagType.warning ? CustomColors.warning(CustomWarningKeys.k30) : CustomColors.success(CustomSuccessKeys.k30)
          ),
        ),
      );
    }
  }
}