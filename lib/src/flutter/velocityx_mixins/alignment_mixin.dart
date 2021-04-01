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

mixin VxAlignmentMixin<T> {
  late T _child;

  @protected
  Alignment? velocityAlignment;

  @protected
  void setChildForAlignment(T child) {
    _child = child;
  }

  T alignment(Alignment val) {
    velocityAlignment = val;
    return _child;
  }

  T get alignTopCenter => _addAlignment(alignment: Alignment.topCenter);
  T get alignTopLeft => _addAlignment(alignment: Alignment.topLeft);
  T get alignTopRight => _addAlignment(alignment: Alignment.topRight);
  T get alignCenter => _addAlignment(alignment: Alignment.center);
  T get alignCenterLeft => _addAlignment(alignment: Alignment.centerLeft);
  T get alignCenterRight => _addAlignment(alignment: Alignment.centerRight);
  T get alignBottomCenter => _addAlignment(alignment: Alignment.bottomCenter);
  T get alignBottomLeft => _addAlignment(alignment: Alignment.bottomLeft);
  T get alignBottomRight => _addAlignment(alignment: Alignment.bottomRight);
  T _addAlignment({required Alignment alignment}) {
    velocityAlignment = alignment;
    return _child;
  }
}
