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

extension TransformExtension on Widget {
  Widget get perspective => Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.001),
        child: this,
      );

  Widget get rotate0 => Transform.rotate(
        angle: 0,
        child: this,
      );

  Widget get rotate45 => Transform.rotate(
        angle: 45,
        child: this,
      );

  Widget get rotate90 => Transform.rotate(
        angle: 90,
        child: this,
      );

  Widget get rotate180 => Transform.rotate(
        angle: 180,
        child: this,
      );
  Widget get rotateN180 => Transform.rotate(
        angle: -180,
        child: this,
      );
  Widget get rotateN90 => Transform.rotate(
        angle: -90,
        child: this,
      );

  Widget get rotateN45 => Transform.rotate(
        angle: -45,
        child: this,
      );

  Widget get scale0 => Transform.scale(
        scale: 0,
        child: this,
      );

  Widget get scale50 => Transform.scale(
        scale: 0.5,
        child: this,
      );

  Widget get scale75 => Transform.scale(
        scale: 0.75,
        child: this,
      );

  Widget get scale90 => Transform.scale(
        scale: 0.9,
        child: this,
      );

  Widget get scale95 => Transform.scale(
        scale: 0.95,
        child: this,
      );

  Widget get scale100 => Transform.scale(
        scale: 1,
        child: this,
      );
  Widget get scale105 => Transform.scale(
        scale: 1.05,
        child: this,
      );

  Widget get scale110 => Transform.scale(
        scale: 1.1,
        child: this,
      );

  Widget get scale150 => Transform.scale(
        scale: 1.5,
        child: this,
      );

  Widget get scale200 => Transform.scale(
        scale: 2.0,
        child: this,
      );
}
