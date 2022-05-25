/*
 * Copyright (c) 2020 Pawan Kumar. All rights reserved.
 *
 *  * Licensed under the Apache License, Version 2.0 (the "License");
 *  * you may not use this file except in compliance with the License.
 *  * You may obtain a copy of the License at
 *  * http://www.apache.org/licenses/LICENSE-2.0
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 */

import 'dart:math' as math;

import 'package:flutter/material.dart';

double _degreeToRad(double degrees) => degrees / 180.0 * math.pi;

///
/// Extension method to directly transform any widget without wrapping or with dot operator.
///
extension VxTransformExtension on Widget {
  ///
  /// Extension method to give 3D look to any widget without wrapping or with dot operator.
  ///
  Widget perspective({Key? key}) => Transform(
        key: key,
        transform: Matrix4.identity()..setEntry(3, 2, 0.001),
        child: this,
      );

  /// Extension method to set an offset of any widget
  Widget offset(
      {Key? key, required Offset offset, bool transformHitTests = true}) {
    return Transform.translate(
      key: key,
      transformHitTests: transformHitTests,
      offset: offset,
      child: this,
    );
  }

  ///
  /// Extension method to horizontally flip any widget without wrapping or with dot operator.
  ///
  Widget flipHorizontal({Key? key}) => Transform(
        key: key,
        transform: Matrix4.rotationY(math.pi),
        child: this,
      );

  ///
  /// Extension method to rotate along Y-axis any widget without wrapping or with dot operator.
  ///
  Widget flipY({Key? key, double? radian}) => Transform(
        key: key,
        transform: Matrix4.rotationY(radian ?? 90),
        child: this,
      );

  ///
  /// Extension method to vertically flip any widget without wrapping or with dot operator.
  ///
  Widget flipVertical({Key? key}) => Transform(
        key: key,
        transform: Matrix4.rotationX(math.pi),
        child: this,
      );

  ///
  /// Extension method to rotate along X-axis any widget without wrapping or with dot operator.
  ///
  Widget flipX({Key? key, double? radian}) => Transform(
        key: key,
        transform: Matrix4.rotationX(radian ?? 90),
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 0 degrees without wrapping or with dot operator.
  ///
  Widget rotate0({Key? key}) => Transform.rotate(
        key: key,
        angle: 0,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by specified [degrees] without wrapping or with dot operator.
  ///
  Widget rotate(double degrees,
          {Key? key, Alignment alignment = Alignment.center, Offset? origin}) =>
      Transform.rotate(
        key: key,
        angle: _degreeToRad(degrees),
        alignment: alignment,
        origin: origin,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 45 degrees without wrapping or with dot operator.
  ///
  Widget rotate45({Key? key}) => Transform.rotate(
        key: key,
        angle: math.pi / 4,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 60 degrees without wrapping or with dot operator.
  ///
  Widget rotate60({Key? key}) => Transform.rotate(
        key: key,
        angle: math.pi / 3,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 90 degrees without wrapping or with dot operator.
  ///
  Widget rotate90({Key? key}) => Transform.rotate(
        key: key,
        angle: math.pi / 2,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 180 degrees without wrapping or with dot operator.
  ///
  Widget rotate180({Key? key}) => Transform.rotate(
        key: key,
        angle: math.pi,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 180 degrees anti-clockwise without wrapping or with dot operator.
  ///
  Widget rotateN180({Key? key}) => Transform.rotate(
        key: key,
        angle: -math.pi,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 90 degrees anti-clockwise without wrapping or with dot operator.
  ///
  Widget rotateN90({Key? key}) => Transform.rotate(
        key: key,
        angle: -math.pi / 2,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 45 degrees anti-clockwise without wrapping or with dot operator.
  ///
  Widget rotateN45({Key? key}) => Transform.rotate(
        key: key,
        angle: -math.pi / 4,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 60 degrees anti-clockwise without wrapping or with dot operator.
  ///
  Widget rotateN60({Key? key}) => Transform.rotate(
        key: key,
        angle: -math.pi / 3,
        child: this,
      );

  ///
  /// Extension method to scale any widget by specified [scalevalue] without wrapping or with dot operator.
  ///
  Widget scale(
          {Key? key,
          double? scaleValue,
          Offset? origin,
          Alignment alignment = Alignment.center}) =>
      Transform.scale(
        key: key,
        scale: scaleValue ?? 0,
        alignment: alignment,
        origin: origin,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 0 without wrapping or with dot operator.
  ///
  Widget scale0({Key? key}) => Transform.scale(
        key: key,
        scale: 0,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 0.5 without wrapping or with dot operator.
  ///
  Widget scale50({Key? key}) => Transform.scale(
        key: key,
        scale: 0.5,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 0.75 without wrapping or with dot operator.
  ///
  Widget scale75({Key? key}) => Transform.scale(
        key: key,
        scale: 0.75,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 0.9 without wrapping or with dot operator.
  ///
  Widget scale90({Key? key}) => Transform.scale(
        key: key,
        scale: 0.9,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 0.95 without wrapping or with dot operator.
  ///
  Widget scale95({Key? key}) => Transform.scale(
        key: key,
        scale: 0.95,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 1.0 without wrapping or with dot operator.
  ///
  Widget scale100({Key? key}) => Transform.scale(
        key: key,
        scale: 1,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 1.05 without wrapping or with dot operator.
  ///
  Widget scale105({Key? key}) => Transform.scale(
        key: key,
        scale: 1.05,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 1.1 without wrapping or with dot operator.
  ///
  Widget scale110({Key? key}) => Transform.scale(
        key: key,
        scale: 1.1,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 1.5 without wrapping or with dot operator.
  ///
  Widget scale150({Key? key}) => Transform.scale(
        key: key,
        scale: 1.5,
        child: this,
      );

  ///
  /// Extension method to rotate any widget by 2 without wrapping or with dot operator.
  ///
  Widget scale200({Key? key}) => Transform.scale(
        key: key,
        scale: 2.0,
        child: this,
      );
}
