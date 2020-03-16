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
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

import 'builder.dart';

class _ContainerBuilder extends VelocityXWidgetBuilder<Widget> {
  _ContainerBuilder(this._child);

  final Widget _child;
  Color _bgColor;
  double _roundedValue;
  bool _isCircleRounded = false;
  List<BoxShadow> _boxShadow;
  BoxBorder _border;
  Gradient _gradient;
  double _height;
  double _width;
  EdgeInsetsGeometry _padding;
  EdgeInsetsGeometry _margin;
  AlignmentGeometry _alignment;
  Matrix4 _transform;

  _ContainerBuilder height(double val) => this.._height = val;
  _ContainerBuilder width(double val) => this.._width = val;

  /// Alignment
  _ContainerBuilder alignment(Alignment val) => this.._alignment = val;
  _ContainerBuilder get alignTopCenter =>
      this.._alignment = Alignment.topCenter;

  _ContainerBuilder get alignTopLeft => this.._alignment = Alignment.topLeft;

  _ContainerBuilder get alignTopRight => this.._alignment = Alignment.topRight;

  _ContainerBuilder get alignCenter => this.._alignment = Alignment.center;
  _ContainerBuilder get alignCenterLeft =>
      this.._alignment = Alignment.centerLeft;
  _ContainerBuilder get alignCenterRight =>
      this.._alignment = Alignment.centerRight;

  _ContainerBuilder get alignBottomCenter =>
      this.._alignment = Alignment.bottomCenter;

  _ContainerBuilder get alignBottomLeft =>
      this.._alignment = Alignment.bottomLeft;

  _ContainerBuilder get alignBottomRight =>
      this.._alignment = Alignment.bottomRight;

  // transforming
  _ContainerBuilder transform(Matrix4 val) => this.._transform = val;

  /// Rounding
  _ContainerBuilder get roundedNone => this.._roundedValue = 0.0;

  _ContainerBuilder get roundedSM => this.._roundedValue = 7.5;

  _ContainerBuilder get rounded => this.._roundedValue = 15.0;

  _ContainerBuilder withRounded({double value = 15.0}) =>
      this.._roundedValue = value;

  _ContainerBuilder get roundedLg => this.._roundedValue = 30.0;

  _ContainerBuilder get roundedFull => this.._isCircleRounded = true;

  /// Shadowing
  _ContainerBuilder get shadow {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 3.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 1.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.06),
        blurRadius: 2.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 1.0),
      ),
    ];

    return this;
  }

  _ContainerBuilder get shadowXs {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 0.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 0.0),
      ),
    ];

    return this;
  }

  _ContainerBuilder get shadowSm {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 2.0,
        spreadRadius: 0.0,
        offset: Offset(0.0, 1.0),
      ),
    ];

    return this;
  }

  _ContainerBuilder get shadowMd {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 6.0,
        spreadRadius: -1.0,
        offset: Offset(0.0, 4.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.06),
        blurRadius: 4.0,
        spreadRadius: -1.0,
        offset: Offset(0.0, 2.0),
      ),
    ];

    return this;
  }

  _ContainerBuilder get shadowLg {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 15.0,
        spreadRadius: -3.0,
        offset: Offset(0.0, 10.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 6.0,
        spreadRadius: -2.0,
        offset: Offset(0.0, 4.0),
      ),
    ];

    return this;
  }

  _ContainerBuilder get shadowXl {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 25.0,
        spreadRadius: -5.0,
        offset: Offset(0.0, 20.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.04),
        blurRadius: 10.0,
        spreadRadius: -5.0,
        offset: Offset(0.0, 10.0),
      ),
    ];

    return this;
  }

  _ContainerBuilder get shadow2xl {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        blurRadius: 50.0,
        spreadRadius: -12.0,
        offset: Offset(0.0, 25.0),
      ),
    ];

    return this;
  }

  _ContainerBuilder shadowOutline({Color outlineColor}) {
    _boxShadow = [
      BoxShadow(
        color: outlineColor?.withOpacity(0.5) ??
            const Color.fromRGBO(66, 153, 225, 0.5),
        blurRadius: 0.0,
        spreadRadius: 3.0,
        offset: const Offset(0.0, 0.0),
      ),
    ];

    return this;
  }

  /// Bordering
  _ContainerBuilder border(
      {Color color = Colors.black,
      double width = 1.0,
      BorderStyle style = BorderStyle.solid}) {
    _border = Border.all(color: color, width: width, style: style);
    return this;
  }

  ///Gradienting
  _ContainerBuilder linearGradient(List<Color> colors) =>
      this.._gradient = LinearGradient(colors: colors);

  _ContainerBuilder radialGradient(List<Color> colors) =>
      this.._gradient = RadialGradient(colors: colors);

  _ContainerBuilder sweepGradient(List<Color> colors) =>
      this.._gradient = SweepGradient(colors: colors);

  ///Colors
  _ContainerBuilder get bgWhite =>
      _coloredWidget(child: this, color: VelocityX.white);
  _ContainerBuilder get bgBlack =>
      _coloredWidget(child: this, color: VelocityX.black);

  _ContainerBuilder get bgGray100 =>
      _coloredWidget(child: this, color: VelocityX.gray100);
  _ContainerBuilder get bgGray200 =>
      _coloredWidget(child: this, color: VelocityX.gray200);
  _ContainerBuilder get bgGray300 =>
      _coloredWidget(child: this, color: VelocityX.gray300);
  _ContainerBuilder get bgGray400 =>
      _coloredWidget(child: this, color: VelocityX.gray400);
  _ContainerBuilder get bgGray500 =>
      _coloredWidget(child: this, color: VelocityX.gray500);
  _ContainerBuilder get bgGray600 =>
      _coloredWidget(child: this, color: VelocityX.gray600);
  _ContainerBuilder get bgGray700 =>
      _coloredWidget(child: this, color: VelocityX.gray700);
  _ContainerBuilder get bgGray800 =>
      _coloredWidget(child: this, color: VelocityX.gray800);
  _ContainerBuilder get bgGray900 =>
      _coloredWidget(child: this, color: VelocityX.gray900);

  _ContainerBuilder get bgRed100 =>
      _coloredWidget(child: this, color: VelocityX.red100);
  _ContainerBuilder get bgRed200 =>
      _coloredWidget(child: this, color: VelocityX.red200);
  _ContainerBuilder get bgRed300 =>
      _coloredWidget(child: this, color: VelocityX.red300);
  _ContainerBuilder get bgRed400 =>
      _coloredWidget(child: this, color: VelocityX.red400);
  _ContainerBuilder get bgRed500 =>
      _coloredWidget(child: this, color: VelocityX.red500);
  _ContainerBuilder get bgRed600 =>
      _coloredWidget(child: this, color: VelocityX.red600);
  _ContainerBuilder get bgRed700 =>
      _coloredWidget(child: this, color: VelocityX.red700);
  _ContainerBuilder get bgRed800 =>
      _coloredWidget(child: this, color: VelocityX.red800);
  _ContainerBuilder get bgRed900 =>
      _coloredWidget(child: this, color: VelocityX.red900);

  _ContainerBuilder get bgOrange100 =>
      _coloredWidget(child: this, color: VelocityX.orange100);
  _ContainerBuilder get bgOrange200 =>
      _coloredWidget(child: this, color: VelocityX.orange200);
  _ContainerBuilder get bgOrange300 =>
      _coloredWidget(child: this, color: VelocityX.orange300);
  _ContainerBuilder get bgOrange400 =>
      _coloredWidget(child: this, color: VelocityX.orange400);
  _ContainerBuilder get bgOrange500 =>
      _coloredWidget(child: this, color: VelocityX.orange500);
  _ContainerBuilder get bgOrange600 =>
      _coloredWidget(child: this, color: VelocityX.orange600);
  _ContainerBuilder get bgOrange700 =>
      _coloredWidget(child: this, color: VelocityX.orange700);
  _ContainerBuilder get bgOrange800 =>
      _coloredWidget(child: this, color: VelocityX.orange800);
  _ContainerBuilder get bgOrange900 =>
      _coloredWidget(child: this, color: VelocityX.orange900);

  _ContainerBuilder get bgYellow100 =>
      _coloredWidget(child: this, color: VelocityX.yellow100);
  _ContainerBuilder get bgYellow200 =>
      _coloredWidget(child: this, color: VelocityX.yellow200);
  _ContainerBuilder get bgYellow300 =>
      _coloredWidget(child: this, color: VelocityX.yellow300);
  _ContainerBuilder get bgYellow400 =>
      _coloredWidget(child: this, color: VelocityX.yellow400);
  _ContainerBuilder get bgYellow500 =>
      _coloredWidget(child: this, color: VelocityX.yellow500);
  _ContainerBuilder get bgYellow600 =>
      _coloredWidget(child: this, color: VelocityX.yellow600);
  _ContainerBuilder get bgYellow700 =>
      _coloredWidget(child: this, color: VelocityX.yellow700);
  _ContainerBuilder get bgYellow800 =>
      _coloredWidget(child: this, color: VelocityX.yellow800);
  _ContainerBuilder get bgYellow900 =>
      _coloredWidget(child: this, color: VelocityX.yellow900);

  _ContainerBuilder get bgGreen100 =>
      _coloredWidget(child: this, color: VelocityX.green100);
  _ContainerBuilder get bgGreen200 =>
      _coloredWidget(child: this, color: VelocityX.green200);
  _ContainerBuilder get bgGreen300 =>
      _coloredWidget(child: this, color: VelocityX.green300);
  _ContainerBuilder get bgGreen400 =>
      _coloredWidget(child: this, color: VelocityX.green400);
  _ContainerBuilder get bgGreen500 =>
      _coloredWidget(child: this, color: VelocityX.green500);
  _ContainerBuilder get bgGreen600 =>
      _coloredWidget(child: this, color: VelocityX.green600);
  _ContainerBuilder get bgGreen700 =>
      _coloredWidget(child: this, color: VelocityX.green700);
  _ContainerBuilder get bgGreen800 =>
      _coloredWidget(child: this, color: VelocityX.green800);
  _ContainerBuilder get bgGreen900 =>
      _coloredWidget(child: this, color: VelocityX.green900);

  _ContainerBuilder get bgTeal100 =>
      _coloredWidget(child: this, color: VelocityX.teal100);
  _ContainerBuilder get bgTeal200 =>
      _coloredWidget(child: this, color: VelocityX.teal200);
  _ContainerBuilder get bgTeal300 =>
      _coloredWidget(child: this, color: VelocityX.teal300);
  _ContainerBuilder get bgTeal400 =>
      _coloredWidget(child: this, color: VelocityX.teal400);
  _ContainerBuilder get bgTeal500 =>
      _coloredWidget(child: this, color: VelocityX.teal500);
  _ContainerBuilder get bgTeal600 =>
      _coloredWidget(child: this, color: VelocityX.teal600);
  _ContainerBuilder get bgTeal700 =>
      _coloredWidget(child: this, color: VelocityX.teal700);
  _ContainerBuilder get bgTeal800 =>
      _coloredWidget(child: this, color: VelocityX.teal800);
  _ContainerBuilder get bgTeal900 =>
      _coloredWidget(child: this, color: VelocityX.teal900);

  _ContainerBuilder get bgBlue100 =>
      _coloredWidget(child: this, color: VelocityX.blue100);
  _ContainerBuilder get bgBlue200 =>
      _coloredWidget(child: this, color: VelocityX.blue200);
  _ContainerBuilder get bgBlue300 =>
      _coloredWidget(child: this, color: VelocityX.blue300);
  _ContainerBuilder get bgBlue400 =>
      _coloredWidget(child: this, color: VelocityX.blue400);
  _ContainerBuilder get bgBlue500 =>
      _coloredWidget(child: this, color: VelocityX.blue500);
  _ContainerBuilder get bgBlue600 =>
      _coloredWidget(child: this, color: VelocityX.blue600);
  _ContainerBuilder get bgBlue700 =>
      _coloredWidget(child: this, color: VelocityX.blue700);
  _ContainerBuilder get bgBlue800 =>
      _coloredWidget(child: this, color: VelocityX.blue800);
  _ContainerBuilder get bgBlue900 =>
      _coloredWidget(child: this, color: VelocityX.blue900);

  _ContainerBuilder get bgIndigo100 =>
      _coloredWidget(child: this, color: VelocityX.indigo100);
  _ContainerBuilder get bgIndigo200 =>
      _coloredWidget(child: this, color: VelocityX.indigo200);
  _ContainerBuilder get bgIndigo300 =>
      _coloredWidget(child: this, color: VelocityX.indigo300);
  _ContainerBuilder get bgIndigo400 =>
      _coloredWidget(child: this, color: VelocityX.indigo400);
  _ContainerBuilder get bgIndigo500 =>
      _coloredWidget(child: this, color: VelocityX.indigo500);
  _ContainerBuilder get bgIndigo600 =>
      _coloredWidget(child: this, color: VelocityX.indigo600);
  _ContainerBuilder get bgIndigo700 =>
      _coloredWidget(child: this, color: VelocityX.indigo700);
  _ContainerBuilder get bgIndigo800 =>
      _coloredWidget(child: this, color: VelocityX.indigo800);
  _ContainerBuilder get bgIndigo900 =>
      _coloredWidget(child: this, color: VelocityX.indigo900);

  _ContainerBuilder get bgPurple100 =>
      _coloredWidget(child: this, color: VelocityX.purple100);
  _ContainerBuilder get bgPurple200 =>
      _coloredWidget(child: this, color: VelocityX.purple200);
  _ContainerBuilder get bgPurple300 =>
      _coloredWidget(child: this, color: VelocityX.purple300);
  _ContainerBuilder get bgPurple400 =>
      _coloredWidget(child: this, color: VelocityX.purple400);
  _ContainerBuilder get bgPurple500 =>
      _coloredWidget(child: this, color: VelocityX.purple500);
  _ContainerBuilder get bgPurple600 =>
      _coloredWidget(child: this, color: VelocityX.purple600);
  _ContainerBuilder get bgPurple700 =>
      _coloredWidget(child: this, color: VelocityX.purple700);
  _ContainerBuilder get bgPurple800 =>
      _coloredWidget(child: this, color: VelocityX.purple800);
  _ContainerBuilder get bgPurple900 =>
      _coloredWidget(child: this, color: VelocityX.purple900);

  _ContainerBuilder get bgPink100 =>
      _coloredWidget(child: this, color: VelocityX.pink100);
  _ContainerBuilder get bgPink200 =>
      _coloredWidget(child: this, color: VelocityX.pink200);
  _ContainerBuilder get bgPink300 =>
      _coloredWidget(child: this, color: VelocityX.pink300);
  _ContainerBuilder get bgPink400 =>
      _coloredWidget(child: this, color: VelocityX.pink400);
  _ContainerBuilder get bgPink500 =>
      _coloredWidget(child: this, color: VelocityX.pink500);
  _ContainerBuilder get bgPink600 =>
      _coloredWidget(child: this, color: VelocityX.pink600);
  _ContainerBuilder get bgPink700 =>
      _coloredWidget(child: this, color: VelocityX.pink700);
  _ContainerBuilder get bgPink800 =>
      _coloredWidget(child: this, color: VelocityX.pink800);
  _ContainerBuilder get bgPink900 =>
      _coloredWidget(child: this, color: VelocityX.pink900);

  _ContainerBuilder get bgTransparent => this.._bgColor = Colors.transparent;

  _ContainerBuilder _coloredWidget(
      {@required String color, @required _ContainerBuilder child}) {
    _bgColor = VelocityX.hexToColor(color);
    return this;
  }

  @override
  Widget build() {
    return Container(
      height: _height,
      width: _width,
      padding: _padding,
      margin: _margin,
      alignment: _alignment,
      transform: _transform,
      child: _child,
      decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: _isCircleRounded || _roundedValue.isNull
              ? null
              : BorderRadius.circular(_roundedValue),
          shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
          boxShadow: _boxShadow ?? [],
          border: _border,
          gradient: _gradient),
    );
  }
}

extension ContainerExtension on Widget {
  _ContainerBuilder get box => _ContainerBuilder(this);
}
