import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomFloatingActionButtonFit {
  standard,
  extended
}

enum CustomFloatingActionButtonType {
  primary,
  secondary,
  tertiary
}

class CustomFloatingActionButton extends StatefulWidget {
  final CustomFloatingActionButtonType type;
  final CustomFloatingActionButtonFit fit;
  final String label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool isLoading;
  final VoidCallback onPressed;
  final bool? disabled;

  const CustomFloatingActionButton({
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
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButton();
}

class _CustomFloatingActionButton extends State<CustomFloatingActionButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorBgAnimation;
  late Animation<Color?> _colorTextAnimation;
  late Animation<Color?> _colorBorderAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 50));
    _colorBgAnimation = ColorTween(
        begin: CustomFloatingActionButtonColors.getBackgroundStart(widget.type),
        end: CustomFloatingActionButtonColors.getBackgroundEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: CustomFloatingActionButtonColors.getTextStart(widget.type),
        end: CustomFloatingActionButtonColors.getTextEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);
    _colorBorderAnimation = ColorTween(
        begin: CustomFloatingActionButtonColors.getBorderStart(widget.type),
        end: CustomFloatingActionButtonColors.getBorderEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);

    if (widget.isLoading || widget.disabled == true) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomFloatingActionButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    _colorBgAnimation = ColorTween(
        begin: CustomFloatingActionButtonColors.getBackgroundStart(widget.type),
        end: CustomFloatingActionButtonColors.getBackgroundEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: CustomFloatingActionButtonColors.getTextStart(widget.type),
        end: CustomFloatingActionButtonColors.getTextEnd(widget.type, widget.disabled == true)
    ).animate(_animationController);
    _colorBorderAnimation = ColorTween(
        begin: CustomFloatingActionButtonColors.getBorderStart(widget.type),
        end: CustomFloatingActionButtonColors.getBorderEnd(widget.type, widget.disabled == true)
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return GestureDetector(
                  onTap: (widget.isLoading || widget.disabled == true) ? null : widget.onPressed,
                  onTapUp: (widget.isLoading || widget.disabled == true) ? (_) {} : (details) => _onTapUp(details),
                  onTapDown: (widget.isLoading || widget.disabled == true) ? (_) {} : (details) => _onTapDown(details),
                  onTapCancel: (widget.isLoading || widget.disabled == true) ? null : _onTapCancel,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    decoration: BoxDecoration(
                        color: _colorBgAnimation.value,
                        borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(12))),
                        border: Border.all(
                            color: _colorBorderAnimation.value ?? Colors.white,
                            width: Adaptive.px(1)
                        )
                    ),
                    padding: EdgeInsets.only(top: Adaptive.px(16), bottom: Adaptive.px(16), left: Adaptive.px(widget.fit == CustomFloatingActionButtonFit.extended ? widget.iconLeft != null && !widget.isLoading ? 16 : 24 : 16), right: Adaptive.px(widget.fit == CustomFloatingActionButtonFit.extended ? widget.iconRight != null && !widget.isLoading ? 16 : 24 : 16),),
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
                                    size: Adaptive.px(widget.fit == CustomFloatingActionButtonFit.extended ? 18 : 24),
                                    weight: 600,
                                  ),
                                  SizedBox(width: Adaptive.px(widget.fit == CustomFloatingActionButtonFit.extended ? 8 : 0)),
                                ],
                                if (widget.fit == CustomFloatingActionButtonFit.extended) ...[
                                  Text(
                                    widget.label,
                                    style: CustomTypography.label(CustomLabelKeys.k2).copyWith(
                                        color: _colorTextAnimation.value
                                    ),
                                  ),
                                ],
                                if (widget.iconRight != null) ...[
                                  SizedBox(width: Adaptive.px(widget.fit == CustomFloatingActionButtonFit.extended ? 8 : 0)),
                                  Icon(
                                    widget.iconRight,
                                    color: _colorTextAnimation.value,
                                    size: Adaptive.px(widget.fit == CustomFloatingActionButtonFit.extended ? 18 : 24),
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
                );
              },
            )
          ],
        )
      ],
    );
  }
}