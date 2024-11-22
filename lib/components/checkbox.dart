import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? value;
  final Function(bool? b) onChange;
  final bool? disabled;

  const CustomCheckbox({
    super.key,
    this.value,
    required this.onChange,
    this.disabled = false
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckbox();
}

class _CustomCheckbox extends State<CustomCheckbox> {
  bool? _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  void onChange(bool? b) {
    _value = b;
    setState(() {});
    widget.onChange(b);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _value,
      tristate: true,
      onChanged: widget.disabled == true ? null : onChange,
      activeColor: widget.disabled == true ? CustomColors.icon.disabled : CustomColors.background.primary.defaultEnabled,
      checkColor: CustomColors.icon.inverse,
      side: BorderSide(
        width: Adaptive.px(2),
        color: widget.disabled == true? CustomColors.border.disabled : CustomColors.grey.k700
      ),
    );
  }
}