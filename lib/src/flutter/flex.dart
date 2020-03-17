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
// import 'package:velocity_x/velocity_x.dart';

class VelocityXBlock extends Flex {
  /// Use Block to create a block-level element.
  ///
  /// The [direction], [mainAxisAlignment],
  /// [crossAxisAlignment], and [verticalDirection] arguments must not be null.
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  VelocityXBlock({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    List<Widget> children = const <Widget>[],
  }) : super(
          children: children,
          key: key,
          direction: Axis.vertical,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
        );
}

class VelocityXInlineBlock extends Flex {
  /// Use Block to create a block-level element.
  ///
  /// The [direction], [mainAxisAlignment],
  /// [crossAxisAlignment], and [verticalDirection] arguments must not be null.
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  VelocityXInlineBlock({
    Key key,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    List<Widget> children = const <Widget>[],
  }) : super(
          children: children,
          key: key,
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
        );
}

class VStack extends StatelessWidget {
  const VStack(this.children,
      {this.alignment = MainAxisAlignment.start,
      this.crossAlignment = CrossAxisAlignment.start,
      this.axisSize = MainAxisSize.min})
      : assert(children != null);
  final List<Widget> children;

  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAlignment;
  final MainAxisSize axisSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
      mainAxisAlignment: alignment,
      crossAxisAlignment: crossAlignment,
      mainAxisSize: axisSize,
    );
  }
}

class HStack extends StatelessWidget {
  const HStack(this.children,
      {this.alignment = MainAxisAlignment.start,
      this.crossAlignment = CrossAxisAlignment.start,
      this.axisSize = MainAxisSize.min})
      : assert(children != null);
  final List<Widget> children;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAlignment;
  final MainAxisSize axisSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
      mainAxisAlignment: alignment,
      crossAxisAlignment: crossAlignment,
      mainAxisSize: axisSize,
    );
  }
}

class ZStack extends StatelessWidget {
  const ZStack(this.children,
      {this.alignment = AlignmentDirectional.topStart,
      this.fit = StackFit.loose,
      this.overflow = Overflow.clip})
      : assert(children != null);

  final List<Widget> children;
  final AlignmentGeometry alignment;
  final StackFit fit;
  final Overflow overflow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children,
      alignment: alignment,
      fit: fit,
      overflow: overflow,
    );
  }
}
