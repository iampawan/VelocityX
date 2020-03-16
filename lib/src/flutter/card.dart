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

import 'builder.dart';

class _CardBuilder extends VelocityXWidgetBuilder<Widget> {
  _CardBuilder(this._child);
  final Widget _child;
  Color _cardColor;
  Color _shadowColor;
  double _elevation = 1.0;
  ShapeBorder _shape;
  _CardBuilder get circular => this.._shape = const CircleBorder();
  _CardBuilder get zeroCircular => this
    .._shape = const CircleBorder()
    .._elevation = 0.0;

  _CardBuilder get zero => this.._elevation = 0.0;

  @override
  Widget build() {
    return Card(
      child: _child,
      color: _cardColor ?? ThemeData().cardColor,
      clipBehavior: Clip.antiAlias,
      elevation: _elevation,
      shape: _shape,
      shadowColor: _shadowColor,
    );
  }
}

extension CardExtension on Widget {
  _CardBuilder get card => _CardBuilder(this);
}
