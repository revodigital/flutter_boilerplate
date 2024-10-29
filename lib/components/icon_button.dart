import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool? disabled;
  final Color? iconColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.disabled,
    this.iconColor,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButton();
}

class _CustomIconButton extends State<CustomIconButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorBgAnimation;
  late Animation<Color?> _colorTextAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    _colorBgAnimation = ColorTween(
        begin: CustomButtonColors.iconBg['enabled'],
        end: (widget.disabled == true) ? CustomButtonColors.iconBg['disabled'] : CustomButtonColors.iconBg['focused']
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: CustomButtonColors.iconText['enabled'],
        end: (widget.disabled == true) ? CustomButtonColors.iconText['disabled'] : CustomButtonColors.iconText['focused']
    ).animate(_animationController);

    if (widget.disabled == true) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.disabled == true) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _onTapCancel() {
    setState(() {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (widget.disabled == true) ? null : widget.onPressed,
          onTapUp: (widget.disabled == true) ? (_) {} : (details) => _onTapUp(details),
          onTapDown: (widget.disabled == true) ? (_) {} : (details) => _onTapDown(details),
          onTapCancel: (widget.disabled == true) ? null : _onTapCancel,
          child: Container(
            decoration: BoxDecoration(
              color: widget.iconColor ?? _colorBgAnimation.value,
              borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(99)))
            ),
            margin: EdgeInsets.all(Adaptive.px(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Adaptive.px(6), horizontal: Adaptive.px(6)),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: _colorTextAnimation.value,
                  size: Adaptive.px(20),
                ),
              ),
            ),
          )
        );
      },
    );
  }
}