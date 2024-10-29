import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomAvatarButtonSize {
  s,
  m,
  l
}

class CustomAvatarButton extends StatelessWidget {
  final String? imageUrl;
  final Function? onPress;
  final CustomAvatarButtonSize size;

  const CustomAvatarButton({
    super.key,
    this.imageUrl,
    this.onPress,
    required this.size
  });

  Size buildSize () {
    switch (size) {
      case CustomAvatarButtonSize.s:
        return Size(Adaptive.px(32), Adaptive.px(32));
      case CustomAvatarButtonSize.m:
        return Size(Adaptive.px(56), Adaptive.px(56));
      case CustomAvatarButtonSize.l:
        return Size(Adaptive.px(145), Adaptive.px(145));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: size == CustomAvatarButtonSize.s ? EdgeInsets.all(Adaptive.px(8)) : null,
      child: GestureDetector(
        onTap: onPress != null ? () => onPress!() : null,
        child: imageUrl != null && imageUrl != '' && imageUrl != 'null' ?
        Container(
          width: buildSize().width,
          height: buildSize().height,
          decoration: BoxDecoration(
            color: CustomColors.neutral[95],
            borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(99))),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(99))),
            child: Image.network(
              imageUrl!,
              width: buildSize().width,
              height: buildSize().height,
              fit: BoxFit.cover,
            ),
          ),
        ) :
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(99))),
            color: CustomColors.neutral[95],
          ),
          width: buildSize().width,
          height: buildSize().height,
          child: Icon(
            FontAwesomeIcons.user,
            size: size == CustomAvatarButtonSize.s ? Adaptive.px(20) : size == CustomAvatarButtonSize.m ? Adaptive.px(32) : Adaptive.px(82),
            color: CustomColors.text[40],
          ),
        ),
      ),
    );
  }
}