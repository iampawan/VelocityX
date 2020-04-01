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
import 'package:velocity_x/src/flutter/velocityx_mixins/curves_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/duration_mixin.dart';
import 'builder.dart';

class VelocityAnimatedPadding extends VelocityXWidgetBuilder<Widget>
    with
        VelocityDurationMixing<VelocityAnimatedPadding>,
        VelocityCurvesMixing<VelocityAnimatedPadding> {
  VelocityAnimatedPadding({this.child}) {
    setChildForCurve(this);
    setChildForDuration(this);
  }
  final Widget child;
  EdgeInsetsGeometry _padding;

  VelocityAnimatedPadding padding(EdgeInsetsGeometry val) =>
      this.._padding = val;

  @override
  Widget make({Key key}) {
    return AnimatedPadding(
      padding: _padding,
      duration: velocityDuration ?? const Duration(seconds: 1),
      curve: velocityCurve ?? Curves.easeIn,
      child: child,
    );
  }
}

extension AnimatedPaddingExtension on Widget {
  VelocityAnimatedPadding get animatedPadding => VelocityAnimatedPadding(child: this);
}
