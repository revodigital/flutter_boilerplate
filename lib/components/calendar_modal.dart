import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/components/button.dart';
import 'package:flutter_revo_boilerplate/components/chip.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/colors.dart';
import '../utils/typography.dart';
import 'icon_button.dart';

enum CustomCalendarModalType {
  singleDay,
  multipleDay,
  month
}

class CustomCalendarModal extends StatefulWidget {
  final DateTime firstDate;
  final DateTime currentDate;
  final DateTime lastDate;
  final Function onConfirm;
  final CustomCalendarModalType type;
  final List<DateTime> initialValues;

  const CustomCalendarModal({
    super.key,
    required this.firstDate,
    required this.currentDate,
    required this.lastDate,
    required this.onConfirm,
    required this.type,
    required this.initialValues
  });

  @override
  State<CustomCalendarModal> createState() => _CustomCalendarModal();
}

class _CustomCalendarModal extends State<CustomCalendarModal> {
  final _months = ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'];
  final _days = ['D', 'L', 'M', 'M', 'G', 'V', 'S'];

  List<DateTime> _values = [];

  @override
  void initState() {
    _values = widget.initialValues;
    super.initState();
  }
  
  List<DateTime> _buildMonthList () {
    List<DateTime> dates = [];
    int index = widget.lastDate.year - widget.firstDate.year;
    
    for (int i = 0; i <= index; i++) {
      DateTime initialDate = DateTime.parse('2024-01-01');
      initialDate = DateTime.parse('${initialDate.year + i}-01-01');
      dates.add(initialDate);
    }

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Adaptive.px(99)), topRight: Radius.circular(Adaptive.px(99))),
        color: CustomColors.neutral(CustomNeutralKeys.k100),
      ),
      padding: EdgeInsets.all(Adaptive.px(16)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.type == CustomCalendarModalType.month ? 'Seleziona un mese' : widget.type == CustomCalendarModalType.multipleDay ? 'Seleziona un range settimanale' : 'Seleziona un giorno',
                style: CustomTypography.title(CustomTitleKeys.k3).copyWith(
                    color: CustomColors.text(CustomTextKeys.k20)
                ),
              ),
              CustomIconButton(
                  icon: FontAwesomeIcons.xmark,
                  onPressed: (){
                    Navigator.pop(context);
                  }
              )
            ],
          ),
          SizedBox(height: Adaptive.px(16),),
          SizedBox(
            height: Adaptive.px(600),
            child: widget.type == CustomCalendarModalType.month ? SingleChildScrollView(
              child: Column(
                children: _buildMonthList().map((i) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: Adaptive.px(24),),
                          Text(
                            '${i.year}'.toLowerCase(),
                            textAlign: TextAlign.left,
                            style: CustomTypography.body(CustomBodyKeys.k2Semibold).copyWith(
                                color: CustomColors.text(CustomTextKeys.k40)
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Adaptive.px(8),),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Adaptive.px(12)),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: Adaptive.px(12),
                          runSpacing: Adaptive.px(12),
                          alignment: WrapAlignment.center,
                          direction: Axis.horizontal,
                          children: _months.map((it) {
                            return CustomChip(
                                label: it.toLowerCase(),
                                value: it,
                                isActive: _values.isNotEmpty && _months[_values[0].month - 1] == it && _values[0].year == i.year,
                                onPressed: (mo) {
                                  _values.clear();
                                  String month = (_months.indexOf(it) + 1).toString();
                                  _values.add(DateTime.parse('${i.year}-${month.length == 1 ? '0$month' : month}-01'));
                                  setState(() {});
                                }
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: Adaptive.px(24),),
                    ],
                  );
                }).toList(),
              ),
            ) : CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  allowSameValueSelection: false,
                  calendarType: widget.type == CustomCalendarModalType.month ? CalendarDatePicker2Type.single : widget.type == CustomCalendarModalType.multipleDay ? CalendarDatePicker2Type.range : CalendarDatePicker2Type.single,
                  calendarViewMode: CalendarDatePicker2Mode.scroll,
                  weekdayLabelBuilder: ({bool? isScrollViewTopHeader, required int weekday}) {
                    return Text(
                      _days[weekday],
                      style: CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(
                        color: CustomColors.text(CustomTextKeys.k40)
                      ),
                    );
                  },
                  scrollViewMonthYearBuilder: (DateTime d) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: Adaptive.px(24),),
                        Text(
                          '${_months[d.month - 1]} ${d.year}'.toLowerCase(),
                          textAlign: TextAlign.left,
                          style: CustomTypography.body(CustomBodyKeys.k2Semibold).copyWith(
                            color: CustomColors.text(CustomTextKeys.k40)
                          ),
                        )
                      ],
                    );
                  },
                  hideScrollViewTopHeaderDivider: true,
                  hideScrollViewMonthWeekHeader: true,
                  lastDate: widget.lastDate,
                  firstDate: widget.firstDate,
                  currentDate: widget.currentDate,
                  selectedDayHighlightColor: CustomColors.primary(CustomPrimaryKeys.k40),
                  selectedRangeHighlightColor: CustomColors.neutral(CustomNeutralKeys.k90),
                  dayBorderRadius: BorderRadius.zero,
                  daySplashColor: CustomColors.neutral(CustomNeutralKeys.k70),
                  dayMaxWidth: Adaptive.px(48)
                ),
                onValueChanged: (List<DateTime> l) {
                  _values = l;
                  setState(() {});
                },
                value: _values,
            ),
          ),
          CustomButton(
            type: CustomButtonType.primary,
            fit: CustomButtonFit.full,
            label: 'Conferma',
            isLoading: false,
            disabled: _values.isEmpty,
            onPressed: () {
              Navigator.of(context).pop();
              widget.onConfirm(_values);
            }
          )
        ],
      ),
    );
  }
}

class CustomCalendarTransactionModal extends StatefulWidget {
  final DateTime firstDate;
  final DateTime currentDate;
  final DateTime lastDate;
  final Function onConfirm;
  final Function onReset;
  final List<DateTime> initialValues;

  const CustomCalendarTransactionModal({
    super.key,
    required this.firstDate,
    required this.currentDate,
    required this.lastDate,
    required this.onConfirm,
    required this.initialValues,
    required this.onReset
  });

  @override
  State<CustomCalendarTransactionModal> createState() => _CustomCalendarTransactionModal();
}

class _CustomCalendarTransactionModal extends State<CustomCalendarTransactionModal> {
  final _months = ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'];
  final _days = ['D', 'L', 'M', 'M', 'G', 'V', 'S'];

  List<DateTime> _values = [];

  @override
  void initState() {
    _values = widget.initialValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Adaptive.px(99)), topRight: Radius.circular(Adaptive.px(99))),
        color: CustomColors.neutral(CustomNeutralKeys.k100),
      ),
      padding: EdgeInsets.all(Adaptive.px(16)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Seleziona un giorno',
                style: CustomTypography.title(CustomTitleKeys.k3).copyWith(
                    color: CustomColors.text(CustomTextKeys.k20)
                ),
              ),
              CustomIconButton(
                icon: FontAwesomeIcons.xmark,
                onPressed: (){
                  Navigator.pop(context);
                }
              )
            ],
          ),
          SizedBox(height: Adaptive.px(16),),
          SizedBox(
            height: Adaptive.px(600),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                  allowSameValueSelection: false,
                  calendarType: CalendarDatePicker2Type.single,
                  calendarViewMode: CalendarDatePicker2Mode.scroll,
                  weekdayLabelBuilder: ({bool? isScrollViewTopHeader, required int weekday}) {
                    return Text(
                      _days[weekday],
                      style: CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(
                          color: CustomColors.text(CustomTextKeys.k40)
                      ),
                    );
                  },
                  scrollViewMonthYearBuilder: (DateTime d) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: Adaptive.px(24),),
                        Text(
                          '${_months[d.month - 1]} ${d.year}'.toLowerCase(),
                          textAlign: TextAlign.left,
                          style: CustomTypography.body(CustomBodyKeys.k2Semibold).copyWith(
                              color: CustomColors.text(CustomTextKeys.k40)
                          ),
                        )
                      ],
                    );
                  },
                  hideScrollViewTopHeaderDivider: true,
                  hideScrollViewMonthWeekHeader: true,
                  lastDate: widget.lastDate,
                  firstDate: widget.firstDate,
                  currentDate: widget.currentDate,
                  selectedDayHighlightColor: CustomColors.primary(CustomPrimaryKeys.k40),
                  selectedRangeHighlightColor: CustomColors.neutral(CustomNeutralKeys.k90),
                  dayBorderRadius: BorderRadius.zero,
                  daySplashColor: CustomColors.neutral(CustomNeutralKeys.k70),
                  dayMaxWidth: Adaptive.px(48)
              ),
              onValueChanged: (List<DateTime> l) {
                _values = l;
                setState(() {});
              },
              value: _values,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                  type: CustomButtonType.tertiary,
                  fit: CustomButtonFit.fit,
                  label: 'Resetta filtro',
                  isLoading: false,
                  disabled: false,
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onReset();
                  }
              ),
              CustomButton(
                type: CustomButtonType.primary,
                fit: CustomButtonFit.fit,
                label: 'Conferma',
                isLoading: false,
                disabled: _values.isEmpty,
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.onConfirm(_values);
                }
              )
            ],
          )
        ],
      ),
    );
  }
}