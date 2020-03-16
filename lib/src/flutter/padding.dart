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

import 'package:flutter/material.dart';
import 'package:velocity_x/src/velocity_xx.dart';

extension PaddingExtensions on Widget {
  Padding get p0 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp0),
        child: this,
      );

  Padding get p1 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp1),
        child: this,
      );

  Padding get p2 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp2),
        child: this,
      );

  Padding get p4 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp4),
        child: this,
      );

  Padding get p8 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp8),
        child: this,
      );

  Padding get p12 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp12),
        child: this,
      );

  Padding get p16 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp16),
        child: this,
      );

  Padding get p20 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp20),
        child: this,
      );

  Padding get p24 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp24),
        child: this,
      );

  Padding get p32 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp32),
        child: this,
      );

  Padding get p64 => Padding(
        padding: const EdgeInsets.all(VelocityX.dp64),
        child: this,
      );

  Padding get py0 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp0),
        child: this,
      );

  Padding get py1 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp1),
        child: this,
      );

  Padding get py2 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp2),
        child: this,
      );

  Padding get py4 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp4),
        child: this,
      );

  Padding get py8 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp8),
        child: this,
      );

  Padding get py12 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp12),
        child: this,
      );

  Padding get py16 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp16),
        child: this,
      );

  Padding get py20 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp20),
        child: this,
      );

  Padding get py24 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp24),
        child: this,
      );

  Padding get py32 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp32),
        child: this,
      );

  Padding get py64 => Padding(
        padding: const EdgeInsets.symmetric(vertical: VelocityX.dp64),
        child: this,
      );

  Padding get px0 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp0),
        child: this,
      );

  Padding get px1 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp1),
        child: this,
      );

  Padding get px2 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp2),
        child: this,
      );

  Padding get px4 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp4),
        child: this,
      );

  Padding get px8 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp8),
        child: this,
      );

  Padding get px12 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp12),
        child: this,
      );

  Padding get px16 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp16),
        child: this,
      );

  Padding get px20 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp20),
        child: this,
      );

  Padding get px24 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp24),
        child: this,
      );

  Padding get px32 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp32),
        child: this,
      );

  Padding get px64 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: VelocityX.dp64),
        child: this,
      );

  Padding p(double value, {Key key}) {
    return Padding(
      key: key,
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Padding pLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    Key key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Padding pSymmetric({Key key, double v = 0.0, double h = 0.0}) => Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: v,
          horizontal: h,
        ),
        child: this,
      );

  Padding pOnly(
          {Key key,
          double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );
}
