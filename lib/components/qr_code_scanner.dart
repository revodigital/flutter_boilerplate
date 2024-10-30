import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/colors.dart';
import '../utils/typography.dart';

class CustomQrCodeScanner extends StatefulWidget {
  final bool cameraEnabled;
  final Function onScan;

  const CustomQrCodeScanner({
    super.key,
    required this.cameraEnabled,
    required this.onScan
  });

  @override
  State<CustomQrCodeScanner> createState() => _CustomQrCodeScanner();
}

class _CustomQrCodeScanner extends State<CustomQrCodeScanner> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    autoStart: true,
    facing: CameraFacing.back,
  );

  @override
  void initState() {
    super.initState();
    unawaited(controller.start());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          errorBuilder: (context, error, child) {
            return Container();
          },
          fit: BoxFit.fitWidth,
          onDetect: (BarcodeCapture bc) {
            widget.onScan(bc.barcodes[0].displayValue);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.qrcode,
                size: Adaptive.px(40),
                color: CustomColors.neutral(CustomNeutralKeys.k90),
              ),
              SizedBox(height: Adaptive.px(24),),
              Text(
                widget.cameraEnabled ? 'Ricerca QrCode in corso...' : 'Permesso alla camera non concesso',
                style: CustomTypography.body(CustomBodyKeys.k1Medium).copyWith(
                    color: CustomColors.neutral(CustomNeutralKeys.k100)
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    await controller.dispose();
  }
}