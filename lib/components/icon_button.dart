import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomIconButtonType {
  primaryFilled,
  primaryTonal,
  primaryStandard,
  errorFilled,
  errorTonal,
  errorStandard,
  textField
}

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool? disabled;
  final CustomIconButtonType type;
  final bool isLoading;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.disabled,
    required this.type,
    required this.isLoading
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButton();
}

class _CustomIconButton extends State<CustomIconButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorBgAnimation;
  late Animation<Color?> _colorTextAnimation;
  late Animation<Color?> _colorBorderAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    _colorBgAnimation = ColorTween(
        begin: CustomIconButtonColors.getBackgroundStart(widget.type),
        end: CustomIconButtonColors.getBackgroundEnd(widget.type, widget.disabled == true),
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin:  CustomIconButtonColors.getTextStart(widget.type),
        end: CustomIconButtonColors.getTextEnd(widget.type, widget.disabled == true),
    ).animate(_animationController);
    _colorBorderAnimation = ColorTween(
        begin: CustomIconButtonColors.getBorderStart(widget.type),
        end: CustomIconButtonColors.getBorderEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);

    if (widget.isLoading || widget.disabled == true) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    _colorBgAnimation = ColorTween(
      begin: CustomIconButtonColors.getBackgroundStart(widget.type),
      end: CustomIconButtonColors.getBackgroundEnd(widget.type, widget.disabled == true),
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
      begin:  CustomIconButtonColors.getTextStart(widget.type),
      end: CustomIconButtonColors.getTextEnd(widget.type, widget.disabled == true),
    ).animate(_animationController);
    _colorBorderAnimation = ColorTween(
        begin: CustomIconButtonColors.getBorderStart(widget.type),
        end: CustomIconButtonColors.getBorderEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);

    if (widget.isLoading || widget.disabled == true) {
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
          onTap: (widget.disabled == true || widget.isLoading) ? null : widget.onPressed,
          onTapUp: (widget.disabled == true || widget.isLoading) ? (_) {} : (details) => _onTapUp(details),
          onTapDown: (widget.disabled == true || widget.isLoading) ? (_) {} : (details) => _onTapDown(details),
          onTapCancel: (widget.disabled == true || widget.isLoading) ? null : _onTapCancel,
          child: Padding(
            padding: EdgeInsets.all(Adaptive.px(8)),
            child: Container(
              height: Adaptive.px(40),
              width: Adaptive.px(40),
              decoration: BoxDecoration(
                color: _colorBgAnimation.value,
                borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(99))),
                border: Border.all(
                    color: _colorBorderAnimation.value ?? Colors.white,
                    width: Adaptive.px(1)
                )
              ),
              child: Center(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 1 - (widget.isLoading ? _animationController.value : 0),
                      child: Icon(
                        widget.icon,
                        color: _colorTextAnimation.value,
                        size: Adaptive.px(widget.type == CustomIconButtonType.textField ? 18 : 24),
                      ),
                    ),
                    if (widget.isLoading) ...[
                      Opacity(
                        opacity: _animationController.value,
                        child: SizedBox(
                          height: Adaptive.px(24),
                          width: Adaptive.px(24),
                          child: Center(
                              child: CupertinoActivityIndicator(
                                color: _colorTextAnimation.value,
                                animating: true,
                              )
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          )
        );
      },
    );
  }
}