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

extension WidgetsExtension on Widget {
  ///Tooltip as accesibility
  Widget tooltip(String message,
          {Decoration decoration,
          double height,
          bool preferBelow,
          EdgeInsetsGeometry padding,
          TextStyle textStyle,
          Duration waitDuration,
          EdgeInsetsGeometry margin}) =>
      Tooltip(
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );

  ///Hide a widget
  Widget hide({Key key, bool isVisible = false}) => Visibility(
        child: this,
        visible: isVisible,
      );

  Widget hideButOccupy({Key key, bool isVisible = false}) => Visibility(
        child: this,
        visible: isVisible,
        maintainAnimation: true,
        maintainState: true,
        maintainSize: true,
      );

  /// Provides a border with default Width as 1.0 and color = Colors.black
  Widget boxBorder({Key key, Color color = Colors.black, double width = 1.0}) =>
      DecoratedBox(
        key: key,
        decoration:
            BoxDecoration(border: Border.all(color: color, width: width)),
        child: this,
      );

  Widget bgWhite({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.white);
  Widget bgBlack({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.black);

  Widget bgGray100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray100);
  Widget bgGray200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray200);
  Widget bgGray300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray300);
  Widget bgGray400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray400);
  Widget bgGray500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray500);
  Widget bgGray600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray600);
  Widget bgGray700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray700);
  Widget bgGray800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray800);
  Widget bgGray900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.gray900);

  Widget bgRed100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red100);
  Widget bgRed200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red200);
  Widget bgRed300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red300);
  Widget bgRed400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red400);
  Widget bgRed500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red500);
  Widget bgRed600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red600);
  Widget bgRed700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red700);
  Widget bgRed800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red800);
  Widget bgRed900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.red900);

  Widget bgOrange100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange100);
  Widget bgOrange200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange200);
  Widget bgOrange300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange300);
  Widget bgOrange400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange400);
  Widget bgOrange500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange500);
  Widget bgOrange600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange600);
  Widget bgOrange700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange700);
  Widget bgOrange800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange800);
  Widget bgOrange900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.orange900);

  Widget bgYellow100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow100);
  Widget bgYellow200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow200);
  Widget bgYellow300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow300);
  Widget bgYellow400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow400);
  Widget bgYellow500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow500);
  Widget bgYellow600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow600);
  Widget bgYellow700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow700);
  Widget bgYellow800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow800);
  Widget bgYellow900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.yellow900);

  Widget bgGreen100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green100);
  Widget bgGreen200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green200);
  Widget bgGreen300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green300);
  Widget bgGreen400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green400);
  Widget bgGreen500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green500);
  Widget bgGreen600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green600);
  Widget bgGreen700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green700);
  Widget bgGreen800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green800);
  Widget bgGreen900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.green900);

  Widget bgTeal100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal100);
  Widget bgTeal200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal200);
  Widget bgTeal300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal300);
  Widget bgTeal400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal400);
  Widget bgTeal500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal500);
  Widget bgTeal600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal600);
  Widget bgTeal700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal700);
  Widget bgTeal800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal800);
  Widget bgTeal900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.teal900);

  Widget bgBlue100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue100);
  Widget bgBlue200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue200);
  Widget bgBlue300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue300);
  Widget bgBlue400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue400);
  Widget bgBlue500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue500);
  Widget bgBlue600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue600);
  Widget bgBlue700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue700);
  Widget bgBlue800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue800);
  Widget bgBlue900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.blue900);

  Widget bgIndigo100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo100);
  Widget bgIndigo200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo200);
  Widget bgIndigo300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo300);
  Widget bgIndigo400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo400);
  Widget bgIndigo500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo500);
  Widget bgIndigo600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo600);
  Widget bgIndigo700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo700);
  Widget bgIndigo800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo800);
  Widget bgIndigo900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.indigo900);

  Widget bgPurple100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple100);
  Widget bgPurple200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple200);
  Widget bgPurple300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple300);
  Widget bgPurple400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple400);
  Widget bgPurple500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple500);
  Widget bgPurple600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple600);
  Widget bgPurple700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple700);
  Widget bgPurple800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple800);
  Widget bgPurple900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.purple900);

  Widget bgPink100({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink100);
  Widget bgPink200({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink200);
  Widget bgPink300({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink300);
  Widget bgPink400({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink400);
  Widget bgPink500({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink500);
  Widget bgPink600({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink600);
  Widget bgPink700({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink700);
  Widget bgPink800({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink800);
  Widget bgPink900({Key key}) =>
      _coloredWidget(key: key, child: this, color: VelocityX.pink900);

  Widget bgTransparent({Key key}) {
    return DecoratedBox(
      key: key,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: this,
    );
  }

  Widget _coloredWidget(
      {Key key, @required String color, @required Widget child}) {
    return DecoratedBox(
      key: key,
      decoration: BoxDecoration(
        color: VelocityX.hexToColor(color),
      ),
      child: child,
    );
  }
}
