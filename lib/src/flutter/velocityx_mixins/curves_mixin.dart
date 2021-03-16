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

mixin VxCurvesMixin<T> {
  late T _child;

  @protected
  Curve? velocityCurve;

  @protected
  void setChildForCurve(T child) {
    _child = child;
  }

  T get bounceIn => _addCurve(curve: Curves.bounceIn);

  T get bounceInOut => _addCurve(curve: Curves.bounceInOut);

  T get bounceOut => _addCurve(curve: Curves.bounceOut);

  T get decelerate => _addCurve(curve: Curves.decelerate);

  T get ease => _addCurve(curve: Curves.ease);

  T get easeIn => _addCurve(curve: Curves.easeIn);

  T get easeInBack => _addCurve(curve: Curves.easeInBack);

  T get easeInCirc => _addCurve(curve: Curves.easeInCirc);

  T get easeInCubic => _addCurve(curve: Curves.easeInCubic);

  T get easeInExpo => _addCurve(curve: Curves.easeInExpo);

  T get easeInOut => _addCurve(curve: Curves.easeInOut);

  T get easeInOutBack => _addCurve(curve: Curves.easeInOutBack);

  T get easeInOutCirc => _addCurve(curve: Curves.easeInOutCirc);

  T get easeInOutCubic => _addCurve(curve: Curves.easeInOutCubic);

  T get easeInOutExpo => _addCurve(curve: Curves.easeInOutExpo);

  T get easeInOutQuad => _addCurve(curve: Curves.easeInOutQuad);

  T get easeInOutQuart => _addCurve(curve: Curves.easeInOutQuart);

  T get easeInOutQuint => _addCurve(curve: Curves.easeInOutQuint);

  T get easeInOutSine => _addCurve(curve: Curves.easeInOutSine);

  T get easeInQuad => _addCurve(curve: Curves.easeInQuad);

  T get easeInQuart => _addCurve(curve: Curves.easeInQuart);

  T get easeInQuint => _addCurve(curve: Curves.easeInQuint);

  T get easeInSine => _addCurve(curve: Curves.easeInSine);

  T get easeInToLinear => _addCurve(curve: Curves.easeInToLinear);

  T get easeOut => _addCurve(curve: Curves.easeOut);

  T get easeOutBack => _addCurve(curve: Curves.easeOutBack);

  T get easeOutCirc => _addCurve(curve: Curves.easeOutCirc);

  T get easeOutCubic => _addCurve(curve: Curves.easeOutCubic);

  T get easeOutExpo => _addCurve(curve: Curves.easeOutExpo);

  T get easeOutQuad => _addCurve(curve: Curves.easeOutQuad);

  T get easeOutQuart => _addCurve(curve: Curves.easeOutQuart);

  T get easeOutQuint => _addCurve(curve: Curves.easeOutQuint);

  T get easeOutSine => _addCurve(curve: Curves.easeOutSine);

  T get elasticIn => _addCurve(curve: Curves.elasticIn);

  T get elasticInOut => _addCurve(curve: Curves.elasticInOut);

  T get elasticOut => _addCurve(curve: Curves.elasticOut);

  T get fastLinearToSlowEaseIn =>
      _addCurve(curve: Curves.fastLinearToSlowEaseIn);

  T get fastOutSlowIn => _addCurve(curve: Curves.fastOutSlowIn);

  T get linear => _addCurve(curve: Curves.linear);

  T get linearToEaseOut => _addCurve(curve: Curves.linearToEaseOut);

  T get slowMiddle => _addCurve(curve: Curves.slowMiddle);
  T _addCurve({required Curve curve}) {
    velocityCurve = curve;
    return _child;
  }
}
