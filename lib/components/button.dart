import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomButtonFit {
  full,
  fit
}

enum CustomButtonType {
  primaryFilled,
  primaryOutlined,
  primaryTonal,
  primaryText,
  errorFilled,
  errorOutlined,
  errorTonal,
  errorText,
}

class CustomButton extends StatefulWidget {
  final CustomButtonType type;
  final CustomButtonFit fit;
  final String label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool isLoading;
  final VoidCallback onPressed;
  final bool? disabled;

  const CustomButton({
    super.key,
    required this.type,
    required this.fit,
    required this.label,
    this.iconLeft,
    this.iconRight,
    required this.isLoading,
    required this.onPressed,
    this.disabled,
  });

  @override
  State<CustomButton> createState() => _CustomButton();
}

class _CustomButton extends State<CustomButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorBgAnimation;
  late Animation<Color?> _colorTextAnimation;
  late Animation<Color?> _colorBorderAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 50));
    _colorBgAnimation = ColorTween(
        begin: CustomButtonColors.getBackgroundStart(widget.type),
        end: CustomButtonColors.getBackgroundEnd(widget.type, (widget.isLoading || widget.disabled == true))
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: CustomButtonColors.getTextStart(widget.type),
        end: CustomButtonColors.getTextEnd(widget.type, (widget.isLoading || widget.disabled == true))
    ).animate(_animationController);
    _colorBorderAnimation = ColorTween(
        begin: CustomButtonColors.getBorderStart(widget.type),
        end: CustomButtonColors.getBorderEnd(widget.type, (widget.isLoading || widget.disabled == true))
    ).animate(_animationController);

    if (widget.isLoading || widget.disabled == true) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    _colorBgAnimation = ColorTween(
        begin: CustomButtonColors.getBackgroundStart(widget.type),
        end: CustomButtonColors.getBackgroundEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: CustomButtonColors.getTextStart(widget.type),
        end: CustomButtonColors.getTextEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);
    _colorBorderAnimation = ColorTween(
        begin: CustomButtonColors.getBorderStart(widget.type),
        end: CustomButtonColors.getBorderEnd(widget.type, widget.disabled == true)
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
          onTap: (widget.isLoading || widget.disabled == true) ? null : widget.onPressed,
          onTapUp: (widget.isLoading || widget.disabled == true) ? (_) {} : (details) => _onTapUp(details),
          onTapDown: (widget.isLoading || widget.disabled == true) ? (_) {} : (details) => _onTapDown(details),
          onTapCancel: (widget.isLoading || widget.disabled == true) ? null : _onTapCancel,
          behavior: HitTestBehavior.opaque,
          child: CustomButtonContainer(
            fit: widget.fit,
            color: _colorBgAnimation.value,
            border: Border.all(
              color: _colorBorderAnimation.value ?? Colors.white,
              width: Adaptive.px(1)
            ),
            child: Padding(
              padding: EdgeInsets.only(top: Adaptive.px(10), bottom: Adaptive.px(10), left: Adaptive.px(widget.iconLeft != null && !widget.isLoading ? 16 : 24), right: Adaptive.px(widget.iconRight != null && !widget.isLoading ? 16 : 24),),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 1 - (widget.isLoading ? _animationController.value : 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.iconLeft != null) ...[
                            Icon(
                              widget.iconLeft,
                              color: _colorTextAnimation.value,
                              size: Adaptive.px(18),
                              weight: 600,
                            ),
                            SizedBox(width: Adaptive.px(8)),
                          ],
                          Text(
                            widget.label,
                            style: CustomTypography.label(CustomLabelKeys.k2).copyWith(
                                color: _colorTextAnimation.value
                            ),
                          ),
                          if (widget.iconRight != null) ...[
                            SizedBox(width: Adaptive.px(8)),
                            Icon(
                              widget.iconRight,
                              color: _colorTextAnimation.value,
                              size: Adaptive.px(18),
                              weight: 600,
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (widget.isLoading) ...[
                      Opacity(
                        opacity: _animationController.value,
                        child: SizedBox(
                          height: Adaptive.px(20),
                          width: Adaptive.px(20),
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
          ),
        );
      },
    );
  }
}

class CustomButtonContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Border? border;
  final CustomButtonFit fit;

  const CustomButtonContainer({
    super.key,
    required this.child,
    required this.fit,
    this.color,
    this.border
  });

  @override
  Widget build(BuildContext context) {
    if (fit == CustomButtonFit.fit) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Adaptive.px(48),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(9))),
                color: color,
                border: border
            ),
            child: child
          )
        ],
      );
    }

    return Container(
      height: Adaptive.px(48),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(9))),
          color: color,
          border: border
      ),
      child: child,
    );
  }
}