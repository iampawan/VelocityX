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
  Padding p0({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel0),
      child: this,
    );
  }

  Padding p1({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel1),
      child: this,
    );
  }

  Padding p2({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel2),
      child: this,
    );
  }

  Padding p4({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel4),
      child: this,
    );
  }

  Padding p8({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel8),
      child: this,
    );
  }

  Padding p12({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel12),
      child: this,
    );
  }

  Padding p16({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel16),
      child: this,
    );
  }

  Padding p20({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel20),
      child: this,
    );
  }

  Padding p24({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel24),
      child: this,
    );
  }

  Padding p32({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(VelocityX.pixel32),
      child: this,
    );
  }

  Padding py0({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel0),
      child: this,
    );
  }

  Padding py1({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel1),
      child: this,
    );
  }

  Padding py2({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel2),
      child: this,
    );
  }

  Padding py4({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel4),
      child: this,
    );
  }

  Padding py8({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel8),
      child: this,
    );
  }

  Padding py12({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel12),
      child: this,
    );
  }

  Padding py16({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel16),
      child: this,
    );
  }

  Padding py20({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel20),
      child: this,
    );
  }

  Padding py24({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel24),
      child: this,
    );
  }

  Padding py32({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: VelocityX.pixel32),
      child: this,
    );
  }

  Padding px0({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel0),
      child: this,
    );
  }

  Padding px1({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel1),
      child: this,
    );
  }

  Padding px2({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel2),
      child: this,
    );
  }

  Padding px4({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel4),
      child: this,
    );
  }

  Padding px8({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel8),
      child: this,
    );
  }

  Padding px12({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel12),
      child: this,
    );
  }

  Padding px16({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel16),
      child: this,
    );
  }

  Padding px20({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel20),
      child: this,
    );
  }

  Padding px24({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel24),
      child: this,
    );
  }

  Padding px32({Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: VelocityX.pixel32),
      child: this,
    );
  }

  Padding pAll(double value, {Key key}) {
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
