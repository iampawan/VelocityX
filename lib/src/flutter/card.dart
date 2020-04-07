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
import 'velocityx_mixins/color_mixin.dart';
import 'velocityx_mixins/padding_mixin.dart';
import 'velocityx_mixins/round_mixin.dart';

class VxCard extends VxWidgetBuilder<Widget>
    with VxColorMixin<VxCard>, VxPaddingMixin<VxCard>, VxRoundMixin<VxCard> {
  VxCard(
    this._child,
  ) : assert(_child != null) {
    setChildToColor(this);
    setChildToPad(this);
    setChildToRound(this);
  }
  final Widget _child;

  // Color _shadowColor;
  double _elevation = 1.0;
  ShapeBorder _shape;

  VxCard color(Color val) => this..velocityColor = val;

  VxCard hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  VxCard elevation(double val) => this.._elevation = val;

  VxCard get circular => this.._shape = const CircleBorder();
  VxCard get zeroCircular => this
    .._shape = const CircleBorder()
    .._elevation = 0.0;

  VxCard get zero => this.._elevation = 0.0;

  @override
  Widget make({Key key}) {
    return Card(
      key: key,
      margin: velocityPadding,
      child: _child,
      color: velocityColor ?? ThemeData().cardColor,
      clipBehavior: Clip.antiAlias,
      elevation: _elevation,
      shape: roundedValue.isNotNull
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(roundedValue))
          : _shape,
      // shadowColor: _shadowColor,
    );
  }
}

extension CardExtension on Widget {
  VxCard get card => VxCard(this);
}
