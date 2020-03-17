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

class _VelocityXContainerBuilder extends VelocityXWidgetBuilder<Widget>
    with
        VelocityColorMixin<_VelocityXContainerBuilder>,
        VelocityPaddingMixin<_VelocityXContainerBuilder> {
  _VelocityXContainerBuilder(this._child) : assert(_child != null) {
    setChildToColor(this);
    setChildToPad(this);
  }

  final Widget _child;

  double _roundedValue;
  bool _isCircleRounded = false;
  List<BoxShadow> _boxShadow;
  BoxBorder _border;
  Gradient _gradient;
  double _height;
  double _width;

  EdgeInsetsGeometry _margin;
  AlignmentGeometry _alignment;
  Matrix4 _transform;

  _VelocityXContainerBuilder height(double val) => this.._height = val;
  _VelocityXContainerBuilder width(double val) => this.._width = val;

  _VelocityXContainerBuilder padding(EdgeInsetsGeometry val) =>
      this..velocityPadding = val;

  _VelocityXContainerBuilder margin(EdgeInsetsGeometry val) =>
      this.._margin = val;

  _VelocityXContainerBuilder color(Color color) => this..velocityColor = color;

  _VelocityXContainerBuilder hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  /// Alignment
  _VelocityXContainerBuilder alignment(Alignment val) => this.._alignment = val;
  _VelocityXContainerBuilder get alignTopCenter =>
      this.._alignment = Alignment.topCenter;

  _VelocityXContainerBuilder get alignTopLeft =>
      this.._alignment = Alignment.topLeft;

  _VelocityXContainerBuilder get alignTopRight =>
      this.._alignment = Alignment.topRight;

  _VelocityXContainerBuilder get alignCenter =>
      this.._alignment = Alignment.center;
  _VelocityXContainerBuilder get alignCenterLeft =>
      this.._alignment = Alignment.centerLeft;
  _VelocityXContainerBuilder get alignCenterRight =>
      this.._alignment = Alignment.centerRight;

  _VelocityXContainerBuilder get alignBottomCenter =>
      this.._alignment = Alignment.bottomCenter;

  _VelocityXContainerBuilder get alignBottomLeft =>
      this.._alignment = Alignment.bottomLeft;

  _VelocityXContainerBuilder get alignBottomRight =>
      this.._alignment = Alignment.bottomRight;

  // transforming
  _VelocityXContainerBuilder transform(Matrix4 val) => this.._transform = val;

  /// Rounding
  _VelocityXContainerBuilder get roundedNone => this.._roundedValue = 0.0;

  _VelocityXContainerBuilder get roundedSM => this.._roundedValue = 7.5;

  _VelocityXContainerBuilder get rounded => this.._roundedValue = 15.0;

  _VelocityXContainerBuilder withRounded({double value = 15.0}) =>
      this.._roundedValue = value;

  _VelocityXContainerBuilder get roundedLg => this.._roundedValue = 30.0;

  _VelocityXContainerBuilder get roundedFull => this.._isCircleRounded = true;

  /// Shadowing
  _VelocityXContainerBuilder get shadow {
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

  _VelocityXContainerBuilder get shadowXs {
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

  _VelocityXContainerBuilder get shadowSm {
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

  _VelocityXContainerBuilder get shadowMd {
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

  _VelocityXContainerBuilder get shadowLg {
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

  _VelocityXContainerBuilder get shadowXl {
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

  _VelocityXContainerBuilder get shadow2xl {
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

  _VelocityXContainerBuilder shadowOutline({Color outlineColor}) {
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
  _VelocityXContainerBuilder border(
      {Color color = Colors.black,
      double width = 1.0,
      BorderStyle style = BorderStyle.solid}) {
    _border = Border.all(color: color, width: width, style: style);
    return this;
  }

  ///Gradienting
  _VelocityXContainerBuilder linearGradient(List<Color> colors) =>
      this.._gradient = LinearGradient(colors: colors);

  _VelocityXContainerBuilder radialGradient(List<Color> colors) =>
      this.._gradient = RadialGradient(colors: colors);

  _VelocityXContainerBuilder sweepGradient(List<Color> colors) =>
      this.._gradient = SweepGradient(colors: colors);

  @override
  Widget make() {
    return Container(
      height: _height,
      width: _width,
      padding: velocityPadding,
      margin: _margin,
      alignment: _alignment,
      transform: _transform,
      child: _child,
      decoration: BoxDecoration(
          color: velocityColor,
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
  _VelocityXContainerBuilder get box => _VelocityXContainerBuilder(this);
}
