/*
 * Copyright 2021 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:ui';
import 'package:flutter/material.dart';

class VxGlassmorphic extends StatelessWidget {
  ///[opacity] is used to control the glass frosted effect\n
  ///[opacity] should be between 0 and 1\n
  ///1 means full opaque\n
  ///0 means full transparent\n
  ///default value is 0.1\n
  final double? opacity;

  ///[Widget] [child]
  final Widget? child;

  ///blur intensity\n
  ///default value is 5
  final double? blur;

  /// shadow strength\n
  /// default value is 4\n
  /// to remove shadow provide value 0\n
  /// shadowStrength : 0\n
  final double? shadowStrength;

  ///Border Radius\n
  ///example:\n
  ///borderRadius: BorderRadius.circular(10),\n
  ///default value is same as example\n
  ///to remove border use [BorderRadius.zero],\n
  final BorderRadius? borderRadius;

  /// Works only when border Radius is null
  final double? circularRadius;

  ///[VxGlassmorphic] Height in [double]\n
  ///no default height
  final double? height;

  ///[VxGlassmorphic] Width in [double]\n
  ///no default width
  final double? width;

  ///[border] example\n
  ///Border.all(\n
  ///   color: Colors.white.withOpacity(0.3),\n
  ///   width: 0.3,\n
  ///   style: BorderStyle.solid,\n
  ///),
  ///default is same as above example\n
  final BoxBorder? border;

  const VxGlassmorphic(
      {Key? key,
      this.opacity = 0.05,
      this.child,
      this.blur = 5,
      this.border,
      this.height,
      this.width,
      this.borderRadius,
      this.circularRadius = 10.0,
      this.shadowStrength = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PaintShadow(shadowStrength: shadowStrength!),
      child: Container(
        height: height,
        foregroundDecoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(circularRadius!),
          border: border ??
              Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 0.3,
                  style: BorderStyle.solid),
        ),
        width: width,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(circularRadius!),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur!,
              sigmaY: blur!,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    borderRadius ?? BorderRadius.circular(circularRadius!),
                color: Colors.grey[100]?.withOpacity(opacity!),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _PaintShadow extends CustomPainter {
  _PaintShadow({
    this.shadowStrength = 1,
  });

  final double? shadowStrength;

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  Paint customPainter(
      {double? blurStrength,
      Color? color,
      double? opacity,
      double? strokeWidth}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..color = color!.withOpacity(0.24)
      ..strokeWidth = strokeWidth!
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(
          blurStrength!,
        ),
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (shadowStrength == 0) {
      return;
    }
    final RRect rect = RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(-shadowStrength! / 2, -shadowStrength! / 2),
          Offset(
            size.width + shadowStrength! / 2,
            size.height + shadowStrength! / 2,
          ),
        ),
        const Radius.circular(10));
    canvas.drawRRect(
      rect,
      customPainter(
        color: const Color(0xff333333),
        blurStrength: 20,
        strokeWidth: shadowStrength!,
        opacity: 0.24,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

extension VxGlassWidgetExtension on Widget {
  ///
  /// Extension method to directly access  [VxGlassmorphic] with any widget without wrapping or with dot operator.
  ///
  Widget glassMorphic({
    Key? key,
    double? width,
    double? height,
    BoxBorder? border,
    BorderRadius? borderRadius,
    double? opacity = 0.05,
    double? shadowStrength = 4,
    double? circularRadius = 10,
    double? blur = 5,
  }) =>
      VxGlassmorphic(
        child: this,
        blur: blur,
        border: border,
        borderRadius: borderRadius,
        width: width,
        height: height,
        key: key,
        opacity: opacity,
        shadowStrength: shadowStrength,
        circularRadius: circularRadius,
      );
}
