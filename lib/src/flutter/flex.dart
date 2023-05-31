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

/// A widget that displays its children in a one-dimensional array.
///
/// The [Flex] widget allows you to control the axis along which the children are
/// placed (horizontal or vertical). This is referred to as the _main axis_. If
/// you know the main axis in advance, then consider using a [Row] (if it's
/// horizontal) or [Column] (if it's vertical) instead, because that will be less
/// verbose.
///
/// To cause a child to expand to fill the available space in the [direction]
/// of this widget's main axis, wrap the child in an [Expanded] widget.
///
/// The [Flex] widget does not scroll (and in general it is considered an error
/// to have more children in a [Flex] than will fit in the available room). If
/// you have some widgets and want them to be able to scroll if there is
/// insufficient room, consider using a [ListView].
///
/// If you only have one child, then rather than using [Flex], [Row], or
/// [Column], consider using [Align] or [Center] to position the child.
///
class VxBlock extends Flex {
  /// Use Block to create a block-level element.
  ///
  /// The [direction], [mainAxisAlignment],
  /// [crossAxisAlignment], and [verticalDirection] arguments must not be null.
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  // ignore: prefer_const_constructors_in_immutables
  VxBlock(
      {super.key,
      super.mainAxisAlignment,
      super.textDirection,
      super.verticalDirection,
      super.textBaseline,
      super.children,
      super.direction = Axis.vertical,
      super.mainAxisSize = MainAxisSize.min,
      super.crossAxisAlignment = CrossAxisAlignment.stretch});
}

class VxInlineBlock extends Flex {
  /// Use Block to create a block-level element.
  ///
  /// The [direction], [mainAxisAlignment],
  /// [crossAxisAlignment], and [verticalDirection] arguments must not be null.
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  // ignore: prefer_const_constructors_in_immutables
  VxInlineBlock(
      {super.key,
      super.textDirection,
      super.verticalDirection,
      super.textBaseline,
      super.children,
      super.direction = Axis.horizontal,
      super.mainAxisSize = MainAxisSize.max,
      super.mainAxisAlignment = MainAxisAlignment.start,
      super.crossAxisAlignment = CrossAxisAlignment.start});
}

/// A widget that displays its children in a vertical array.
///
/// To cause a child to expand to fill the available vertical space, wrap the
/// child in an [Expanded] widget.
///
/// The [VStack] widget does not scroll (and in general it is considered an error
/// to have more children in a [VStack] than will fit in the available room). If
/// you have a line of widgets and want them to be able to scroll if there is
/// insufficient room, consider using a [ListView].
///
/// For a horizontal variant, see [HStack].
///
/// If you only have one child, then consider using [Align] or [Center] to
/// position the child.
///
/// {@tool snippet}
///
/// This example uses a [VStack] to arrange three widgets vertically, the last
/// being made to fill all the remaining space.
///
/// ![Using the Column in this way creates two short lines of text with a large Flutter underneath.](https://flutter.github.io/assets-for-api-docs/assets/widgets/column.png)
///
//////
/// ```dart
/// VStack(
///  [
///     Text('Deliver features faster'),
///     Text('Craft beautiful UIs'),
///     Expanded(
///       child: FittedBox(
///         fit: BoxFit.contain, // otherwise the logo will be tiny
///         child: const FlutterLogo(),
///       ),
///     ),
///   ],
/// )
/// ```
/// /// {@end-tool}
/// {@tool snippet}
///
/// In the sample above, the text and the logo are centered on each line. In the
/// following example, the [crossAlignment] is set to
/// [CrossAxisAlignment.start], so that the children are left-aligned. The
/// [axisSize] is set to [MainAxisSize.min], so that the column shrinks to
/// fit the children.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/column_properties.png)
///
/// ```dart
/// VStack(
///  [
///     Text('We move under cover and we move as one'),
///     Text('Through the night, we have one shot to live another day'),
///     Text('We cannot let a stray gunshot give us away'),
///     Text('We will fight up close, seize the moment and stay in it'),
///     Text('It’s either that or meet the business end of a bayonet'),
///     Text('The code word is ‘Rochambeau,’ dig me?'),
///     Text('Rochambeau!', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
///   ],
///   crossAlignment: CrossAxisAlignment.start,
///   axisSize: MainAxisSize.min,
/// )
/// ```
/// {@end-tool}

class VStack extends StatelessWidget {
  const VStack(
    this.children, {
    super.key,
    this.alignment = MainAxisAlignment.start,
    this.crossAlignment = CrossAxisAlignment.start,
    this.axisSize = MainAxisSize.min,
    this.spacing = 0.0,
  });

  /// List of widgets in the stack.
  final List<Widget> children;

  /// How the children should be placed along the main axis.
  ///
  /// For example, [MainAxisAlignment.start], the default, places the children
  /// at the start (i.e., the top for a [VStack]) of the main axis.
  final MainAxisAlignment? alignment;

  /// How the children should be placed along the cross axis.
  ///
  /// For example, [CrossAxisAlignment.center], the default, centers the
  /// children in the cross axis (e.g., horizontally for a [VStack]).
  final CrossAxisAlignment? crossAlignment;

  /// How much space should be occupied in the main axis.
  ///
  /// After allocating space to children, there might be some remaining free
  /// space. This value controls whether to maximize or minimize the amount of
  /// free space, subject to the incoming layout constraints.
  ///
  /// If some children have a non-zero flex factors (and none have a fit of
  /// [FlexFit.loose]), they will expand to consume all the available space and
  /// there will be no remaining free space to maximize or minimize, making this
  /// value irrelevant to the final layout.
  final MainAxisSize? axisSize;

  /// The spacing between each child widget in the stack.
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: axisSize ?? MainAxisSize.max,
      children: _addSpacingBetweenChildren(),
    );
  }

  List<Widget> _addSpacingBetweenChildren() {
    List<Widget> spacedChildren = [];
    final int totalChildren = children.length;
    for (int i = 0; i < totalChildren; i++) {
      spacedChildren.add(children[i]);
      if (i != totalChildren - 1) {
        spacedChildren.add(SizedBox(height: spacing));
      }
    }
    return spacedChildren;
  }
}

/// A widget that displays its children in a horizontal array.
///
/// To cause a child to expand to fill the available horizontal space, wrap the
/// child in an [Expanded] widget.
///
/// The [HStack] widget does not scroll (and in general it is considered an error
/// to have more children in a [HStack] than will fit in the available room). If
/// you have a line of widgets and want them to be able to scroll if there is
/// insufficient room, consider using a [ListView].
///
/// For a vertical variant, see [VStack].
///
/// If you only have one child, then consider using [Align] or [Center] to
/// position the child.
///
/// {@tool snippet}
///
/// This example divides the available space into three (horizontally), and
/// places text centered in the first two cells and the Flutter logo centered in
/// the third:
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/row.png)
///
/// ```dart
/// HStack(
///   [
///     Expanded(
///       child: Text('Deliver features faster', textAlign: TextAlign.center),
///     ),
///     Expanded(
///       child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
///     ),
///     Expanded(
///       child: FittedBox(
///         fit: BoxFit.contain, // otherwise the logo will be tiny
///         child: const FlutterLogo(),
///       ),
///     ),
///   ],
/// )
/// ```
/// {@end-tool}
///
class HStack extends StatelessWidget {
  const HStack(
    this.children, {
    super.key,
    this.alignment = MainAxisAlignment.start,
    this.crossAlignment = CrossAxisAlignment.center,
    this.axisSize = MainAxisSize.min,
    this.spacing = 0.0,
  });

  /// List of widgets in the stack.
  final List<Widget> children;

  /// How the children should be placed along the main axis.
  ///
  /// For example, [MainAxisAlignment.start], the default, places the children
  /// at the start (i.e., the left for a [HStack] or the top for a [VStack]) of the
  /// main axis.
  final MainAxisAlignment? alignment;

  /// How the children should be placed along the cross axis.
  ///
  /// For example, [CrossAxisAlignment.center], the default, centers the
  /// children in the cross axis (e.g., horizontally for a [VStack]).
  final CrossAxisAlignment? crossAlignment;

  /// How much space should be occupied in the main axis.
  ///
  /// After allocating space to children, there might be some remaining free
  /// space. This value controls whether to maximize or minimize the amount of
  /// free space, subject to the incoming layout constraints.
  ///
  /// If some children have a non-zero flex factors (and none have a fit of
  /// [FlexFit.loose]), they will expand to consume all the available space and
  /// there will be no remaining free space to maximize or minimize, making this
  /// value irrelevant to the final layout.
  final MainAxisSize? axisSize;

  /// The spacing between each child widget in the stack.
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: axisSize ?? MainAxisSize.max,
      children: _addSpacingBetweenChildren(),
    );
  }

  List<Widget> _addSpacingBetweenChildren() {
    List<Widget> spacedChildren = [];
    final int totalChildren = children.length;
    for (int i = 0; i < totalChildren; i++) {
      spacedChildren.add(children[i]);
      if (i != totalChildren - 1) {
        spacedChildren.add(SizedBox(width: spacing));
      }
    }
    return spacedChildren;
  }
}

/// A widget that positions its children relative to the edges of its box.
///
/// This class is useful if you want to overlap several children in a simple
/// way, for example having some text and an image, overlaid with a gradient and
/// a button attached to the bottom.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=liEGSeD3Zt8}
///
/// Each child of a [ZStack] widget is either _positioned_ or _non-positioned_.
/// Positioned children are those wrapped in a [Positioned] widget that has at
/// least one non-null property. The stack sizes itself to contain all the
/// non-positioned children, which are positioned according to [alignment]
/// (which defaults to the top-left corner in left-to-right environments and the
/// top-right corner in right-to-left environments). The positioned children are
/// then placed relative to the stack according to their top, right, bottom, and
/// left properties.
///
/// The stack paints its children in order with the first child being at the
/// bottom. If you want to change the order in which the children paint, you
/// can rebuild the stack with the children in the new order. If you reorder
/// the children in this way, consider giving the children non-null keys.
/// These keys will cause the framework to move the underlying objects for
/// the children to their new locations rather than recreate them at their
/// new location.
///
/// For more details about the stack layout algorithm, see [RenderStack].
///
/// If you want to lay a number of children out in a particular pattern, or if
/// you want to make a custom layout manager, you probably want to use
/// [CustomMultiChildLayout] instead. In particular, when using a [ZStack] you
/// can't position children relative to their size or the stack's own size.
///
/// {@tool snippet}
///
/// Using a [ZStack] you can position widgets over one another.
///
/// ![The sample creates a blue box that overlaps a larger green box, which itself overlaps an even larger red box.](https://flutter.github.io/assets-for-api-docs/assets/widgets/stack.png)
///
/// ```dart
/// ZStack(
///   [
///     Container(
///       width: 100,
///       height: 100,
///       color: Colors.red,
///     ),
///     Container(
///       width: 90,
///       height: 90,
///       color: Colors.green,
///     ),
///     Container(
///       width: 80,
///       height: 80,
///       color: Colors.blue,
///     ),
///   ],
/// )
/// ```
/// {@end-tool}
///
class ZStack extends StatelessWidget {
  const ZStack(this.children,
      {super.key,
      this.alignment = AlignmentDirectional.topStart,
      this.fit = StackFit.loose,
      this.clip = Clip.none});

  /// List of widgets in the stack.
  final List<Widget> children;

  /// How to align the non-positioned and partially-positioned children in the
  /// stack.
  ///
  /// The non-positioned children are placed relative to each other such that
  /// the points determined by [alignment] are co-located. For example, if the
  /// [alignment] is [Alignment.topLeft], then the top left corner of
  /// each non-positioned child will be located at the same global coordinate.
  ///
  /// Partially-positioned children, those that do not specify an alignment in a
  /// particular axis (e.g. that have neither `top` nor `bottom` set), use the
  /// alignment to determine how they should be positioned in that
  /// under-specified axis.
  ///
  /// Defaults to [AlignmentDirectional.topStart].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry? alignment;

  /// How to size the non-positioned children in the stack.
  ///
  /// The constraints passed into the [ZStack] from its parent are either
  /// loosened ([StackFit.loose]) or tightened to their biggest size
  /// ([StackFit.expand]).
  final StackFit? fit;

  /// {@macro flutter.widgets.Clip}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip? clip;

  @override
  Widget build(BuildContext context) {
    return Stack(
        key: key,
        alignment: alignment ?? AlignmentDirectional.topStart,
        fit: fit ?? StackFit.loose,
        clipBehavior: clip ?? Clip.hardEdge,
        children: children);
  }
}

class AStack extends StatelessWidget {
  final Clip clipBehavior;
  final OverflowBarAlignment overflowAlignment;
  final VerticalDirection overflowDirection;
  final double overflowSpacing;
  final double spacing;
  final TextDirection? textDirection;
  final List<Widget> children;

  const AStack(
      {super.key,
      required this.children,
      this.clipBehavior = Clip.none,
      this.overflowAlignment = OverflowBarAlignment.start,
      this.overflowDirection = VerticalDirection.down,
      this.overflowSpacing = 0.0,
      this.spacing = 0.0,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      key: key,
      clipBehavior: clipBehavior,
      overflowAlignment: overflowAlignment,
      overflowDirection: overflowDirection,
      overflowSpacing: overflowSpacing,
      spacing: spacing,
      textDirection: textDirection,
      children: children,
    );
  }
}
