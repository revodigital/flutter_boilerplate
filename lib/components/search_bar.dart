// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSearchBar extends StatefulWidget {
  final String label;
  final Widget leadingWidget;
  final Widget? actionWidget;
  final TextEditingController? controller;
  final Function(String) onValueChange;
  final bool? disabled;

  const CustomSearchBar({
    super.key,
    required this.label,
    required this.leadingWidget,
    this.actionWidget,
    required this.onValueChange,
    this.controller,
    this.disabled,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBar();
}

class _CustomSearchBar extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
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
      enabled: widget.disabled == false ? true : false,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: widget.label,
        prefixIcon: widget.leadingWidget,
        fillColor: CustomColors.neutral(CustomNeutralKeys.k100),
        contentPadding: EdgeInsets.all(Adaptive.px(16)),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.neutral(CustomNeutralKeys.k80),
          ),
          borderRadius: BorderRadius.circular(Adaptive.px(4))
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.neutral(CustomNeutralKeys.k80),
            ),
            borderRadius: BorderRadius.circular(Adaptive.px(4))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.primary(CustomPrimaryKeys.k40),
            ),
            borderRadius: BorderRadius.circular(Adaptive.px(4))
        )
      ),
      onChanged: (String text) {
        setState(() {});
        widget.onValueChange(text);
      },
      style: CustomTypography.body(CustomBodyKeys.k1Medium).copyWith(
        color: CustomColors.text(CustomTextKeys.k30)
      ),
    );
  }
}