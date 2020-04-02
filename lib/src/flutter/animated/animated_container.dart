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
import 'package:velocity_x/src/flutter/velocityx_mixins/alignment_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/color_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/curves_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/duration_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/neu_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/padding_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/round_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import '../builder.dart';

class VelocityAnimatedBox extends VelocityXWidgetBuilder<Widget>
    with
        VelocityAlignmentMixin<VelocityAnimatedBox>,
        VelocityDurationMixin<VelocityAnimatedBox>,
        VelocityCurvesMixin<VelocityAnimatedBox>,
        VelocityColorMixin<VelocityAnimatedBox>,
        VelocityPaddingMixin<VelocityAnimatedBox>,
        VelocityRoundMixin<VelocityAnimatedBox>,
        VelocityNeuMixin {
  VelocityAnimatedBox({this.child}) {
    setChildToColor(this);
    setChildToPad(this);
    setChildToRound(this);
    setChildForCurve(this);
    setChildForDuration(this);
    setChildForAlignment(this);
  }

  final Widget child;
  BoxBorder _border;
  Gradient _gradient;
  double _height;
  double _width;
  EdgeInsetsGeometry _margin;
  DecorationImage _bgImage;
  bool _isCircleRounded = false;
  List<BoxShadow> _boxShadow;
  VelocityNeumorph _velocityNeumorph;
  Matrix4 _transform;

  VelocityAnimatedBox color(Color color) => this..velocityColor = color;

  VelocityAnimatedBox hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  VelocityAnimatedBox height(double val) => this.._height = val;

  VelocityAnimatedBox width(double val) => this.._width = val;

  VelocityAnimatedBox border(
      {Color color = Colors.black,
      double width = 1.0,
      BorderStyle style = BorderStyle.solid}) {
    _border = Border.all(color: color, width: width, style: style);
    return this;
  }

  VelocityAnimatedBox padding(EdgeInsetsGeometry val) =>
      this..velocityPadding = val;

  // Gradients
  VelocityAnimatedBox linearGradient(List<Color> colors) =>
      this.._gradient = LinearGradient(colors: colors);

  VelocityAnimatedBox radialGradient(List<Color> colors) =>
      this.._gradient = RadialGradient(colors: colors);

  VelocityAnimatedBox sweepGradient(List<Color> colors) =>
      this.._gradient = SweepGradient(colors: colors);

  VelocityAnimatedBox margin(EdgeInsetsGeometry val) => this.._margin = val;

  // DecorationImage BoxDecoration
  VelocityAnimatedBox bgImage(DecorationImage image) => this.._bgImage = image;

  // transforming
  VelocityAnimatedBox transform(Matrix4 val) => this.._transform = val;

  VelocityAnimatedBox get roundedFull => this.._isCircleRounded = true;

  /// Shadowing
  VelocityAnimatedBox get shadow {
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

  VelocityAnimatedBox get shadowXs {
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

  VelocityAnimatedBox get shadowSm {
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

  VelocityAnimatedBox get shadowMd {
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

  VelocityAnimatedBox get shadowLg {
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

  VelocityAnimatedBox get shadowXl {
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

  VelocityAnimatedBox get shadow2xl {
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

  VelocityAnimatedBox shadowOutline({Color outlineColor}) {
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

  VelocityAnimatedBox neumorphic(
          {Color color,
          VelocityCurve curve = VelocityCurve.concave,
          double elevation = 12.0}) =>
      this
        .._velocityNeumorph = velocityDecoration(
            color ?? velocityColor ?? ThemeData().scaffoldBackgroundColor,
            curve,
            elevation);

  @override
  Widget make({Key key}) {
    return AnimatedContainer(
        child: child,
        curve: velocityCurve ?? Curves.easeIn,
        duration: velocityDuration ?? const Duration(seconds: 1),
        height: _height,
        width: _width,
        padding: velocityPadding,
        margin: _margin,
        alignment: velocityAlignment,
        transform: _transform,
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
              ));
  }
}

extension AnimatedContainerWidgetExtension on Widget {
  VelocityAnimatedBox get animatedBox => VelocityAnimatedBox(child: this);
}
