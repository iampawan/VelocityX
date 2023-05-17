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
import 'package:velocity_x/src/velocity_xx.dart';

import 'builder.dart';
import 'velocityx_mixins/padding_mixin.dart';

/// A widget that insets its child by the given padding.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=oD5RtLhhubg}
///
/// When passing layout constraints to its child, padding shrinks the
/// constraints by the given padding, causing the child to layout at a smaller
/// size. Padding then sizes itself to its child's size, inflated by the
/// padding, effectively creating empty space around the child.
///
/// {@tool snippet}
///
/// This snippet creates "Hello World!" [Text] inside a [Card] that is indented
/// by sixteen pixels in each direction.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/padding.png)
///
/// ```dart
/// const Card(
///   child: Padding(
///     padding: EdgeInsets.all(16.0),
///     child: Text('Hello World!'),
///   ),
/// )
/// ```
/// {@end-tool}
///
class VxPaddingBuilder extends VxWidgetBuilder<Widget>
    with VxPaddingMixin<VxPaddingBuilder> {
  VxPaddingBuilder(this._child) {
    setChildToPad(this);
  }
  final Widget _child;

  @override
  Widget make({Key? key}) {
    return Padding(
      key: key,
      padding: velocityPadding!,
      child: _child,
    );
  }
}

///
/// Extension to provide [Padding] to any widget.
///
extension VxPaddingExtensions on Widget {
  VxPaddingBuilder get pad => VxPaddingBuilder(this);

  /// Gives 0 padding from all sides.
  Padding p0({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp0),
        child: this,
      );

  /// Gives 1dp padding from all sides.
  Padding p1({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp1),
        child: this,
      );

  /// Gives 2dp padding from all sides.
  Padding p2({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp2),
        child: this,
      );

  /// Gives 4dp padding from all sides.
  Padding p4({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp4),
        child: this,
      );

  /// Gives 8dp padding from all sides.
  Padding p8({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp8),
        child: this,
      );

  /// Gives 12dp padding from all sides.
  Padding p12({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp12),
        child: this,
      );

  /// Gives 16dp padding from all sides.
  Padding p16({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp16),
        child: this,
      );

  /// Gives 20dp padding from all sides.
  Padding p20({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp20),
        child: this,
      );

  /// Gives 24dp padding from all sides.
  Padding p24({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp24),
        child: this,
      );

  /// Gives 32dp padding from all sides.
  Padding p32({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp32),
        child: this,
      );

  /// Gives 64dp padding from all sides.
  Padding p64({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp64),
        child: this,
      );

  /// Gives 0 padding vertically.
  Padding py0({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp0),
        child: this,
      );

  /// Gives 1dp padding vertically.
  Padding py1({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp1),
        child: this,
      );

  /// Gives 2dp padding vertically.
  Padding py2({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp2),
        child: this,
      );

  /// Gives 4dp padding vertically.
  Padding py4({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp4),
        child: this,
      );

  /// Gives 8dp padding vertically.
  Padding py8({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp8),
        child: this,
      );

  /// Gives 12dp padding vertically.
  Padding py12({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp12),
        child: this,
      );

  /// Gives 16dp padding vertically.
  Padding py16({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp16),
        child: this,
      );

  /// Gives 20dp padding vertically.
  Padding py20({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp20),
        child: this,
      );

  /// Gives 24dp padding vertically.
  Padding py24({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp24),
        child: this,
      );

  /// Gives 32dp padding vertically.
  Padding py32({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp32),
        child: this,
      );

  /// Gives 64dp padding vertically.
  Padding py64({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(vertical: Vx.dp64),
        child: this,
      );

  /// Gives custom padding vertically.
  Padding py(
    double value, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );

  /// Gives 0 padding horizontally.
  Padding px0({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp0),
        child: this,
      );

  /// Gives 1dp padding horizontally.
  Padding px1({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp1),
        child: this,
      );

  /// Gives 2dp padding horizontally.
  Padding px2({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp2),
        child: this,
      );

  /// Gives 4dp padding horizontally.
  Padding px4({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp4),
        child: this,
      );

  /// Gives 8dp padding horizontally.
  Padding px8({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp8),
        child: this,
      );

  /// Gives 12dp padding horizontally.
  Padding px12({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp12),
        child: this,
      );

  /// Gives 16dp padding horizontally.
  Padding px16({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp16),
        child: this,
      );

  /// Gives 20dp padding horizontally.
  Padding px20({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp20),
        child: this,
      );

  /// Gives 24dp padding horizontally.
  Padding px24({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp24),
        child: this,
      );

  /// Gives 32dp padding horizontally.
  Padding px32({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp32),
        child: this,
      );

  /// Gives 64dp padding horizontally.
  Padding px64({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp64),
        child: this,
      );

  /// Gives custom padding horizontally.
  Padding px(
    double value, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  /// Gives custom padding from all sides by [value].
  Padding p(double value, {Key? key}) {
    return Padding(
      key: key,
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  /// Gives custom padding from all sides by [left] [top] [right] [bottom].
  Padding pLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  /// Gives custom padding symmetrically by [v] [h].
  Padding pSymmetric({Key? key, double v = 0.0, double h = 0.0}) => Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: v,
          horizontal: h,
        ),
        child: this,
      );

  /// Gives custom padding by only [left] [top] [right] [bottom].
  Padding pOnly(
          {Key? key,
          double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );
}
