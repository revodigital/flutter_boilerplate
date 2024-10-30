import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDocumentCard extends StatelessWidget {
  final String name;
  final Function onPress;

  const CustomDocumentCard({
    super.key,
    required this.name,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.neutral(CustomNeutralKeys.k90),
        border: Border.all(color: CustomColors.neutral(CustomNeutralKeys.k95), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(10)))
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Adaptive.px(16),
        vertical: Adaptive.px(11)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: CustomTypography.body(CustomBodyKeys.k2Semibold).copyWith(
              color: CustomColors.text(CustomTextKeys.k40)
            ),
          ),
          Icon(
            FontAwesomeIcons.download,
            size: Adaptive.px(20),
            color: CustomColors.text(CustomTextKeys.k40),
          )
        ],
      ),
    );
  }
}