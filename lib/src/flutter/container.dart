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
import 'package:velocity_x/src/flutter/velocityx_mixins/alignment_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/neu_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

import 'builder.dart';
import 'common/velocity_curve.dart';
import 'velocityx_mixins/color_mixin.dart';
import 'velocityx_mixins/padding_mixin.dart';
import 'velocityx_mixins/round_mixin.dart';

class VelocityBox extends VelocityXWidgetBuilder<Widget>
    with
        VelocityAlignmentMixing<VelocityBox>,
        VelocityColorMixin<VelocityBox>,
        VelocityPaddingMixin<VelocityBox>,
        VelocityRoundMixin<VelocityBox>,
        VelocityNeuMixin {
  VelocityBox({this.child}) {
    setChildForAlignment(this);
    setChildToColor(this);
    setChildToPad(this);
    setChildToRound(this);
  }

  final Widget child;

  bool _isCircleRounded = false;
  List<BoxShadow> _boxShadow;
  BoxBorder _border;
  Gradient _gradient;
  double _height;
  double _width;
  VelocityNeumorph _velocityNeumorph;

  EdgeInsetsGeometry _margin;
  Matrix4 _transform;

  DecorationImage _bgImage;

  VelocityBox height(double val) => this.._height = val;

  VelocityBox width(double val) => this.._width = val;

  VelocityBox padding(EdgeInsetsGeometry val) => this..velocityPadding = val;

  VelocityBox margin(EdgeInsetsGeometry val) => this.._margin = val;

  VelocityBox color(Color color) => this..velocityColor = color;

  VelocityBox hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  // transforming
  VelocityBox transform(Matrix4 val) => this.._transform = val;

  VelocityBox get roundedFull => this.._isCircleRounded = true;

  /// Shadowing
  VelocityBox get shadow {
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

  VelocityBox get shadowXs {
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

  VelocityBox get shadowSm {
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

  VelocityBox get shadowMd {
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

  VelocityBox get shadowLg {
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

  VelocityBox get shadowXl {
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

  VelocityBox get shadow2xl {
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

  /// Provide custom list of box shadows
  VelocityBox withShadow(List<BoxShadow> shadows) {
    _boxShadow = shadows;
    return this;
  }

  VelocityBox shadowOutline({Color outlineColor}) {
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
  VelocityBox border(
      {Color color = Colors.black,
      double width = 1.0,
      BorderStyle style = BorderStyle.solid}) {
    _border = Border.all(color: color, width: width, style: style);
    return this;
  }

  ///Gradienting
  VelocityBox linearGradient(List<Color> colors) =>
      this.._gradient = LinearGradient(colors: colors);

  VelocityBox radialGradient(List<Color> colors) =>
      this.._gradient = RadialGradient(colors: colors);

  VelocityBox sweepGradient(List<Color> colors) =>
      this.._gradient = SweepGradient(colors: colors);

  VelocityBox bgImage(DecorationImage image) => this.._bgImage = image;

  VelocityBox neumorphic(
          {Color color,
          VelocityCurve curve = VelocityCurve.concave,
          double elevation = 12.0}) =>
      this
        .._velocityNeumorph = velocityDecoration(
          color ?? velocityColor ?? ThemeData().scaffoldBackgroundColor,
          curve,
          elevation,
        );

  @override
  Widget make({Key key}) {
    return Container(
      key: key,
      height: _height,
      width: _width,
      padding: velocityPadding,
      margin: _margin,
      alignment: velocityAlignment,
      transform: _transform,
      child: child,
      decoration: _velocityNeumorph != null
          ? BoxDecoration(
              borderRadius: _isCircleRounded || roundedValue.isNull
                  ? null
                  : BorderRadius.circular(roundedValue),
              shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
              boxShadow: _velocityNeumorph.shadows,
              border: _border,
              gradient: _velocityNeumorph.gradient,
              image: _bgImage,
            )
          : BoxDecoration(
              color: velocityColor,
              borderRadius: _isCircleRounded || roundedValue.isNull
                  ? null
                  : BorderRadius.circular(roundedValue),
              shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
              boxShadow: _boxShadow ?? [],
              border: _border,
              gradient: _gradient,
              image: _bgImage,
            ),
    );
  }
}

extension ContainerWidgetExtension on Widget {
  VelocityBox get box => VelocityBox(child: this);
}
