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

extension CardExtension on Widget {
  Widget card({Key key, Color color, double elevation}) => Card(
        child: this,
        color: color ?? ThemeData().cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: elevation ?? 1.0,
      );

  Widget circularCard({Key key, Color color, double elevation}) => Card(
        child: this,
        shape: const CircleBorder(),
        color: color ?? ThemeData().cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: elevation ?? 1.0,
      );

  Widget circularCardZero({Key key, Color color}) => Card(
        child: this,
        shape: const CircleBorder(),
        color: color ?? ThemeData().cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
      );

  ///Card with no elevation
  Widget cardZero({Key key, Color color}) => Card(
        child: this,
        color: color ?? ThemeData().cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
      );
}
