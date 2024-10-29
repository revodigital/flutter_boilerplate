import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/components/calendar_modal.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCalendarButton extends StatelessWidget {
  final List<DateTime>? list;
  final CustomCalendarModalType type;
  final Function onPressButton;
  final bool? disabled;

  const CustomCalendarButton({
    super.key,
    required this.list,
    required this.onPressButton,
    required this.type,
    this.disabled
  });

  String _buildDate () {
    final months = ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'];

    if (list == null) {
      return 'gg/mm/aaaa';
    }

    if (type == CustomCalendarModalType.singleDay) {
      return '${list![0].day}/${list![0].month}/${list![0].year}';
    } else if (type == CustomCalendarModalType.month) {
      return '${months[list![0].month - 1]} ${list![0].year}';
    } else {
      return '${list![0].day}/${list![0].month}/${list![0].year}-${list![1].day}/${list![1].month}/${list![1].year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled == true ? 0.7 : 1,
      child: GestureDetector(
        onTap: () {
          if (disabled == true) {
          } else {
            onPressButton();
          }
        },
        child: Container(
          padding: EdgeInsets.all(Adaptive.px(16)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(4))),
              border: Border.all(
                  width: Adaptive.px(Adaptive.px(1)),
                  color: CustomColors.neutral[80]!
              ),
              color: CustomColors.neutral[100]
          ),
          child: Wrap(
            children: [
              Text(
                _buildDate(),
                style: CustomTypography.body['1-medium']!.copyWith(
                    color: CustomColors.text[list == null ? 40 : 30]!.withOpacity(list == null ? 0.8 : 1)
                ),
              ),
              SizedBox(width: Adaptive.px(12),),
              Icon(
                FontAwesomeIcons.calendar,
                color: CustomColors.text[40],
                size: Adaptive.px(20),
              )
            ],
          ),
        ),
      ),
    );
  }
}