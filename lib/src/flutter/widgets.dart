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

  Widget rounded({Key key, Color backgroundColor, double value = 15.0}) =>
      Container(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          borderRadius: BorderRadius.all(
            Radius.circular(value),
          ),
        ),
        child: this,
      );

  Widget roundedNone({Key key, Color backgroundColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),
        child: this,
      );

  Widget roundedSM({Key key, Color backgroundColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(7.5),
          ),
        ),
        child: this,
      );
  Widget roundedLG({Key key, Color backgroundColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: this,
      );

  Widget roundedFull({Key key, Color backgroundColor}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
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
}
