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

extension TransformExtension on Widget {
  Widget perspective({Key key}) => Transform(
        key: key,
        transform: Matrix4.identity()..setEntry(3, 2, 0.001),
        child: this,
      );

  Widget rotate0({Key key}) => Transform.rotate(
        key: key,
        angle: 0,
        child: this,
      );

  Widget rotate(double degrees, {Key key}) => Transform.rotate(
        key: key,
        angle: _degreeToRad(degrees),
        child: this,
      );

  Widget rotate45({Key key}) => Transform.rotate(
        key: key,
        angle: math.pi / 4,
        child: this,
      );

  Widget rotate90({Key key}) => Transform.rotate(
        key: key,
        angle: math.pi / 2,
        child: this,
      );

  Widget rotate180({Key key}) => Transform.rotate(
        key: key,
        angle: math.pi,
        child: this,
      );

  Widget rotateN180({Key key}) => Transform.rotate(
        key: key,
        angle: -math.pi,
        child: this,
      );
  Widget rotateN90({Key key}) => Transform.rotate(
        key: key,
        angle: -math.pi / 2,
        child: this,
      );

  Widget rotateN45({Key key}) => Transform.rotate(
        key: key,
        angle: -math.pi / 4,
        child: this,
      );

  Widget scale0({Key key}) => Transform.scale(
        key: key,
        scale: 0,
        child: this,
      );

  Widget scale50({Key key}) => Transform.scale(
        key: key,
        scale: 0.5,
        child: this,
      );

  Widget scale75({Key key}) => Transform.scale(
        key: key,
        scale: 0.75,
        child: this,
      );

  Widget scale90({Key key}) => Transform.scale(
        key: key,
        scale: 0.9,
        child: this,
      );

  Widget scale95({Key key}) => Transform.scale(
        key: key,
        scale: 0.95,
        child: this,
      );

  Widget scale100({Key key}) => Transform.scale(
        key: key,
        scale: 1,
        child: this,
      );
  Widget scale105({Key key}) => Transform.scale(
        key: key,
        scale: 1.05,
        child: this,
      );

  Widget scale110({Key key}) => Transform.scale(
        key: key,
        scale: 1.1,
        child: this,
      );

  Widget scale150({Key key}) => Transform.scale(
        key: key,
        scale: 1.5,
        child: this,
      );

  Widget scale200({Key key}) => Transform.scale(
        key: key,
        scale: 2.0,
        child: this,
      );
}
