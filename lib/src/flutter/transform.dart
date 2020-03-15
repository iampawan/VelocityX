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
  Widget rotate0({Key key}) => Transform.rotate(
        angle: 0,
        child: this,
      );
  Widget rotate45({Key key}) => Transform.rotate(
        angle: 45,
        child: this,
      );

  Widget rotate90({Key key}) => Transform.rotate(
        angle: 90,
        child: this,
      );

  Widget rotate180({Key key}) => Transform.rotate(
        angle: 180,
        child: this,
      );
  Widget rotateN180({Key key}) => Transform.rotate(
        angle: -180,
        child: this,
      );
  Widget rotateN90({Key key}) => Transform.rotate(
        angle: -90,
        child: this,
      );

  Widget rotateN45({Key key}) => Transform.rotate(
        angle: -45,
        child: this,
      );

  Widget scale0({Key key}) => Transform.scale(
        scale: 0,
        child: this,
      );

  Widget scale50({Key key}) => Transform.scale(
        scale: 0.5,
        child: this,
      );

  Widget scale75({Key key}) => Transform.scale(
        scale: 0.75,
        child: this,
      );

  Widget scale90({Key key}) => Transform.scale(
        scale: 0.9,
        child: this,
      );

  Widget scale95({Key key}) => Transform.scale(
        scale: 0.95,
        child: this,
      );

  Widget scale100({Key key}) => Transform.scale(
        scale: 1,
        child: this,
      );
  Widget scale105({Key key}) => Transform.scale(
        scale: 1.05,
        child: this,
      );

  Widget scale110({Key key}) => Transform.scale(
        scale: 1.1,
        child: this,
      );

  Widget scale150({Key key}) => Transform.scale(
        scale: 1.5,
        child: this,
      );

  Widget scale200({Key key}) => Transform.scale(
        scale: 2.0,
        child: this,
      );
}
