import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_revo_boilerplate/components/button.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomTextFieldStatus {
  normal,
  error
}

enum CustomTextFieldType {
  email,
  password,
  text,
  numeric,
  multiline
}

class CustomTextField extends StatefulWidget {
  final String? initialValue;
  final String? label;
  final String? helpText;
  final String? placeholder;
  final IconData? icon;
  final Widget? iconAsWidget;
  final bool disabled;
  final CustomTextFieldType type;
  final Function onChangeValue;
  final CustomTextFieldStatus status;
  final bool? required;
  final String? buttonLabel;
  final Function? onPressButton;
  final IconData? prefixIcon;
  final Widget? prefixIconAsWidget;

  const CustomTextField({
    super.key,
    this.label,
    required this.disabled,
    required this.onChangeValue,
    this.initialValue,
    required this.type,
    required this.status,
    this.helpText,
    this.icon,
    this.required = false,
    this.placeholder,
    this.buttonLabel,
    this.onPressButton,
    this.iconAsWidget,
    this.prefixIcon,
    this.prefixIconAsWidget
  });

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialValue ?? '';
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  widget.required == true ? Text(
                    '* ',
                    style: CustomTypography.body['2-semibold']!.copyWith(color: CustomColors.text[40]),
                  ) : Container(),
                  Text(
                    widget.label!,
                    style: CustomTypography.body['2-semibold']!.copyWith(color: CustomColors.text[40]),
                  )
                ],
              ),
              if (widget.buttonLabel != null && widget.onPressButton != null) ...[
                CustomButton(
                    type: CustomButtonType.tertiary,
                    fit: CustomButtonFit.fit,
                    label: widget.buttonLabel!,
                    isLoading: false,
                    onPressed: () {
                      widget.onPressButton!();
                    }
                )
              ]
            ],
          ),
          SizedBox(height: Adaptive.px(8)),
        ],
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return TextField(
              controller: _controller,
              focusNode: _focusNode,
              minLines: widget.type == CustomTextFieldType.multiline ? 4 : null,
              maxLines: widget.type == CustomTextFieldType.multiline ? 4 : 1,
              obscureText: widget.type == CustomTextFieldType.password ? _obscureText : false,
              autocorrect: widget.type == CustomTextFieldType.password ? false : true,
              keyboardType: widget.type == CustomTextFieldType.multiline ? TextInputType.multiline : widget.type == CustomTextFieldType.email ? TextInputType.emailAddress : widget.type == CustomTextFieldType.numeric ? TextInputType.number : TextInputType.text,
              textCapitalization: widget.type == CustomTextFieldType.email ? TextCapitalization.none : TextCapitalization.sentences,
              onChanged: (String? text) {
                widget.onChangeValue(text);
              },
              enabled: !widget.disabled,
              style: CustomTypography.body['1-medium']!.copyWith(color: CustomColors.text[30]),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                contentPadding: EdgeInsets.fromLTRB(Adaptive.px(16), Adaptive.px(16), Adaptive.px(16), Adaptive.px(16)),
                fillColor: widget.disabled ? CustomColors.neutral[98] : CustomColors.neutral[100],
                filled: true,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.status == CustomTextFieldStatus.normal ? CustomColors.neutral[80]! : CustomColors.error[30]!,
                  ),
                  borderRadius: BorderRadius.circular(Adaptive.px(4))
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.status == CustomTextFieldStatus.normal ? CustomColors.neutral[80]! : CustomColors.error[30]!,
                  ),
                  borderRadius: BorderRadius.circular(Adaptive.px(4))
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.status == CustomTextFieldStatus.normal ? CustomColors.neutral[80]! : CustomColors.error[30]!,
                  ),
                  borderRadius: BorderRadius.circular(Adaptive.px(4))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.primary[40]!,
                  ),
                  borderRadius: BorderRadius.circular(Adaptive.px(4))
                ),
                prefixIcon: widget.prefixIconAsWidget != null ? widget.prefixIconAsWidget! : widget.prefixIcon != null ? Icon(
                  widget.prefixIcon,
                  color: widget.status == CustomTextFieldStatus.normal ? CustomColors.text[30]! : CustomColors.error[30]!,
                ) : null,
                suffixIcon: widget.type == CustomTextFieldType.password
                    ? IconButton(
                  icon: Icon(
                    _obscureText ? FontAwesomeIcons.lightEyeSlash : FontAwesomeIcons.lightEye,
                    color: widget.status == CustomTextFieldStatus.normal ? CustomColors.text[40]! : CustomColors.error[30]!,
                    size: Adaptive.px(20),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                    : widget.iconAsWidget != null ? widget.iconAsWidget! : widget.icon != null ? Icon(
                  widget.icon,
                  color: widget.status == CustomTextFieldStatus.normal ? CustomColors.text[30]! : CustomColors.error[30]!,
                ) : null,
              ),
            );
          },
        ),
        widget.helpText != null ?
            Padding(
              padding: EdgeInsets.only(top: Adaptive.px(4)),
              child: Text(widget.helpText ?? '', style: CustomTypography.caption['regular']!.copyWith(color: widget.status == CustomTextFieldStatus.normal ? CustomColors.text[40]! : CustomColors.error[30]!),),
            ) : Container()
      ],
    );
  }
}

enum CustomCreateReviewTextFieldType {
  date,
  price
}

class CustomCreateReviewTextField extends StatefulWidget {
  final String? initialValue;
  final String placeholder;
  final IconData? suffixIcon;
  final bool disabled;
  final CustomCreateReviewTextFieldType type;
  final Function onChangeValue;

  const CustomCreateReviewTextField({
    super.key,
    required this.placeholder,
    required this.disabled,
    required this.onChangeValue,
    this.initialValue,
    required this.type,
    this.suffixIcon,
  });

  @override
  State<CustomCreateReviewTextField> createState() => _CustomCreateReviewTextField();
}

class _CustomCreateReviewTextField extends State<CustomCreateReviewTextField> with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialValue ?? '';
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.px(160),
      child: GestureDetector(
        onTap: (widget.type == CustomCreateReviewTextFieldType.price || widget.disabled) ? null : () async {
          DateTime initialDate = _controller.text.isNotEmpty ? DateTime.parse('${_controller.text.split('/')[2]}-${_controller.text.split('/')[1]}-${_controller.text.split('/')[0]}') : DateTime.now();
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1950),
            lastDate: DateTime.now(),
            currentDate: DateTime.now(),
            locale: const Locale.fromSubtags(languageCode: 'it'),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: CustomColors.primary[98]!,
                    primary: CustomColors.primary[50]!
                  ),
                ),
                child: child!,
              );
            }
          );

          if (pickedDate != null) {
            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
            String formattedDate2 = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {_controller.text = formattedDate;});

            widget.onChangeValue(formattedDate2);
          } else {}
        },
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return TextField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
              onChanged: (String? text) {
                widget.onChangeValue(text);
              },
              enabled: (!widget.disabled && widget.type != CustomCreateReviewTextFieldType.date),
              style: CustomTypography.body['1-regular'],
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                contentPadding: EdgeInsets.fromLTRB(Adaptive.px(12), Adaptive.px(7), Adaptive.px(12), Adaptive.px(7)),
                fillColor: widget.disabled ? CustomColors.neutral[100] : CustomColors.neutral[100],
                filled: true,
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.neutral[80]!,
                    ),
                    borderRadius: BorderRadius.circular(Adaptive.px(8))
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.neutral[80]!,
                    ),
                    borderRadius: BorderRadius.circular(Adaptive.px(8))
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.neutral[80]!,
                    ),
                    borderRadius: BorderRadius.circular(Adaptive.px(8))
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.primary[40]!,
                    ),
                    borderRadius: BorderRadius.circular(Adaptive.px(8))
                ),
                suffixIcon: widget.type == CustomCreateReviewTextFieldType.price
                    ? Icon(
                  Icons.euro,
                  color: CustomColors.neutral[20]!,
                  size: Adaptive.px(15),
                )
                    : widget.suffixIcon != null ? Icon(
                  widget.suffixIcon,
                  color: CustomColors.neutral[20]!,
                  size: Adaptive.px(15),
                ) : null,
              ),
            );
          },
        ),
      ),
    );
  }
}