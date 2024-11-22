import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/colors.dart';
import '../utils/typography.dart';

class CustomOverlay {
  final bool isVisible;
  final String title;
  final String subtitle;

  CustomOverlay({required this.isVisible, required this.title, required this.subtitle});
}

class CustomBackground extends StatelessWidget {
  final Widget child;
  final bool notCenter;
  final bool defaultPadding;
  final bool defaultColor;
  final bool? removeSizeConstraints;
  final CustomOverlay? customOverlay;

  const CustomBackground({
    super.key,
    required this.child,
    this.notCenter = false,
    this.defaultPadding = true,
    this.defaultColor = true,
    this.customOverlay,
    this.removeSizeConstraints
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        width: removeSizeConstraints == true ? null : double.infinity,
        height: removeSizeConstraints == true ? null : double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Adaptive.px(defaultPadding ? 24 : 0)),
        color: defaultColor ? MaterialColors.neutral.k98 : Colors.transparent,
        child: customOverlay != null && customOverlay!.isVisible ? Stack(
          children: [
            notCenter ? child : Center(child: child),
            Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Adaptive.px(60)),
                  color: MaterialColors.neutral.k90.withOpacity(0.75),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: MaterialColors.neutral.k100,
                            strokeWidth: Adaptive.px(4),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Adaptive.px(32)),
                            child: Text(
                              customOverlay!.title,
                              style: CustomTypography.title(CustomTitleKeys.k1),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Adaptive.px(16)),
                            child: Text(
                              'Creazione in corso...',
                              style: CustomTypography.body(CustomBodyKeys.k1Regular).copyWith(
                                  color: MaterialColors.neutral.k100
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            )
          ],
        ) : notCenter ? child : Center(child: child),
      ),
    );
  }
}