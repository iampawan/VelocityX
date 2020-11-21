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
import 'package:velocity_x/velocity_x.dart';

mixin VxColorMixin<T> {
  late T _childToColor;

  @protected
  Color? velocityColor;

  @protected
  void setChildToColor(T child) {
    _childToColor = child;
  }

  T get white => _colorIt(child: _childToColor, color: Vx.white);
  T get black => _colorIt(child: _childToColor, color: Vx.black);
  T get gray100 => _colorIt(child: _childToColor, color: Vx.gray100);
  T get gray200 => _colorIt(child: _childToColor, color: Vx.gray200);
  T get gray300 => _colorIt(child: _childToColor, color: Vx.gray300);
  T get gray400 => _colorIt(child: _childToColor, color: Vx.gray400);
  T get gray500 => _colorIt(child: _childToColor, color: Vx.gray500);
  T get gray600 => _colorIt(child: _childToColor, color: Vx.gray600);
  T get gray700 => _colorIt(child: _childToColor, color: Vx.gray700);
  T get gray800 => _colorIt(child: _childToColor, color: Vx.gray800);
  T get gray900 => _colorIt(child: _childToColor, color: Vx.gray900);
  T get red100 => _colorIt(child: _childToColor, color: Vx.red100);
  T get red200 => _colorIt(child: _childToColor, color: Vx.red200);
  T get red300 => _colorIt(child: _childToColor, color: Vx.red300);
  T get red400 => _colorIt(child: _childToColor, color: Vx.red400);
  T get red500 => _colorIt(child: _childToColor, color: Vx.red500);
  T get red600 => _colorIt(child: _childToColor, color: Vx.red600);
  T get red700 => _colorIt(child: _childToColor, color: Vx.red700);
  T get red800 => _colorIt(child: _childToColor, color: Vx.red800);
  T get red900 => _colorIt(child: _childToColor, color: Vx.red900);
  T get orange100 => _colorIt(child: _childToColor, color: Vx.orange100);
  T get orange200 => _colorIt(child: _childToColor, color: Vx.orange200);
  T get orange300 => _colorIt(child: _childToColor, color: Vx.orange300);
  T get orange400 => _colorIt(child: _childToColor, color: Vx.orange400);
  T get orange500 => _colorIt(child: _childToColor, color: Vx.orange500);
  T get orange600 => _colorIt(child: _childToColor, color: Vx.orange600);
  T get orange700 => _colorIt(child: _childToColor, color: Vx.orange700);
  T get orange800 => _colorIt(child: _childToColor, color: Vx.orange800);
  T get orange900 => _colorIt(child: _childToColor, color: Vx.orange900);
  T get yellow100 => _colorIt(child: _childToColor, color: Vx.yellow100);
  T get yellow200 => _colorIt(child: _childToColor, color: Vx.yellow200);
  T get yellow300 => _colorIt(child: _childToColor, color: Vx.yellow300);
  T get yellow400 => _colorIt(child: _childToColor, color: Vx.yellow400);
  T get yellow500 => _colorIt(child: _childToColor, color: Vx.yellow500);
  T get yellow600 => _colorIt(child: _childToColor, color: Vx.yellow600);
  T get yellow700 => _colorIt(child: _childToColor, color: Vx.yellow700);
  T get yellow800 => _colorIt(child: _childToColor, color: Vx.yellow800);
  T get yellow900 => _colorIt(child: _childToColor, color: Vx.yellow900);
  T get green100 => _colorIt(child: _childToColor, color: Vx.green100);
  T get green200 => _colorIt(child: _childToColor, color: Vx.green200);
  T get green300 => _colorIt(child: _childToColor, color: Vx.green300);
  T get green400 => _colorIt(child: _childToColor, color: Vx.green400);
  T get green500 => _colorIt(child: _childToColor, color: Vx.green500);
  T get green600 => _colorIt(child: _childToColor, color: Vx.green600);
  T get green700 => _colorIt(child: _childToColor, color: Vx.green700);
  T get green800 => _colorIt(child: _childToColor, color: Vx.green800);
  T get green900 => _colorIt(child: _childToColor, color: Vx.green900);
  T get teal100 => _colorIt(child: _childToColor, color: Vx.teal100);
  T get teal200 => _colorIt(child: _childToColor, color: Vx.teal200);
  T get teal300 => _colorIt(child: _childToColor, color: Vx.teal300);
  T get teal400 => _colorIt(child: _childToColor, color: Vx.teal400);
  T get teal500 => _colorIt(child: _childToColor, color: Vx.teal500);
  T get teal600 => _colorIt(child: _childToColor, color: Vx.teal600);
  T get teal700 => _colorIt(child: _childToColor, color: Vx.teal700);
  T get teal800 => _colorIt(child: _childToColor, color: Vx.teal800);
  T get teal900 => _colorIt(child: _childToColor, color: Vx.teal900);
  T get blue100 => _colorIt(child: _childToColor, color: Vx.blue100);
  T get blue200 => _colorIt(child: _childToColor, color: Vx.blue200);
  T get blue300 => _colorIt(child: _childToColor, color: Vx.blue300);
  T get blue400 => _colorIt(child: _childToColor, color: Vx.blue400);
  T get blue500 => _colorIt(child: _childToColor, color: Vx.blue500);
  T get blue600 => _colorIt(child: _childToColor, color: Vx.blue600);
  T get blue700 => _colorIt(child: _childToColor, color: Vx.blue700);
  T get blue800 => _colorIt(child: _childToColor, color: Vx.blue800);
  T get blue900 => _colorIt(child: _childToColor, color: Vx.blue900);
  T get indigo100 => _colorIt(child: _childToColor, color: Vx.indigo100);
  T get indigo200 => _colorIt(child: _childToColor, color: Vx.indigo200);
  T get indigo300 => _colorIt(child: _childToColor, color: Vx.indigo300);
  T get indigo400 => _colorIt(child: _childToColor, color: Vx.indigo400);
  T get indigo500 => _colorIt(child: _childToColor, color: Vx.indigo500);
  T get indigo600 => _colorIt(child: _childToColor, color: Vx.indigo600);
  T get indigo700 => _colorIt(child: _childToColor, color: Vx.indigo700);
  T get indigo800 => _colorIt(child: _childToColor, color: Vx.indigo800);
  T get indigo900 => _colorIt(child: _childToColor, color: Vx.indigo900);
  T get purple100 => _colorIt(child: _childToColor, color: Vx.purple100);
  T get purple200 => _colorIt(child: _childToColor, color: Vx.purple200);
  T get purple300 => _colorIt(child: _childToColor, color: Vx.purple300);
  T get purple400 => _colorIt(child: _childToColor, color: Vx.purple400);
  T get purple500 => _colorIt(child: _childToColor, color: Vx.purple500);
  T get purple600 => _colorIt(child: _childToColor, color: Vx.purple600);
  T get purple700 => _colorIt(child: _childToColor, color: Vx.purple700);
  T get purple800 => _colorIt(child: _childToColor, color: Vx.purple800);
  T get purple900 => _colorIt(child: _childToColor, color: Vx.purple900);
  T get pink100 => _colorIt(child: _childToColor, color: Vx.pink100);
  T get pink200 => _colorIt(child: _childToColor, color: Vx.pink200);
  T get pink300 => _colorIt(child: _childToColor, color: Vx.pink300);
  T get pink400 => _colorIt(child: _childToColor, color: Vx.pink400);
  T get pink500 => _colorIt(child: _childToColor, color: Vx.pink500);
  T get pink600 => _colorIt(child: _childToColor, color: Vx.pink600);
  T get pink700 => _colorIt(child: _childToColor, color: Vx.pink700);
  T get pink800 => _colorIt(child: _childToColor, color: Vx.pink800);
  T get pink900 => _colorIt(child: _childToColor, color: Vx.pink900);
  T get transparent {
    velocityColor = Colors.transparent;
    return _childToColor;
  }

  T _colorIt({required Color color, required T child}) {
    velocityColor = color;
    return child;
  }
}
