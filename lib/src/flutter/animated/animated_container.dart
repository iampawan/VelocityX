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
import 'package:velocity_x/src/flutter/velocityx_mixins/gradient_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/neu_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/padding_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/round_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/shadow_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import '../builder.dart';

///
/// [VxAnimatedBox] is similar to [AnimatedContainer] with the advantages of [VxBox]
///
class VxAnimatedBox extends VxWidgetBuilder<Widget>
    with
        VxAlignmentMixin<VxAnimatedBox>,
        VxDurationMixin<VxAnimatedBox>,
        VxCurvesMixin<VxAnimatedBox>,
        VxColorMixin<VxAnimatedBox>,
        VxGradientMixin<VxAnimatedBox>,
        VxPaddingMixin<VxAnimatedBox>,
        VxRoundMixin<VxAnimatedBox>,
        VxShadowMixin<VxAnimatedBox>,
        VxNeuMixin {
  VxAnimatedBox({this.child}) {
    setChildToColor(this);
    setChildToGradient(this);
    setChildToPad(this);
    setChildToRound(this);
    setChildForShadow(this);
    setChildForCurve(this);
    setChildForDuration(this);
    setChildForAlignment(this);
  }

  final Widget? child;
  BoxBorder? _border;
  Gradient? _gradient;
  double? _height;
  double? _width;
  EdgeInsetsGeometry? _margin;
  DecorationImage? _bgImage;
  bool _isCircleRounded = false;
  List<BoxShadow>? _boxShadow;
  VxNeumorph? _velocityNeumorph;
  Matrix4? _transform;
  BoxDecoration? _decoration;

  ///
  /// Sets the color property of the box.
  ///
  VxAnimatedBox color(Color color) => this..velocityColor = color;

  ///
  /// Sets the duration property of the animated box.
  ///
  VxAnimatedBox animDuration(Duration duration) =>
      this..velocityDuration = duration;

  ///
  /// Sets the color property of the box using the hex color value.
  ///
  VxAnimatedBox hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  ///
  /// Sets the height property of the box.
  ///
  VxAnimatedBox height(double val) => this.._height = val;

  ///
  /// Sets the width property of the box.
  ///
  VxAnimatedBox width(double val) => this.._width = val;

  ///
  /// Sets the size (width & height) property of the box.
  ///
  VxAnimatedBox size(double width, double height) => this
    .._width = width
    .._height = height;

  ///
  /// Sets the size (width & height in percentage) property of the box.
  ///
  VxAnimatedBox sizePCT(
          {required BuildContext context,
          required double widthPCT,
          required double heightPCT}) =>
      this
        .._width = context.percentWidth * widthPCT
        .._height = context.percentHeight * heightPCT;

  ///
  /// Sets the height and width as square of the box.
  ///
  VxAnimatedBox square(double val) => this
    .._width = val
    .._height = val;

  ///
  /// Provide a custom DecoratedBox
  ///
  VxAnimatedBox withDecoration(BoxDecoration decoration) =>
      this.._decoration = decoration;

  ///
  /// Sets the border of the Box.
  ///
  VxAnimatedBox border(
      {Color color = Colors.black,
      double width = 1.0,
      BorderStyle style = BorderStyle.solid}) {
    _border = Border.all(color: color, width: width, style: style);
    return this;
  }

  ///
  /// Sets the padding property of the box.
  ///
  VxAnimatedBox padding(EdgeInsetsGeometry val) => this..velocityPadding = val;

  // Gradients

  ///
  /// Sets the linear gradient to the decorated box.
  ///
  VxAnimatedBox linearGradient(List<Color> colors) =>
      this.._gradient = LinearGradient(colors: colors);

  ///
  /// Sets the radial gradient to the decorated box.
  ///
  VxAnimatedBox radialGradient(List<Color> colors) =>
      this.._gradient = RadialGradient(colors: colors);

  ///
  /// Sets the sweep gradient to the decorated box.
  ///
  VxAnimatedBox sweepGradient(List<Color> colors) =>
      this.._gradient = SweepGradient(colors: colors);

  ///
  /// Sets the defined gradient to the decorated box.
  ///
  VxAnimatedBox withGradient(Gradient gradient) => this.._gradient = gradient;

  ///
  /// Sets the margin property of the box.
  ///
  VxAnimatedBox margin(EdgeInsetsGeometry val) => this.._margin = val;

  // DecorationImage BoxDecoration
  ///
  /// Sets the background image to the decorated box.
  ///
  VxAnimatedBox bgImage(DecorationImage image) => this.._bgImage = image;

  /// transforming
  ///
  /// Sets the transform property to the animated box.
  ///
  VxAnimatedBox transform(Matrix4 val) => this.._transform = val;

  ///
  /// Sets the decorated box as circular.
  ///
  VxAnimatedBox get roundedFull => this.._isCircleRounded = true;

  ///
  /// To give custom shadow.
  ///
  VxAnimatedBox withShadow(List<BoxShadow> shadows) {
    _boxShadow = shadows;
    return this;
  }

  ///
  /// To give shadow with some outline color.
  ///
  VxAnimatedBox shadowOutline({Color? outlineColor}) {
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

  ///
  /// Use this to convert your box to the neumorphic design. Use it wisely.
  ///
  VxAnimatedBox neumorphic(
          {Color? color,
          VxCurve curve = VxCurve.concave,
          double elevation = 12.0}) =>
      this
        .._velocityNeumorph =
            velocityDecoration((color ?? velocityColor)!, curve, elevation);

  @override
  Widget make({Key? key}) {
    return AnimatedContainer(
        child: child,
        curve: velocityCurve ?? Curves.linear,
        duration: velocityDuration ?? const Duration(seconds: 100),
        height: _height,
        width: _width,
        padding: velocityPadding,
        margin: _margin,
        alignment: velocityAlignment,
        transform: _transform,
        decoration: _velocityNeumorph != null
            ? BoxDecoration(
                borderRadius: _isCircleRounded || (roundedValue == null)
                    ? null
                    : (radiusGeometry ?? BorderRadius.circular(roundedValue!)),
                shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
                boxShadow: _velocityNeumorph!.shadows,
                border: _border,
                gradient: velocityGradient ?? _velocityNeumorph!.gradient,
                image: _bgImage,
              )
            : _decoration ??
                BoxDecoration(
                  color: velocityColor,
                  borderRadius: _isCircleRounded || (roundedValue == null)
                      ? null
                      : (radiusGeometry ??
                          BorderRadius.circular(roundedValue!)),
                  shape:
                      _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
                  boxShadow: velocityShadow ?? _boxShadow ?? [],
                  border: _border,
                  gradient: velocityGradient ?? _gradient,
                  image: _bgImage,
                ));
  }
}

extension VxAnimatedContainerWidgetExtension on Widget {
  ///
  /// Extension method to directly access [VxAnimatedBox] with any widget without wrapping or with dot operator.
  ///
  VxAnimatedBox get animatedBox => VxAnimatedBox(child: this);
}
