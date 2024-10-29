import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAccordion extends StatefulWidget {
  final String title;
  final String description;

  const CustomAccordion({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<CustomAccordion> createState() => _CustomAccordion();
}

class _CustomAccordion extends State<CustomAccordion> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showContent = !_showContent;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                _showContent ? Icons.keyboard_arrow_down_outlined: Icons.keyboard_arrow_right_outlined,
                size: Adaptive.px(24),
                color: CustomColors.neutral[10],
              ),
              SizedBox(
                width: Adaptive.px(8),
              ),
              Text(
                widget.title,
                style: CustomTypography.body['2-semibold']!.copyWith(
                    color: CustomColors.neutral[10]
                ),
              )
            ],
          ),
          _showContent ?
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: Adaptive.px(10)),
              child: Text(
                widget.description,
                style: CustomTypography.body['2-regular']!.copyWith(
                    color: CustomColors.neutral[30]
                ),
              ),
            ),
          )
              :
          Container()
        ]
      ),
    );
  }
}