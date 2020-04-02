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

import 'package:flutter/cupertino.dart';

mixin VelocityTextAlignMixin<T> {
  T _child;

  @protected
  TextAlign velocityTextAlign;

  @protected
  void setChildForTextAlign(T child) {
    _child = child;
  }

  T get center => _applyTextAlignment(textAlign: TextAlign.center);

  T get start => _applyTextAlignment(textAlign: TextAlign.start);

  T get end => _applyTextAlignment(textAlign: TextAlign.end);

  T get justify => _applyTextAlignment(textAlign: TextAlign.justify);

  T _applyTextAlignment({TextAlign textAlign}) {
    velocityTextAlign = textAlign;
    return _child;
  }
}
