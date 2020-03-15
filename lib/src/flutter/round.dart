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

enum RoundedShape { SM, M, LG, FULL }

extension RoundExtension on Widget {
  Widget rounded({Key key, Color bgColor, double value = 15.0}) => Container(
        key: key,
        decoration: BoxDecoration(
          color: bgColor ?? ThemeData().canvasColor,
          borderRadius: BorderRadius.all(
            Radius.circular(value),
          ),
        ),
        child: this,
      );

  Widget roundedNone({Key key, Color bgColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: bgColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),
        child: this,
      );

  Widget roundedSM({Key key, Color bgColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: bgColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(7.5),
          ),
        ),
        child: this,
      );
  Widget roundedLG({Key key, Color bgColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: bgColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: this,
      );

  Widget roundedFull({Key key, Color bgColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: bgColor ?? ThemeData().canvasColor,
          shape: BoxShape.circle,
        ),
        child: this,
      );
}
