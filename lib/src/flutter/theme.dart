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

extension ThemeExtension on Widget {
  Theme darkTheme({Key key, bool isMaterialAppTheme}) => Theme(
        data: ThemeData.dark(),
        child: this,
        isMaterialAppTheme: isMaterialAppTheme,
      );

  Theme lightTheme({Key key, bool isMaterialAppTheme}) => Theme(
        data: ThemeData.light(),
        child: this,
        isMaterialAppTheme: isMaterialAppTheme,
      );

  Theme customTheme(
          {Key key, @required ThemeData themeData, bool isMaterialAppTheme}) =>
      Theme(
        data: themeData,
        child: this,
        isMaterialAppTheme: isMaterialAppTheme,
      );
}
