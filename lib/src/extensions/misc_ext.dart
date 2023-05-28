import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

extension VxMaterialColor on Color {
  MaterialColor materialColor() => Vx.getMaterialColor(this);
}

extension VxExtensionGlobalKey on GlobalKey {
  /// screenshot
  /// format image format
  /// pixelRatio screenshot resolution ratio
  Future<ByteData?> screenshots(
      {ui.ImageByteFormat? format, double? pixelRatio}) async {
    final RenderRepaintBoundary boundary =
        currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(
        pixelRatio: pixelRatio ??
            WidgetsBinding
                .instance.platformDispatcher.implicitView!.devicePixelRatio);
    final ByteData? byteData =
        await image.toByteData(format: format ?? ui.ImageByteFormat.rawRgba);

    /// Uint8List uint8list = byteData.buffer.asUint8List();
    return byteData;
  }
}
