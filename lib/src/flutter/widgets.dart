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

enum RoundedShape { SM, M, LG, FULL }

extension WidgetsExtension on Widget {
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

  Widget shadow({
    Key key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 1.0),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        child: this,
      );

  Widget shadowXS({
    Key key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 0.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: this,
      );

  Widget shadowSM({
    Key key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        child: this,
      );

  Widget shadowMD({
    Key key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 6.0,
              spreadRadius: -1.0,
              offset: Offset(0.0, 4.0),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 4.0,
              spreadRadius: -1.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: this,
      );
  Widget shadowLG({
    Key key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 15.0,
              spreadRadius: -3.0,
              offset: Offset(0.0, 10.0),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 6.0,
              spreadRadius: -2.0,
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
        child: this,
      );

  Widget shadowXL({
    Key key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 25.0,
              spreadRadius: -5.0,
              offset: Offset(0.0, 20.0),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 10.0,
              spreadRadius: -5.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: this,
      );

  Widget shadow2XL({
    Key key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 50.0,
              spreadRadius: -12.0,
              offset: Offset(0.0, 25.0),
            ),
          ],
        ),
        child: this,
      );

  Widget shadowOutline({
    Key key,
    Color outlineColor,
  }) =>
      DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: outlineColor?.withOpacity(0.5) ??
                  const Color.fromRGBO(66, 153, 225, 0.5),
              blurRadius: 0.0,
              spreadRadius: 3.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: this,
      );

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

  Widget boxBorder({Key key, @required double width, @required Color color}) =>
      DecoratedBox(
        key: key,
        decoration:
            BoxDecoration(border: Border.all(color: color, width: width)),
        child: this,
      );

  Widget objectCover({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.cover,
        child: this,
        alignment: Alignment.center,
      );

  Widget objectContain({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.contain,
        child: this,
        alignment: Alignment.center,
      );

  Widget objectFill({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.fill,
        child: this,
        alignment: Alignment.center,
      );

  Widget objectScaleDown({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.scaleDown,
        child: this,
        alignment: Alignment.center,
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
