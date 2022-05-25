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

///
/// Extension method to directly access material [Theme] with any widget without wrapping or with dot operator.
///
extension VxThemeExtension on Widget {
  ///
  /// Extension method to directly access dark [Theme] with any widget without wrapping or with dot operator.
  ///
  Theme darkTheme({Key? key}) => Theme(
        data: ThemeData.dark(),
        child: this,
      );

  ///
  /// Extension method to directly access light [Theme] with any widget without wrapping or with dot operator.
  ///
  Theme lightTheme({Key? key}) => Theme(
        data: ThemeData.light(),
        child: this,
      );

  ///
  /// Extension method to directly access [Theme] with custom [ThemeData] with any widget without wrapping or with dot operator.
  ///
  Theme customTheme({Key? key, required ThemeData? themeData}) => Theme(
        data: themeData!,
        child: this,
      );
}
