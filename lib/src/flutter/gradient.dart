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
import 'package:velocity_x/src/flutter/round.dart';

extension GradientExtension on Widget {
  Widget lGradient({Key key, @required List<Color> colors, RoundedShape rs}) =>
      DecoratedBox(
        key: key,
        decoration: BoxDecoration(
            borderRadius: rs != null && rs != RoundedShape.FULL
                ? BorderRadius.circular(rs == RoundedShape.SM
                    ? 7.0
                    : (rs == RoundedShape.M
                        ? 15.0
                        : (rs == RoundedShape.LG ? 30.0 : 15.0)))
                : null,
            shape: rs != null && rs == RoundedShape.FULL
                ? BoxShape.circle
                : BoxShape.rectangle,
            gradient: LinearGradient(
              colors: colors,
            )),
        child: this,
      );
  Widget rGradient({Key key, @required List<Color> colors}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: colors,
        )),
        child: this,
      );

  Widget sGradient({Key key, @required List<Color> colors}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
            gradient: SweepGradient(
          colors: colors,
        )),
        child: this,
      );
}
