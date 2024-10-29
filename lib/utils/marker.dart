/*import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';

Future<ui.Image> _loadUiImage(String imageAssetPath) async {
  final ByteData data = await rootBundle.load(imageAssetPath);
  final Completer<ui.Image> completer = Completer();
  ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

Future<BitmapDescriptor> createCustomMarkerBitmap(String imageAssetPath, String name, bool isDock) async {
  ui.PictureRecorder recorder = ui.PictureRecorder();
  ui.Image i = await _loadUiImage(imageAssetPath);
  ui.Canvas c = ui.Canvas(recorder);

  c.drawImage(i, Offset(0, 0), Paint());
  TextSpan textSpan = TextSpan(
    text: name,
    style: CustomTypography.title[0]!.copyWith(
      color: Colors.black
    )
  );
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );

  int width = 99;
  int height = 132;

  textPainter.layout(
    minWidth: 0,
    maxWidth: width.toDouble(),
  );
  final xCenter = (width - textPainter.width) / 2;
  final yCenter = (width - 20 - textPainter.height) / 2;
  final offset = Offset(xCenter, yCenter);
  textPainter.paint(c, offset);

  ui.Picture p = recorder.endRecording();
  ByteData? pngBytes = await (await p.toImage(
      width, height))
      .toByteData(format: ui.ImageByteFormat.png);

  Uint8List data = Uint8List.view(pngBytes!.buffer);

  return BitmapDescriptor.fromBytes(data);
}*/