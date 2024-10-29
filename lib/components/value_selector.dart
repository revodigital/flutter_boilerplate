import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomValueSelectorType {
  slider,
  dot
}

class CustomValueSelector extends StatelessWidget {
  final int maxValue;
  final int minValue;
  final double activeValue;
  final CustomValueSelectorType type;
  final Function onChange;

  const CustomValueSelector({
    super.key,
    required this.maxValue,
    required this.onChange,
    required this.type,
    required this.activeValue,
    required this.minValue
  });

  @override
  Widget build(BuildContext context) {
    final list = List.filled(maxValue, Container());
    if (type == CustomValueSelectorType.dot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list.asMap().entries.map<Widget>((e) =>
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    onChange(e.key + 1);
                  },
                  child: Container(
                    width: Adaptive.px(24),
                    height: Adaptive.px(24),
                    decoration: BoxDecoration(
                        color: activeValue >= (e.key + 1) ? CustomColors.primary[50]! : CustomColors.neutral[100]!,
                        borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(100))),
                        border: Border.all(color: CustomColors.primary[50]!, width: Adaptive.px(1))
                    ),
                  ),
                ),
                SizedBox(width: Adaptive.px(12),)
              ],
            )
        ).toList(),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            activeValue.toString(),
            style: CustomTypography.body['2-bold']!.copyWith(
              color: CustomColors.primary[50]
            ),
          ),
          SizedBox(width: Adaptive.px(8),),
          SizedBox(
            width: Adaptive.px(200),
            child: Slider(
              activeColor: CustomColors.primary[50]!,
              min: minValue.toDouble(),
              max: maxValue.toDouble(),
              value: activeValue,
              divisions: (maxValue - minValue) * 2,
              inactiveColor: CustomColors.neutral[90],
              label: activeValue.toStringAsFixed(1),
              onChanged: (double value) {
                onChange(value);
              },
            ),
          ),
        ],
      );
    }
  }
}