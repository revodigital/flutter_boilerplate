import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomChipType {
  square,
  round
}

class CustomChip extends StatefulWidget {
  final String label;
  final String value;
  final bool isActive;
  final bool? overrideActive;
  final Function onPressed;
  final CustomChipType? type;

  const CustomChip({
    super.key,
    required this.label,
    required this.value,
    required this.isActive,
    required this.onPressed,
    this.type = CustomChipType.round,
    this.overrideActive
  });

  @override
  State<CustomChip> createState() => _CustomChip();
}

class _CustomChip extends State<CustomChip> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Color?> _colorBorderAnimation;
  late Animation<Color?> _colorBgAnimation;
  late Animation<Color?> _colorTextAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 20));

    _colorBorderAnimation = ColorTween(
        begin: CustomChipColors.chipBorder['enabled'],
        end: CustomChipColors.chipBorder['active']
    ).animate(_animationController);
    _colorBgAnimation = ColorTween(
        begin: CustomChipColors.chipBg['enabled'],
        end: CustomChipColors.chipBg['active']
    ).animate(_animationController);
    _colorTextAnimation = ColorTween(
        begin: CustomChipColors.chipText['enabled'],
        end: CustomChipColors.chipText['active']
    ).animate(_animationController);

    if (widget.isActive) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive) {
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
    if (widget.type == CustomChipType.round) {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: (widget.isActive && widget.overrideActive != true) ? null : () => widget.onPressed(widget.value),
            onTapUp: (widget.isActive) ? (_) {} : (details) => _onTapUp(details),
            onTapDown: (widget.isActive) ? (_) {} : (details) => _onTapDown(details),
            onTapCancel: (widget.isActive) ? null : _onTapCancel,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.px(24), vertical: Adaptive.px(11)),
              decoration: BoxDecoration(
                  color: _colorBgAnimation.value,
                  borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(30))),
                  border: Border.all(
                      color: _colorBorderAnimation.value!,
                      width: Adaptive.px(1)
                  )
              ),
              child: Text(
                widget.label,
                style: !widget.isActive ? CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(
                    color: _colorTextAnimation.value
                ) : CustomTypography.body(CustomBodyKeys.k2Semibold).copyWith(
                    color: _colorTextAnimation.value
                ),
              ),
            ),
          );
        },
      );
    } else {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: (widget.isActive && widget.overrideActive != true) ? null : () => widget.onPressed(widget.value),
            onTapUp: (widget.isActive) ? (_) {} : (details) => _onTapUp(details),
            onTapDown: (widget.isActive) ? (_) {} : (details) => _onTapDown(details),
            onTapCancel: (widget.isActive) ? null : _onTapCancel,
            child: Container(
              width: Adaptive.px(48),
              height: Adaptive.px(48),
              decoration: BoxDecoration(
                  color: _colorBgAnimation.value,
                  borderRadius: BorderRadius.all(Radius.circular(Adaptive.px(10))),
                  border: Border.all(
                      color: _colorBorderAnimation.value!,
                      width: Adaptive.px(1)
                  )
              ),
              child: Center(
                child: Text(
                  widget.label,
                  style: !widget.isActive ? CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(
                      color: _colorTextAnimation.value
                  ) : CustomTypography.body(CustomBodyKeys.k2Semibold).copyWith(
                      color: _colorTextAnimation.value
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ),
          );
        },
      );
    }
  }
}