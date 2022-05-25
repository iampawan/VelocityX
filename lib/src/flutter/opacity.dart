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

/// Extension method for providing opacity on the top of widgets
extension VxOpacityExtension on Widget {
  ///
  /// Provide a custom opacity to any widget by using [value]
  ///
  Widget opacity({Key? key, required double value}) => Opacity(
        key: key,
        opacity: value,
        child: this,
      );

  ///
  /// Provides 0% opacity which means fully invisible
  ///
  Widget opacity0({Key? key}) => Opacity(
        opacity: 0.0,
        child: this,
      );

  ///
  /// Provides 25% opacity which means partially visible
  ///
  Widget opacity25({Key? key}) => Opacity(
        opacity: 0.25,
        child: this,
      );

  ///
  /// Provides 50% opacity which means half visible
  ///
  Widget opacity50({Key? key}) => Opacity(
        opacity: 0.5,
        child: this,
      );

  ///
  /// Provides 75% opacity which means partially invisible
  ///
  Widget opacity75({Key? key}) => Opacity(
        opacity: 0.75,
        child: this,
      );

  ///
  /// Provides 100% opacity which means fully visible
  ///
  Widget opacity100({Key? key}) => Opacity(
        opacity: 1.0,
        child: this,
      );
}
