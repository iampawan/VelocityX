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

mixin VxGradientMixin<T> {
  late T _childToGradient;

  @protected
  Gradient? velocityGradient;

  @protected
  void setChildToGradient(T child) {
    _childToGradient = child;
  }

  T gradientFrom({required Color from, List<double>? stops}) => _gradientIt(
      child: _childToGradient,
      gradient: LinearGradient(colors: [from, Vx.gray100], stops: stops));

  T gradientVia(
          {required Color from,
          required Color via,
          required Color to,
          List<double>? stops}) =>
      _gradientIt(
          child: _childToGradient,
          gradient: LinearGradient(colors: [from, via, to], stops: stops));

  T gradientFromTo(
          {required Color from, required Color to, List<double>? stops}) =>
      _gradientIt(
          child: _childToGradient,
          gradient: LinearGradient(colors: [from, to], stops: stops));

  T gradientTo({required Color to, List<double>? stops}) => _gradientIt(
      child: _childToGradient,
      gradient: LinearGradient(colors: [Vx.gray100, to], stops: stops));

  T _gradientIt({required Gradient gradient, required T child}) {
    velocityGradient = gradient;
    return child;
  }
}
