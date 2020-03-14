/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

extension ContainerExtensions on Container {
  ///  Add round corners to a Container
  ///  if the Container already has a color use [backgroundColor] instead and remove the
  ///  [Color] from the Container it self.
  ///  If backgroundColor is null then canvasColor will be applied
  Container rounded({Key key, Color backgroundColor, double value = 15.0}) =>
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

  Container roundedNone({Key key, Color backgroundColor}) => Container(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),
        child: this,
      );

  Container roundedSM({Key key, Color backgroundColor}) => Container(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(7.5),
          ),
        ),
        child: this,
      );
  Container roundedLG({Key key, Color backgroundColor}) => Container(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: this,
      );

  Container roundedFull({Key key, Color backgroundColor}) => Container(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeData().canvasColor,
          shape: BoxShape.circle,
        ),
        child: this,
      );

  /// A shadowed container
  ///
  /// [shadowColor]
  Container shadow({
    Key key,
  }) =>
      Container(
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

  Container shadowXS({
    Key key,
  }) =>
      Container(
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

  Container shadowSM({
    Key key,
  }) =>
      Container(
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

  Container shadowMD({
    Key key,
  }) =>
      Container(
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
  Container shadowLG({
    Key key,
  }) =>
      Container(
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

  Container shadowXL({
    Key key,
  }) =>
      Container(
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

  Container shadow2XL({
    Key key,
  }) =>
      Container(
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

  Container shadowOutline({
    Key key,
  }) =>
      Container(
        key: key,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(66, 153, 225, 0.5),
              blurRadius: 0.0,
              spreadRadius: 3.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: this,
      );

  /// Colors

  Container bgWhite({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.white);
  Container bgBlack({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.black);

  Container bgGray100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray100);
  Container bgGray200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray200);
  Container bgGray300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray300);
  Container bgGray400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray400);
  Container bgGray500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray500);
  Container bgGray600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray600);
  Container bgGray700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray700);
  Container bgGray800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray800);
  Container bgGray900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.gray900);

  Container bgRed100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red100);
  Container bgRed200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red200);
  Container bgRed300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red300);
  Container bgRed400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red400);
  Container bgRed500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red500);
  Container bgRed600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red600);
  Container bgRed700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red700);
  Container bgRed800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red800);
  Container bgRed900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.red900);

  Container bgOrange100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange100);
  Container bgOrange200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange200);
  Container bgOrange300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange300);
  Container bgOrange400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange400);
  Container bgOrange500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange500);
  Container bgOrange600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange600);
  Container bgOrange700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange700);
  Container bgOrange800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange800);
  Container bgOrange900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.orange900);

  Container bgYellow100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow100);
  Container bgYellow200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow200);
  Container bgYellow300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow300);
  Container bgYellow400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow400);
  Container bgYellow500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow500);
  Container bgYellow600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow600);
  Container bgYellow700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow700);
  Container bgYellow800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow800);
  Container bgYellow900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.yellow900);

  Container bgGreen100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green100);
  Container bgGreen200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green200);
  Container bgGreen300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green300);
  Container bgGreen400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green400);
  Container bgGreen500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green500);
  Container bgGreen600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green600);
  Container bgGreen700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green700);
  Container bgGreen800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green800);
  Container bgGreen900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.green900);

  Container bgTeal100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal100);
  Container bgTeal200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal200);
  Container bgTeal300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal300);
  Container bgTeal400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal400);
  Container bgTeal500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal500);
  Container bgTeal600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal600);
  Container bgTeal700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal700);
  Container bgTeal800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal800);
  Container bgTeal900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.teal900);

  Container bgBlue100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue100);
  Container bgBlue200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue200);
  Container bgBlue300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue300);
  Container bgBlue400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue400);
  Container bgBlue500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue500);
  Container bgBlue600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue600);
  Container bgBlue700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue700);
  Container bgBlue800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue800);
  Container bgBlue900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.blue900);

  Container bgIndigo100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo100);
  Container bgIndigo200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo200);
  Container bgIndigo300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo300);
  Container bgIndigo400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo400);
  Container bgIndigo500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo500);
  Container bgIndigo600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo600);
  Container bgIndigo700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo700);
  Container bgIndigo800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo800);
  Container bgIndigo900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.indigo900);

  Container bgPurple100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple100);
  Container bgPurple200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple200);
  Container bgPurple300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple300);
  Container bgPurple400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple400);
  Container bgPurple500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple500);
  Container bgPurple600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple600);
  Container bgPurple700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple700);
  Container bgPurple800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple800);
  Container bgPurple900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.purple900);

  Container bgPink100({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink100);
  Container bgPink200({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink200);
  Container bgPink300({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink300);
  Container bgPink400({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink400);
  Container bgPink500({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink500);
  Container bgPink600({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink600);
  Container bgPink700({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink700);
  Container bgPink800({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink800);
  Container bgPink900({Key key}) =>
      _coloredContainer(key: key, child: this, color: VelocityX.pink900);

  Container bgTransparent({Key key}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: child,
    );
  }

  Container _coloredContainer(
      {Key key, @required String color, @required Container child}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: VelocityX.hexToColor(color),
      ),
      child: child,
    );
  }
}
