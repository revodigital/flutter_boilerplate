import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomButtonFit {
  full,
  fit
}

enum CustomButtonType {
  primary,
  secondary,
  tertiary,
  alert,
  white
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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 50));
    _colorBgAnimation = ColorTween(
        begin: widget.type == CustomButtonType.primary ? CustomButtonColors.primaryBg['enabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryBg['enabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryBg['enabled'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertBg['enabled'] : CustomButtonColors.whiteBg['enabled'],
        end: (widget.isLoading || widget.disabled == true) ? widget.type == CustomButtonType.primary ? CustomButtonColors.primaryBg['disabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryBg['disabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryBg['disabled'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertBg['disabled'] : CustomButtonColors.whiteBg['disabled'] : widget.type == CustomButtonType.primary ? CustomButtonColors.primaryBg['focused'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryBg['focused'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryBg['focused'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertBg['focused'] : CustomButtonColors.whiteBg['focused']
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: widget.type == CustomButtonType.primary ? CustomButtonColors.primaryText['enabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryText['enabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryText['enabled'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertText['enabled'] : CustomButtonColors.whiteText['enabled'],
        end: (widget.isLoading || widget.disabled == true) ? widget.type == CustomButtonType.primary ? CustomButtonColors.primaryText['disabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryText['disabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryText['disabled'] : CustomButtonColors.alertText['disabled'] : widget.type == CustomButtonType.primary ? CustomButtonColors.primaryText['focused'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryText['focused'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryText['focused'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertText['focused'] : CustomButtonColors.whiteText['focused']
    ).animate(_animationController);

    if (widget.isLoading || widget.disabled == true) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    _colorBgAnimation = ColorTween(
        begin: widget.type == CustomButtonType.primary ? CustomButtonColors.primaryBg['enabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryBg['enabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryBg['enabled'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertBg['enabled'] : CustomButtonColors.whiteBg['enabled'],
        end: (widget.isLoading || widget.disabled == true) ? widget.type == CustomButtonType.primary ? CustomButtonColors.primaryBg['disabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryBg['disabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryBg['disabled'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertBg['disabled'] : CustomButtonColors.whiteBg['disabled'] : widget.type == CustomButtonType.primary ? CustomButtonColors.primaryBg['focused'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryBg['focused'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryBg['focused'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertBg['focused'] : CustomButtonColors.whiteBg['focused']
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: widget.type == CustomButtonType.primary ? CustomButtonColors.primaryText['enabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryText['enabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryText['enabled'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertText['enabled'] : CustomButtonColors.whiteText['enabled'],
        end: (widget.isLoading || widget.disabled == true) ? widget.type == CustomButtonType.primary ? CustomButtonColors.primaryText['disabled'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryText['disabled'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryText['disabled'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertText['disabled'] : CustomButtonColors.whiteText['disabled'] : widget.type == CustomButtonType.primary ? CustomButtonColors.primaryText['focused'] : widget.type == CustomButtonType.secondary ? CustomButtonColors.secondaryText['focused'] : widget.type == CustomButtonType.tertiary ? CustomButtonColors.tertiaryText['focused'] : widget.type == CustomButtonType.alert ? CustomButtonColors.alertText['focused'] : CustomButtonColors.whiteText['focused']
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
          child: CustomButtonContainer(
            fit: widget.fit,
            color: _colorBgAnimation.value,
            border: widget.type == CustomButtonType.alert ? Border.all(color: _colorTextAnimation.value!, width: Adaptive.px(2)) : null,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Adaptive.px(14), horizontal: Adaptive.px(16)),
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
                              size: Adaptive.px(20),
                              weight: 600,
                            ),
                            SizedBox(width: Adaptive.px(8)),
                          ],
                          Text(
                            widget.label.toUpperCase(),
                            style: CustomTypography.button(CustomButtonKeys.kSemibold).copyWith(
                                color: _colorTextAnimation.value
                            ),
                          ),
                          if (widget.iconRight != null) ...[
                            SizedBox(width: Adaptive.px(8)),
                            Icon(
                              widget.iconRight,
                              color: _colorTextAnimation.value,
                              size: Adaptive.px(20),
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
                borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(10))),
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
          borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(10))),
          color: color,
          border: border
      ),
      child: child,
    );
  }
}