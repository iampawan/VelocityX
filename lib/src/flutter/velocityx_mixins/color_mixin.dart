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

  ///Gray
  T get gray50 => _colorIt(child: _childToColor, color: Vx.gray50);
  T get gray100 => _colorIt(child: _childToColor, color: Vx.gray100);
  T get gray200 => _colorIt(child: _childToColor, color: Vx.gray200);
  T get gray300 => _colorIt(child: _childToColor, color: Vx.gray300);
  T get gray400 => _colorIt(child: _childToColor, color: Vx.gray400);
  T get gray500 => _colorIt(child: _childToColor, color: Vx.gray500);
  T get gray600 => _colorIt(child: _childToColor, color: Vx.gray600);
  T get gray700 => _colorIt(child: _childToColor, color: Vx.gray700);
  T get gray800 => _colorIt(child: _childToColor, color: Vx.gray800);
  T get gray900 => _colorIt(child: _childToColor, color: Vx.gray900);

  ///Slate
  T get slate50 => _colorIt(child: _childToColor, color: Vx.slate50);
  T get slate100 => _colorIt(child: _childToColor, color: Vx.slate100);
  T get slate200 => _colorIt(child: _childToColor, color: Vx.slate200);
  T get slate300 => _colorIt(child: _childToColor, color: Vx.slate300);
  T get slate400 => _colorIt(child: _childToColor, color: Vx.slate400);
  T get slate500 => _colorIt(child: _childToColor, color: Vx.slate500);
  T get slate600 => _colorIt(child: _childToColor, color: Vx.slate600);
  T get slate700 => _colorIt(child: _childToColor, color: Vx.slate700);
  T get slate800 => _colorIt(child: _childToColor, color: Vx.slate800);
  T get slate900 => _colorIt(child: _childToColor, color: Vx.slate900);

  ///Zinc
  T get zinc50 => _colorIt(child: _childToColor, color: Vx.zinc50);
  T get zinc100 => _colorIt(child: _childToColor, color: Vx.zinc100);
  T get zinc200 => _colorIt(child: _childToColor, color: Vx.zinc200);
  T get zinc300 => _colorIt(child: _childToColor, color: Vx.zinc300);
  T get zinc400 => _colorIt(child: _childToColor, color: Vx.zinc400);
  T get zinc500 => _colorIt(child: _childToColor, color: Vx.zinc500);
  T get zinc600 => _colorIt(child: _childToColor, color: Vx.zinc600);
  T get zinc700 => _colorIt(child: _childToColor, color: Vx.zinc700);
  T get zinc800 => _colorIt(child: _childToColor, color: Vx.zinc800);
  T get zinc900 => _colorIt(child: _childToColor, color: Vx.zinc900);

  ///Neutral
  T get neutral50 => _colorIt(child: _childToColor, color: Vx.neutral50);
  T get neutral100 => _colorIt(child: _childToColor, color: Vx.neutral100);
  T get neutral200 => _colorIt(child: _childToColor, color: Vx.neutral200);
  T get neutral300 => _colorIt(child: _childToColor, color: Vx.neutral300);
  T get neutral400 => _colorIt(child: _childToColor, color: Vx.neutral400);
  T get neutral500 => _colorIt(child: _childToColor, color: Vx.neutral500);
  T get neutral600 => _colorIt(child: _childToColor, color: Vx.neutral600);
  T get neutral700 => _colorIt(child: _childToColor, color: Vx.neutral700);
  T get neutral800 => _colorIt(child: _childToColor, color: Vx.neutral800);
  T get neutral900 => _colorIt(child: _childToColor, color: Vx.neutral900);

  ///Stone
  T get stone50 => _colorIt(child: _childToColor, color: Vx.stone50);
  T get stone100 => _colorIt(child: _childToColor, color: Vx.stone100);
  T get stone200 => _colorIt(child: _childToColor, color: Vx.stone200);
  T get stone300 => _colorIt(child: _childToColor, color: Vx.stone300);
  T get stone400 => _colorIt(child: _childToColor, color: Vx.stone400);
  T get stone500 => _colorIt(child: _childToColor, color: Vx.stone500);
  T get stone600 => _colorIt(child: _childToColor, color: Vx.stone600);
  T get stone700 => _colorIt(child: _childToColor, color: Vx.stone700);
  T get stone800 => _colorIt(child: _childToColor, color: Vx.stone800);
  T get stone900 => _colorIt(child: _childToColor, color: Vx.stone900);

  ///Red
  T get red50 => _colorIt(child: _childToColor, color: Vx.red50);
  T get red100 => _colorIt(child: _childToColor, color: Vx.red100);
  T get red200 => _colorIt(child: _childToColor, color: Vx.red200);
  T get red300 => _colorIt(child: _childToColor, color: Vx.red300);
  T get red400 => _colorIt(child: _childToColor, color: Vx.red400);
  T get red500 => _colorIt(child: _childToColor, color: Vx.red500);
  T get red600 => _colorIt(child: _childToColor, color: Vx.red600);
  T get red700 => _colorIt(child: _childToColor, color: Vx.red700);
  T get red800 => _colorIt(child: _childToColor, color: Vx.red800);
  T get red900 => _colorIt(child: _childToColor, color: Vx.red900);

  ///Orange
  T get orange50 => _colorIt(child: _childToColor, color: Vx.orange50);
  T get orange100 => _colorIt(child: _childToColor, color: Vx.orange100);
  T get orange200 => _colorIt(child: _childToColor, color: Vx.orange200);
  T get orange300 => _colorIt(child: _childToColor, color: Vx.orange300);
  T get orange400 => _colorIt(child: _childToColor, color: Vx.orange400);
  T get orange500 => _colorIt(child: _childToColor, color: Vx.orange500);
  T get orange600 => _colorIt(child: _childToColor, color: Vx.orange600);
  T get orange700 => _colorIt(child: _childToColor, color: Vx.orange700);
  T get orange800 => _colorIt(child: _childToColor, color: Vx.orange800);
  T get orange900 => _colorIt(child: _childToColor, color: Vx.orange900);

  ///Amber
  T get amber50 => _colorIt(child: _childToColor, color: Vx.amber50);
  T get amber100 => _colorIt(child: _childToColor, color: Vx.amber100);
  T get amber200 => _colorIt(child: _childToColor, color: Vx.amber200);
  T get amber300 => _colorIt(child: _childToColor, color: Vx.amber300);
  T get amber400 => _colorIt(child: _childToColor, color: Vx.amber400);
  T get amber500 => _colorIt(child: _childToColor, color: Vx.amber500);
  T get amber600 => _colorIt(child: _childToColor, color: Vx.amber600);
  T get amber700 => _colorIt(child: _childToColor, color: Vx.amber700);
  T get amber800 => _colorIt(child: _childToColor, color: Vx.amber800);
  T get amber900 => _colorIt(child: _childToColor, color: Vx.amber900);

  ///Yellow
  T get yellow50 => _colorIt(child: _childToColor, color: Vx.yellow50);
  T get yellow100 => _colorIt(child: _childToColor, color: Vx.yellow100);
  T get yellow200 => _colorIt(child: _childToColor, color: Vx.yellow200);
  T get yellow300 => _colorIt(child: _childToColor, color: Vx.yellow300);
  T get yellow400 => _colorIt(child: _childToColor, color: Vx.yellow400);
  T get yellow500 => _colorIt(child: _childToColor, color: Vx.yellow500);
  T get yellow600 => _colorIt(child: _childToColor, color: Vx.yellow600);
  T get yellow700 => _colorIt(child: _childToColor, color: Vx.yellow700);
  T get yellow800 => _colorIt(child: _childToColor, color: Vx.yellow800);
  T get yellow900 => _colorIt(child: _childToColor, color: Vx.yellow900);

  ///Lime
  T get lime50 => _colorIt(child: _childToColor, color: Vx.lime50);
  T get lime100 => _colorIt(child: _childToColor, color: Vx.lime100);
  T get lime200 => _colorIt(child: _childToColor, color: Vx.lime200);
  T get lime300 => _colorIt(child: _childToColor, color: Vx.lime300);
  T get lime400 => _colorIt(child: _childToColor, color: Vx.lime400);
  T get lime500 => _colorIt(child: _childToColor, color: Vx.lime500);
  T get lime600 => _colorIt(child: _childToColor, color: Vx.lime600);
  T get lime700 => _colorIt(child: _childToColor, color: Vx.lime700);
  T get lime800 => _colorIt(child: _childToColor, color: Vx.lime800);
  T get lime900 => _colorIt(child: _childToColor, color: Vx.lime900);

  ///Green
  T get green50 => _colorIt(child: _childToColor, color: Vx.green50);
  T get green100 => _colorIt(child: _childToColor, color: Vx.green100);
  T get green200 => _colorIt(child: _childToColor, color: Vx.green200);
  T get green300 => _colorIt(child: _childToColor, color: Vx.green300);
  T get green400 => _colorIt(child: _childToColor, color: Vx.green400);
  T get green500 => _colorIt(child: _childToColor, color: Vx.green500);
  T get green600 => _colorIt(child: _childToColor, color: Vx.green600);
  T get green700 => _colorIt(child: _childToColor, color: Vx.green700);
  T get green800 => _colorIt(child: _childToColor, color: Vx.green800);
  T get green900 => _colorIt(child: _childToColor, color: Vx.green900);

  ///Emerald
  T get emerald50 => _colorIt(child: _childToColor, color: Vx.emerald50);
  T get emerald100 => _colorIt(child: _childToColor, color: Vx.emerald100);
  T get emerald200 => _colorIt(child: _childToColor, color: Vx.emerald200);
  T get emerald300 => _colorIt(child: _childToColor, color: Vx.emerald300);
  T get emerald400 => _colorIt(child: _childToColor, color: Vx.emerald400);
  T get emerald500 => _colorIt(child: _childToColor, color: Vx.emerald500);
  T get emerald600 => _colorIt(child: _childToColor, color: Vx.emerald600);
  T get emerald700 => _colorIt(child: _childToColor, color: Vx.emerald700);
  T get emerald800 => _colorIt(child: _childToColor, color: Vx.emerald800);
  T get emerald900 => _colorIt(child: _childToColor, color: Vx.emerald900);

  ///teal
  T get teal50 => _colorIt(child: _childToColor, color: Vx.teal50);
  T get teal100 => _colorIt(child: _childToColor, color: Vx.teal100);
  T get teal200 => _colorIt(child: _childToColor, color: Vx.teal200);
  T get teal300 => _colorIt(child: _childToColor, color: Vx.teal300);
  T get teal400 => _colorIt(child: _childToColor, color: Vx.teal400);
  T get teal500 => _colorIt(child: _childToColor, color: Vx.teal500);
  T get teal600 => _colorIt(child: _childToColor, color: Vx.teal600);
  T get teal700 => _colorIt(child: _childToColor, color: Vx.teal700);
  T get teal800 => _colorIt(child: _childToColor, color: Vx.teal800);
  T get teal900 => _colorIt(child: _childToColor, color: Vx.teal900);

  ///Cyan
  T get cyan50 => _colorIt(child: _childToColor, color: Vx.cyan50);
  T get cyan100 => _colorIt(child: _childToColor, color: Vx.cyan100);
  T get cyan200 => _colorIt(child: _childToColor, color: Vx.cyan200);
  T get cyan300 => _colorIt(child: _childToColor, color: Vx.cyan300);
  T get cyan400 => _colorIt(child: _childToColor, color: Vx.cyan400);
  T get cyan500 => _colorIt(child: _childToColor, color: Vx.cyan500);
  T get cyan600 => _colorIt(child: _childToColor, color: Vx.cyan600);
  T get cyan700 => _colorIt(child: _childToColor, color: Vx.cyan700);
  T get cyan800 => _colorIt(child: _childToColor, color: Vx.cyan800);
  T get cyan900 => _colorIt(child: _childToColor, color: Vx.cyan900);

  ///Sky
  T get sky50 => _colorIt(child: _childToColor, color: Vx.sky50);
  T get sky100 => _colorIt(child: _childToColor, color: Vx.sky100);
  T get sky200 => _colorIt(child: _childToColor, color: Vx.sky200);
  T get sky300 => _colorIt(child: _childToColor, color: Vx.sky300);
  T get sky400 => _colorIt(child: _childToColor, color: Vx.sky400);
  T get sky500 => _colorIt(child: _childToColor, color: Vx.sky500);
  T get sky600 => _colorIt(child: _childToColor, color: Vx.sky600);
  T get sky700 => _colorIt(child: _childToColor, color: Vx.sky700);
  T get sky800 => _colorIt(child: _childToColor, color: Vx.sky800);
  T get sky900 => _colorIt(child: _childToColor, color: Vx.sky900);

  ///Blue
  T get blue50 => _colorIt(child: _childToColor, color: Vx.blue50);
  T get blue100 => _colorIt(child: _childToColor, color: Vx.blue100);
  T get blue200 => _colorIt(child: _childToColor, color: Vx.blue200);
  T get blue300 => _colorIt(child: _childToColor, color: Vx.blue300);
  T get blue400 => _colorIt(child: _childToColor, color: Vx.blue400);
  T get blue500 => _colorIt(child: _childToColor, color: Vx.blue500);
  T get blue600 => _colorIt(child: _childToColor, color: Vx.blue600);
  T get blue700 => _colorIt(child: _childToColor, color: Vx.blue700);
  T get blue800 => _colorIt(child: _childToColor, color: Vx.blue800);
  T get blue900 => _colorIt(child: _childToColor, color: Vx.blue900);

  ///Indigo
  T get indigo50 => _colorIt(child: _childToColor, color: Vx.indigo50);
  T get indigo100 => _colorIt(child: _childToColor, color: Vx.indigo100);
  T get indigo200 => _colorIt(child: _childToColor, color: Vx.indigo200);
  T get indigo300 => _colorIt(child: _childToColor, color: Vx.indigo300);
  T get indigo400 => _colorIt(child: _childToColor, color: Vx.indigo400);
  T get indigo500 => _colorIt(child: _childToColor, color: Vx.indigo500);
  T get indigo600 => _colorIt(child: _childToColor, color: Vx.indigo600);
  T get indigo700 => _colorIt(child: _childToColor, color: Vx.indigo700);
  T get indigo800 => _colorIt(child: _childToColor, color: Vx.indigo800);
  T get indigo900 => _colorIt(child: _childToColor, color: Vx.indigo900);

  ///Violet
  T get violet50 => _colorIt(child: _childToColor, color: Vx.violet50);
  T get violet100 => _colorIt(child: _childToColor, color: Vx.violet100);
  T get violet200 => _colorIt(child: _childToColor, color: Vx.violet200);
  T get violet300 => _colorIt(child: _childToColor, color: Vx.violet300);
  T get violet400 => _colorIt(child: _childToColor, color: Vx.violet400);
  T get violet500 => _colorIt(child: _childToColor, color: Vx.violet500);
  T get violet600 => _colorIt(child: _childToColor, color: Vx.violet600);
  T get violet700 => _colorIt(child: _childToColor, color: Vx.violet700);
  T get violet800 => _colorIt(child: _childToColor, color: Vx.violet800);
  T get violet900 => _colorIt(child: _childToColor, color: Vx.violet900);

  ///Purple
  T get purple50 => _colorIt(child: _childToColor, color: Vx.purple50);
  T get purple100 => _colorIt(child: _childToColor, color: Vx.purple100);
  T get purple200 => _colorIt(child: _childToColor, color: Vx.purple200);
  T get purple300 => _colorIt(child: _childToColor, color: Vx.purple300);
  T get purple400 => _colorIt(child: _childToColor, color: Vx.purple400);
  T get purple500 => _colorIt(child: _childToColor, color: Vx.purple500);
  T get purple600 => _colorIt(child: _childToColor, color: Vx.purple600);
  T get purple700 => _colorIt(child: _childToColor, color: Vx.purple700);
  T get purple800 => _colorIt(child: _childToColor, color: Vx.purple800);
  T get purple900 => _colorIt(child: _childToColor, color: Vx.purple900);

  ///Fuchsia
  T get fuchsia50 => _colorIt(child: _childToColor, color: Vx.fuchsia50);
  T get fuchsia100 => _colorIt(child: _childToColor, color: Vx.fuchsia100);
  T get fuchsia200 => _colorIt(child: _childToColor, color: Vx.fuchsia200);
  T get fuchsia300 => _colorIt(child: _childToColor, color: Vx.fuchsia300);
  T get fuchsia400 => _colorIt(child: _childToColor, color: Vx.fuchsia400);
  T get fuchsia500 => _colorIt(child: _childToColor, color: Vx.fuchsia500);
  T get fuchsia600 => _colorIt(child: _childToColor, color: Vx.fuchsia600);
  T get fuchsia700 => _colorIt(child: _childToColor, color: Vx.fuchsia700);
  T get fuchsia800 => _colorIt(child: _childToColor, color: Vx.fuchsia800);
  T get fuchsia900 => _colorIt(child: _childToColor, color: Vx.fuchsia900);

  ///Pink
  T get pink50 => _colorIt(child: _childToColor, color: Vx.pink50);
  T get pink100 => _colorIt(child: _childToColor, color: Vx.pink100);
  T get pink200 => _colorIt(child: _childToColor, color: Vx.pink200);
  T get pink300 => _colorIt(child: _childToColor, color: Vx.pink300);
  T get pink400 => _colorIt(child: _childToColor, color: Vx.pink400);
  T get pink500 => _colorIt(child: _childToColor, color: Vx.pink500);
  T get pink600 => _colorIt(child: _childToColor, color: Vx.pink600);
  T get pink700 => _colorIt(child: _childToColor, color: Vx.pink700);
  T get pink800 => _colorIt(child: _childToColor, color: Vx.pink800);
  T get pink900 => _colorIt(child: _childToColor, color: Vx.pink900);

  ///Rose
  T get rose50 => _colorIt(child: _childToColor, color: Vx.rose50);
  T get rose100 => _colorIt(child: _childToColor, color: Vx.rose100);
  T get rose200 => _colorIt(child: _childToColor, color: Vx.rose200);
  T get rose300 => _colorIt(child: _childToColor, color: Vx.rose300);
  T get rose400 => _colorIt(child: _childToColor, color: Vx.rose400);
  T get rose500 => _colorIt(child: _childToColor, color: Vx.rose500);
  T get rose600 => _colorIt(child: _childToColor, color: Vx.rose600);
  T get rose700 => _colorIt(child: _childToColor, color: Vx.rose700);
  T get rose800 => _colorIt(child: _childToColor, color: Vx.rose800);
  T get rose900 => _colorIt(child: _childToColor, color: Vx.rose900);

  ///Transparent
  T get transparent {
    velocityColor = Colors.transparent;
    return _childToColor;
  }

  T _colorIt({required Color color, required T child}) {
    velocityColor = color;
    return child;
  }
}
