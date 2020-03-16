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

import 'builder.dart';

class _VelocityXCardBuilder extends VelocityXWidgetBuilder<Widget>
    with
        VelocityColorMixin<_VelocityXCardBuilder>,
        VelocityPaddingMixin<_VelocityXCardBuilder> {
  _VelocityXCardBuilder(this._child) {
    setChildToColor(this);
    setChildToPad(this);
  }
  final Widget _child;

  Color _shadowColor;
  double _elevation = 1.0;
  ShapeBorder _shape;

  _VelocityXCardBuilder color(Color val) => this..velocityColor = val;

  _VelocityXCardBuilder hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  _VelocityXCardBuilder elevation(double val) => this.._elevation = val;

  _VelocityXCardBuilder get circular => this.._shape = const CircleBorder();
  _VelocityXCardBuilder get zeroCircular => this
    .._shape = const CircleBorder()
    .._elevation = 0.0;

  _VelocityXCardBuilder get zero => this.._elevation = 0.0;

  @override
  Widget build() {
    return Card(
      margin: velocityPadding,
      child: _child,
      color: velocityColor ?? ThemeData().cardColor,
      clipBehavior: Clip.antiAlias,
      elevation: _elevation,
      shape: _shape,
      shadowColor: _shadowColor,
    );
  }
}

extension CardExtension on Widget {
  _VelocityXCardBuilder get card => _VelocityXCardBuilder(this);
}
