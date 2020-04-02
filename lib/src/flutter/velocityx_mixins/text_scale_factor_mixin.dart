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

mixin VelocityTextScaleFactorMixin<T> {
  T _child;

  @protected
  double velocityScaleFactor;

  @protected
  void setChildForTextScaleFactor(T child) {
    _child = child;
  }

  T get xs => _applyScaleFactor(scaleFactor: 0.75);

  T get sm => _applyScaleFactor(scaleFactor: 0.875);

  T get base => _applyScaleFactor(scaleFactor: 1);

  T get lg => _applyScaleFactor(scaleFactor: 1.125);

  T get xl => _applyScaleFactor(scaleFactor: 1.25);

  T get xl2 => _applyScaleFactor(scaleFactor: 1.5);

  T get xl3 => _applyScaleFactor(scaleFactor: 1.875);

  T get xl4 => _applyScaleFactor(scaleFactor: 2.25);

  T get xl5 => _applyScaleFactor(scaleFactor: 3);

  T get xl6 => _applyScaleFactor(scaleFactor: 4);

  T _applyScaleFactor({@required double scaleFactor}) {
    velocityScaleFactor = scaleFactor;
    return _child;
  }
}
