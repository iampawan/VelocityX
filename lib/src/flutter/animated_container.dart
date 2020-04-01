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
import 'package:velocity_x/src/flutter/velocityx_mixins/curves_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/duration_mixin.dart';
import 'package:velocity_x/velocity_x.dart';
import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';
import 'velocityx_mixins/padding_mixin.dart';
import 'velocityx_mixins/round_mixin.dart';

class VelocityAnimatedBox extends VelocityXWidgetBuilder<Widget>
    with
        VelocityAlignmentMixin<VelocityAnimatedBox>,
        VelocityDurationMixin<VelocityAnimatedBox>,
        VelocityCurvesMixin<VelocityAnimatedBox>,
        VelocityColorMixin<VelocityAnimatedBox>,
        VelocityPaddingMixin<VelocityAnimatedBox>,
        VelocityRoundMixin<VelocityAnimatedBox> {
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(roundedValue),
          border: _border,
          color: velocityColor,
          image: _bgImage,
          gradient: _gradient),
    );
  }
}

extension AnimatedContainerWidgetExtension on Widget {
  VelocityAnimatedBox get animatedBox => VelocityAnimatedBox(child: this);
}
