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

mixin VxPaddingMixin<T> {
  late T _childToPad;

  /// Provides [Padding]
  @protected
  EdgeInsetsGeometry? velocityPadding;

  @protected
  void setChildToPad(T child) {
    _childToPad = child;
  }

  T get p0 => _padIt(child: _childToPad, padding: Vx.m0);
  T get p1 => _padIt(child: _childToPad, padding: Vx.m1);
  T get p3 => _padIt(child: _childToPad, padding: Vx.m2);
  T get p4 => _padIt(child: _childToPad, padding: Vx.m4);
  T get p8 => _padIt(child: _childToPad, padding: Vx.m8);
  T get p12 => _padIt(child: _childToPad, padding: Vx.m12);
  T get p16 => _padIt(child: _childToPad, padding: Vx.m16);
  T get p20 => _padIt(child: _childToPad, padding: Vx.m20);
  T get p24 => _padIt(child: _childToPad, padding: Vx.m24);
  T get p32 => _padIt(child: _childToPad, padding: Vx.m32);
  T get p48 => _padIt(child: _childToPad, padding: Vx.m48);
  T get p64 => _padIt(child: _childToPad, padding: Vx.m64);

  T get px0 => _padIt(child: _childToPad, padding: Vx.mH0);
  T get px1 => _padIt(child: _childToPad, padding: Vx.mH1);
  T get px3 => _padIt(child: _childToPad, padding: Vx.mH2);
  T get px4 => _padIt(child: _childToPad, padding: Vx.mH4);
  T get px8 => _padIt(child: _childToPad, padding: Vx.mH8);
  T get px12 => _padIt(child: _childToPad, padding: Vx.mH12);
  T get px16 => _padIt(child: _childToPad, padding: Vx.mH16);
  T get px20 => _padIt(child: _childToPad, padding: Vx.mH20);
  T get px24 => _padIt(child: _childToPad, padding: Vx.mH24);
  T get px32 => _padIt(child: _childToPad, padding: Vx.mH32);
  T get px48 => _padIt(child: _childToPad, padding: Vx.mH48);
  T get px64 => _padIt(child: _childToPad, padding: Vx.mH64);

  T get py0 => _padIt(child: _childToPad, padding: Vx.mV0);
  T get py1 => _padIt(child: _childToPad, padding: Vx.mV1);
  T get py3 => _padIt(child: _childToPad, padding: Vx.mV2);
  T get py4 => _padIt(child: _childToPad, padding: Vx.mV4);
  T get py8 => _padIt(child: _childToPad, padding: Vx.mV8);
  T get py12 => _padIt(child: _childToPad, padding: Vx.mV12);
  T get py16 => _padIt(child: _childToPad, padding: Vx.mV16);
  T get py20 => _padIt(child: _childToPad, padding: Vx.mV20);
  T get py24 => _padIt(child: _childToPad, padding: Vx.mV24);
  T get py32 => _padIt(child: _childToPad, padding: Vx.mV32);
  T get py48 => _padIt(child: _childToPad, padding: Vx.mV48);
  T get py64 => _padIt(child: _childToPad, padding: Vx.mV64);

  T _padIt({required EdgeInsetsGeometry padding, required T child}) {
    velocityPadding = padding;
    return child;
  }
}
