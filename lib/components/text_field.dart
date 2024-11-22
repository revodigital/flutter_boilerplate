import 'package:flutter_revo_boilerplate/components/icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final IconData? suffixIcon;
  final Widget? suffixIconAsWidget;
  final bool? disabled;
  final CustomTextFieldType type;
  final Function(String? s) onValueChange;
  final CustomTextFieldStatus status;
  final bool? required;
  final IconData? prefixIcon;
  final Widget? prefixIconAsWidget;
  final Function? onPressIcon;

  const CustomTextField({
    super.key,
    this.label,
    this.disabled = false,
    required this.onValueChange,
    this.initialValue,
    required this.type,
    required this.status,
    this.helpText,
    this.suffixIcon,
    this.required = false,
    this.placeholder,
    this.suffixIconAsWidget,
    this.prefixIcon,
    this.prefixIconAsWidget,
    this.onPressIcon
  });

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();
  Color _bgColor = CustomTextFieldColors.defaultt.bgEnabled;

  Widget? suffixIcon() {
    return widget.type == CustomTextFieldType.password
        ? CustomIconButton(
      icon: _obscureText ? FontAwesomeIcons.lightEyeSlash : FontAwesomeIcons.lightEye,
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      isLoading: false,
      type: CustomIconButtonType.textField,
    )
        : widget.suffixIconAsWidget != null ? widget.suffixIconAsWidget! : widget.suffixIcon != null ? CustomIconButton(
      icon: widget.suffixIcon ?? FontAwesomeIcons.a,
      onPressed: () {
        widget.onPressIcon != null ? widget.onPressIcon!() : null;
      },
      isLoading: false,
      type: CustomIconButtonType.textField,
    ) : null;
  }

  @override
  void initState() {
    _controller.text = widget.initialValue ?? '';
    super.initState();

    _focusNode.addListener(() {
      if(_focusNode.hasFocus){
        setState(() {
          _bgColor = CustomTextFieldColors.defaultt.bgPressed;
        });
      } else {
        setState(() {
          _bgColor = CustomTextFieldColors.defaultt.bgEnabled;
        });
      }
    });
  }

  @override
  void dispose() {
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
                    style: CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(color: CustomColors.text.neutral.subtle),
                  ) : Container(),
                  Text(
                    widget.label!,
                    style: CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(color: CustomColors.text.neutral.subtle),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: Adaptive.px(4)),
        ],
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          minLines: widget.type == CustomTextFieldType.multiline ? 4 : null,
          maxLines: widget.type == CustomTextFieldType.multiline ? 4 : 1,
          obscureText: widget.type == CustomTextFieldType.password ? _obscureText : false,
          autocorrect: widget.type == CustomTextFieldType.password ? false : true,
          keyboardType: widget.type == CustomTextFieldType.multiline ? TextInputType.multiline : widget.type == CustomTextFieldType.email ? TextInputType.emailAddress : widget.type == CustomTextFieldType.numeric ? TextInputType.number : TextInputType.text,
          textCapitalization: widget.type == CustomTextFieldType.email ? TextCapitalization.none : TextCapitalization.sentences,
          onChanged: (String? text) {
            widget.onValueChange(text);
          },
          enabled: widget.disabled != true,
          style: CustomTypography.body(CustomBodyKeys.k1Regular).copyWith(color: CustomColors.text.neutral.defaultt),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: CustomTypography.body(CustomBodyKeys.k1Regular).copyWith(color: CustomColors.text.neutral.subtler),
            contentPadding: EdgeInsets.fromLTRB(Adaptive.px(16), Adaptive.px(16), Adaptive.px(16), Adaptive.px(16)),
            fillColor: widget.disabled == true ? CustomTextFieldColors.defaultt.bgDisabled : _bgColor,
            filled: true,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.status == CustomTextFieldStatus.normal ? CustomTextFieldColors.defaultt.borderDisabled : CustomTextFieldColors.error.borderDisabled,
                ),
                borderRadius: BorderRadius.circular(Adaptive.px(8))
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.status == CustomTextFieldStatus.normal ? CustomTextFieldColors.defaultt.borderEnabled : CustomTextFieldColors.error.borderEnabled,
                ),
                borderRadius: BorderRadius.circular(Adaptive.px(8))
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.status == CustomTextFieldStatus.normal ? CustomTextFieldColors.defaultt.borderEnabled : CustomTextFieldColors.error.borderEnabled,
                ),
                borderRadius: BorderRadius.circular(Adaptive.px(8))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.status == CustomTextFieldStatus.normal ? CustomTextFieldColors.defaultt.borderPressed : CustomTextFieldColors.error.borderPressed,
                ),
                borderRadius: BorderRadius.circular(Adaptive.px(8))
            ),
            prefixIcon: widget.prefixIconAsWidget != null ? widget.prefixIconAsWidget! : widget.prefixIcon != null ? CustomIconButton(
                icon: widget.prefixIcon ?? FontAwesomeIcons.a,
                onPressed: (){},
                type: CustomIconButtonType.textField,
                isLoading: false
            ) : null,
            suffixIcon: widget.status == CustomTextFieldStatus.error ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconButton(
                  icon: FontAwesomeIcons.circleExclamation,
                  onPressed: (){},
                  type: CustomIconButtonType.errorStandard,
                  isLoading: false
                ),
                suffixIcon() ?? Container()
              ],
            ) : suffixIcon(),
          ),
        ),
        widget.helpText != null ?
            Padding(
              padding: EdgeInsets.only(top: Adaptive.px(4)),
              child: Text(widget.helpText ?? '', style: CustomTypography.body(CustomBodyKeys.k3Regular).copyWith(color: widget.status == CustomTextFieldStatus.normal ? CustomTextFieldColors.defaultt.textEnabled : CustomTextFieldColors.error.textEnabled),),
            ) : Container()
      ],
    );
  }
}