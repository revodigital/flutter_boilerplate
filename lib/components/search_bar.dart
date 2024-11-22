import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSearchBar extends StatefulWidget {
  final String placeholder;
  final Widget leadingWidget;
  final TextEditingController? controller;
  final Function(String) onValueChange;
  final bool? disabled;

  const CustomSearchBar({
    super.key,
    required this.placeholder,
    required this.leadingWidget,
    required this.onValueChange,
    this.controller,
    this.disabled,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBar();
}

class _CustomSearchBar extends State<CustomSearchBar> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();
  Color _bgColor = CustomSearchBarColors.defaultt.bgEnabled;

  @override
  void initState() {
    _focus.addListener(() {
      if(_focus.hasFocus){
        setState(() {
          _bgColor = CustomSearchBarColors.defaultt.bgPressed;
        });
      } else {
        setState(() {
          _bgColor = CustomSearchBarColors.defaultt.bgEnabled;
        });
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(CustomSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller ?? _controller;
    return TextField(
      focusNode: _focus,
      enabled: widget.disabled == true ? false : true,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: CustomTypography.body(CustomBodyKeys.k1Regular).copyWith(
          color: CustomSearchBarColors.defaultt.textEnabled
        ),
        prefixIcon: widget.leadingWidget,
        filled: true,
        fillColor: widget.disabled == true ? CustomSearchBarColors.defaultt.bgDisabled : _bgColor,
        contentPadding: EdgeInsets.all(Adaptive.px(16)),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.disabled == true ? CustomSearchBarColors.defaultt.borderDisabled : CustomSearchBarColors.defaultt.borderEnabled,
          ),
          borderRadius: BorderRadius.circular(Adaptive.px(12))
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.disabled == true ? CustomSearchBarColors.defaultt.borderDisabled : CustomSearchBarColors.defaultt.borderEnabled,
            ),
            borderRadius: BorderRadius.circular(Adaptive.px(12))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomSearchBarColors.defaultt.borderPressed,
            ),
            borderRadius: BorderRadius.circular(Adaptive.px(12))
        )
      ),
      onChanged: (String text) {
        setState(() {});
        widget.onValueChange(text);
      },
      style: CustomTypography.body(CustomBodyKeys.k1Regular).copyWith(
        color: CustomSearchBarColors.defaultt.textPressed
      )
    );
  }
}