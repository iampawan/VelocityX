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
import 'package:velocity_x/src/extensions/context_ext.dart';

// class _VelocityXSizedBoxBuilder extends VelocityXWidget getContextBuilder<Widget get> {
//   final Widget get _child;

//   double _widthFactor;
//   double _heightFactor;

//   _VelocityXSizedBoxBuilder(this._child);

//   @override
//   Widget get build {
//     return SizedBox(
//       child: _child,
//       width:
//           _widthFactor.isNotNull ?  _widthFactor : null,
//       height: _heightFactor.isNotNull
//           ?  _heightFactor
//           : null,
//     );
//   }
// }

/// A box with a specified size.
///
/// If given a child, this widget forces its child to have a specific width
/// and/or height (assuming values are permitted by this widget's parent). If
/// either the width or height is null, this widget will try to size itself to
/// match the child's size in that dimension. If the child's size depends on the
/// size of its parent, the height and width must be provided.
///
/// If not given a child, [SizedBox] will try to size itself as close to the
/// specified height and width as possible given the parent's constraints. If
/// [height] or [width] is null or unspecified, it will be treated as zero.
///
/// The [SizedBox.expand] constructor can be used to make a [SizedBox] that
/// sizes itself to fit the parent. It is equivalent to setting [width] and
/// [height] to [double.infinity].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=EHPu_DzRfqA}
///
/// {@tool snippet}
///
/// This snippet makes the child widget (a [Card] with some [Text]) have the
/// exact size 200x300, parental constraints permitting:
///
/// ```dart
/// SizedBox(
///   width: 200.0,
///   height: 300.0,
///   child: const Card(child: Text('Hello World!')),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [ConstrainedBox], a more generic version of this class that takes
///    arbitrary [BoxConstraints] instead of an explicit width and height.
///  * [UnconstrainedBox], a container that tries to let its child draw without
///    constraints.
///  * [FractionallySizedBox], a widget that sizes its child to a fraction of
///    the total available space.
///  * [AspectRatio], a widget that attempts to fit within the parent's
///    constraints while also sizing its child to match a given aspect ratio.
///  * [FittedBox], which sizes and positions its child widget to fit the parent
///    according to a given [BoxFit] discipline.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
extension VxSizedBoxExtension on Widget {
  ///All available widths
  ///
  /// [SizedBox] widget with a specified [width]
  Widget w(double width, {Key? key}) => SizedBox(
        key: key,
        width: width,
        child: this,
      );

  /// [SizedBox] widget with a specified [width] percentage
  Widget wPCT({
    required BuildContext context,
    required double widthPCT,
  }) =>
      SizedBox(
        key: key,
        width: context.percentWidth * widthPCT,
        child: this,
      );

  /// [SizedBox] widget with 0% [width] of the [MediaQuery] width
  Widget w0(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 0,
        child: this,
      );

  /// [SizedBox] widget with 1% [width] of the [MediaQuery] width
  Widget w1(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 1,
        child: this,
      );

  /// [SizedBox] widget with 2% [width] of the [MediaQuery] width
  Widget w2(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 2,
        child: this,
      );

  /// [SizedBox] widget with 4% [width] of the [MediaQuery] width
  Widget w4(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 4,
        child: this,
      );

  /// [SizedBox] widget with 8% [width] of the [MediaQuery] width
  Widget w8(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 8,
        child: this,
      );

  /// [SizedBox] widget with 10% [width] of the [MediaQuery] width
  Widget w10(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 10,
        child: this,
      );

  /// [SizedBox] widget with 15% [width] of the [MediaQuery] width
  Widget w15(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 15,
        child: this,
      );

  /// [SizedBox] widget with 16% [width] of the [MediaQuery] width
  Widget w16(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 16,
        child: this,
      );

  /// [SizedBox] widget with 20% [width] of the [MediaQuery] width
  Widget w20(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 20,
        child: this,
      );

  /// [SizedBox] widget with 24% [width] of the [MediaQuery] width
  Widget w24(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 24,
        child: this,
      );

  /// [SizedBox] widget with 32% [width] of the [MediaQuery] width
  Widget w32(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 32,
        child: this,
      );

  /// [SizedBox] widget with 40% [width] of the [MediaQuery] width
  Widget w40(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 40,
        child: this,
      );

  /// [SizedBox] widget with 48% [width] of the [MediaQuery] width
  Widget w48(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 48,
        child: this,
      );

  /// [SizedBox] widget with 56% [width] of the [MediaQuery] width
  Widget w56(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 56,
        child: this,
      );

  /// [SizedBox] widget with 60% [width] of the [MediaQuery] width
  Widget w60(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 60,
        child: this,
      );

  /// [SizedBox] widget with 64% [width] of the [MediaQuery] width
  Widget w64(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 64,
        child: this,
      );

  /// [SizedBox] widget with half or 50% [width] of the [MediaQuery] width
  Widget wHalf(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 50,
        child: this,
      );

  /// [SizedBox] widget with one-third or 33.33% [width] of the [MediaQuery] width
  Widget wOneThird(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 33.333333,
        child: this,
      );

  /// [SizedBox] widget with two-third or 66.67% [width] of the [MediaQuery] width
  Widget wTwoThird(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 66.666667,
        child: this,
      );

  /// [SizedBox] widget with one-forth or 25% [width] of the [MediaQuery] width
  Widget wOneForth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 25,
        child: this,
      );

  /// [SizedBox] widget with three-forth or 75% [width] of the [MediaQuery] width
  Widget wThreeForth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 75,
        child: this,
      );

  /// [SizedBox] widget with four-fifth or 80% [width] of the [MediaQuery] width
  Widget wFourFifth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 80,
        child: this,
      );

  /// [SizedBox] widget with full [width] of the [MediaQuery] width
  Widget wFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.screenWidth,
        child: this,
      );

  ///All available heights
  /// [SizedBox] widget with a specified [height]
  Widget h(double height) => SizedBox(
        key: key,
        height: height,
        child: this,
      );

  /// [SizedBox] widget with a specified [height] percentage
  Widget hPCT({required BuildContext context, required double heightPCT}) =>
      SizedBox(
        key: key,
        height: context.percentHeight * heightPCT,
        child: this,
      );

  /// [SizedBox] widget with 0% [height] of the [MediaQuery] height
  Widget h0(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 0,
        child: this,
      );

  /// [SizedBox] widget with 1% [height] of the [MediaQuery] height
  Widget h1(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 1,
        child: this,
      );

  /// [SizedBox] widget with 2% [height] of the [MediaQuery] height
  Widget h2(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 2,
        child: this,
      );

  /// [SizedBox] widget with 4% [height] of the [MediaQuery] height
  Widget h4(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 4,
        child: this,
      );

  /// [SizedBox] widget with 8% [height] of the [MediaQuery] height
  Widget h8(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 8,
        child: this,
      );

  /// [SizedBox] widget with 10% [height] of the [MediaQuery] height
  Widget h10(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 10,
        child: this,
      );

  /// [SizedBox] widget with 15% [height] of the [MediaQuery] height
  Widget h15(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 15,
        child: this,
      );

  /// [SizedBox] widget with 16% [height] of the [MediaQuery] height
  Widget h16(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 16,
        child: this,
      );

  /// [SizedBox] widget with 20% [height] of the [MediaQuery] height
  Widget h20(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 20,
        child: this,
      );

  /// [SizedBox] widget with 24% [height] of the [MediaQuery] height
  Widget h24(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 24,
        child: this,
      );

  /// [SizedBox] widget with 32% [height] of the [MediaQuery] height
  Widget h32(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 32,
        child: this,
      );

  /// [SizedBox] widget with 40% [height] of the [MediaQuery] height
  Widget h40(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 40,
        child: this,
      );

  /// [SizedBox] widget with 48% [height] of the [MediaQuery] height
  Widget h48(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 48,
        child: this,
      );

  /// [SizedBox] widget with 56% [height] of the [MediaQuery] height
  Widget h56(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 56,
        child: this,
      );

  /// [SizedBox] widget with 60% [height] of the [MediaQuery] height
  Widget h60(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 60,
        child: this,
      );

  /// [SizedBox] widget with 64% [height] of the [MediaQuery] height
  Widget h64(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 64,
        child: this,
      );

  /// [SizedBox] widget with half or 50% [height] of the [MediaQuery] height
  Widget hHalf(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 50,
        child: this,
      );

  /// [SizedBox] widget with one-third or 33.33% [height] of the [MediaQuery] height
  Widget hOneThird(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 33.333333,
        child: this,
      );

  /// [SizedBox] widget with two-third or 66.67% [height] of the [MediaQuery] height
  Widget hTwoThird(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 66.666667,
        child: this,
      );

  /// [SizedBox] widget with one-forth or 25% [height] of the [MediaQuery] height
  Widget hOneForth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 25,
        child: this,
      );

  /// [SizedBox] widget with three-forth or 75% [height] of the [MediaQuery] height
  Widget hThreeForth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 75,
        child: this,
      );

  /// [SizedBox] widget with four-fifth or 80% [height] of the [MediaQuery] height
  Widget hFourFifth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.percentHeight * 80,
        child: this,
      );

  /// [SizedBox] widget with full [height] of the [MediaQuery] height
  Widget hFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.screenHeight,
        child: this,
      );

  /// All Size Width - Height
  ///
  /// [SizedBox] widget with a specified [width] & [height]
  Widget wh(double width, double height) => SizedBox(
        key: key,
        width: width,
        height: height,
        child: this,
      );

  /// [SizedBox] widget with a specified [width] & [height] percentage
  Widget whPCT(
          {required BuildContext context,
          required double widthPCT,
          required double heightPCT}) =>
      SizedBox(
        key: key,
        width: context.percentWidth * widthPCT,
        height: context.percentHeight * heightPCT,
        child: this,
      );

  /// [SizedBox] widget with 0% [width] & [height] of the [MediaQuery] width & height
  Widget wh0(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 0,
        height: context.percentHeight * 0,
        child: this,
      );

  /// [SizedBox] widget with 1% [width] & [height] of the [MediaQuery] width & height
  Widget wh1(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 1,
        height: context.percentHeight * 1,
        child: this,
      );

  /// [SizedBox] widget with 2% [width] & [height] of the [MediaQuery] width & height
  Widget wh2(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 2,
        height: context.percentHeight * 2,
        child: this,
      );

  /// [SizedBox] widget with 4% [width] & [height] of the [MediaQuery] width & height
  Widget wh4(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 4,
        height: context.percentHeight * 4,
        child: this,
      );

  /// [SizedBox] widget with 8% [width] & [height] of the [MediaQuery] width & height
  Widget wh8(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 8,
        height: context.percentHeight * 8,
        child: this,
      );

  /// [SizedBox] widget with 10% [width] & [height] of the [MediaQuery] width & height
  Widget wh10(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 10,
        height: context.percentHeight * 10,
        child: this,
      );

  /// [SizedBox] widget with 15% [width] & [height] of the [MediaQuery] width & height
  Widget wh15(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 15,
        height: context.percentHeight * 15,
        child: this,
      );

  /// [SizedBox] widget with 16% [width] & [height] of the [MediaQuery] width & height
  Widget wh16(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 16,
        height: context.percentHeight * 16,
        child: this,
      );

  /// [SizedBox] widget with 20% [width] & [height] of the [MediaQuery] width & height
  Widget wh20(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 20,
        height: context.percentHeight * 20,
        child: this,
      );

  /// [SizedBox] widget with 24% [width] & [height] of the [MediaQuery] width & height
  Widget wh24(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 24,
        height: context.percentHeight * 24,
        child: this,
      );

  /// [SizedBox] widget with 32% [width] & [height] of the [MediaQuery] width & height
  Widget wh32(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 32,
        height: context.percentHeight * 32,
        child: this,
      );

  /// [SizedBox] widget with 40% [width] & [height] of the [MediaQuery] width & height
  Widget wh40(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 40,
        height: context.percentHeight * 40,
        child: this,
      );

  /// [SizedBox] widget with 48% [width] & [height] of the [MediaQuery] width & height
  Widget wh48(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 48,
        height: context.percentHeight * 48,
        child: this,
      );

  /// [SizedBox] widget with 56% [width] & [height] of the [MediaQuery] width & height
  Widget wh56(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 56,
        height: context.percentHeight * 56,
        child: this,
      );

  /// [SizedBox] widget with 60% [width] & [height] of the [MediaQuery] width & height
  Widget wh60(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 60,
        height: context.percentHeight * 60,
        child: this,
      );

  /// [SizedBox] widget with 64% [width] & [height] of the [MediaQuery] width & height
  Widget wh64(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 64,
        height: context.percentHeight * 64,
        child: this,
      );

  /// [SizedBox] widget with half or 50% [width] & [height] of the [MediaQuery] width & height
  Widget whHalf(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 50,
        height: context.percentHeight * 50,
        child: this,
      );

  /// [SizedBox] widget with one-third or 33.33% [width] & [height] of the [MediaQuery] width & height
  Widget whOneThird(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 33.333333,
        height: context.percentHeight * 33.333333,
        child: this,
      );

  /// [SizedBox] widget with two-third or 66.67% [width] & [height] of the [MediaQuery] width & height
  Widget whTwoThird(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 66.666667,
        height: context.percentHeight * 66.666667,
        child: this,
      );

  /// [SizedBox] widget with one-forth or 25% [width] & [height] of the [MediaQuery] width & height
  Widget whOneForth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 25,
        height: context.percentHeight * 25,
        child: this,
      );

  /// [SizedBox] widget with three-forth or 75% [width] & [height] of the [MediaQuery] width & height
  Widget whThreeForth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 75,
        height: context.percentHeight * 75,
        child: this,
      );

  /// [SizedBox] widget with four-fifth or 80% [width] & [height] of the [MediaQuery] width & height

  Widget whFourFifth(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.percentWidth * 80,
        height: context.percentHeight * 80,
        child: this,
      );

  /// [SizedBox] widget with full [width] & [height] of the [MediaQuery] width & height

  Widget whFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.screenWidth,
        height: context.screenHeight,
        child: this,
      );

  /// Extension for [FractionallySizedBox]
  Widget fractionalBox(
          {Key? key,
          required double heightFactor,
          required double widthFactor,
          Alignment? alignment}) =>
      FractionallySizedBox(
        key: key,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        alignment: alignment ?? Alignment.center,
        child: this,
      );
}

///
/// [SizedBox] widget with specific [width]
///
class WidthBox extends StatelessWidget {
  const WidthBox(
    this.width, {
    super.key,
  });

  /// Give [width] of the [SizedBox]
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      key: key,
    );
  }
}

///
/// [SizedBox] widget with specific [height]
///
class HeightBox extends StatelessWidget {
  const HeightBox(
    this.height, {
    super.key,
  });

  /// Give [height] of the [SizedBox]
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      key: key,
    );
  }
}

///
/// [SizedBox] widget with equal [width] & [height]
///
class SquareBox extends StatelessWidget {
  const SquareBox(
    this.size, {
    super.key,
  });

  /// Give [size] of the [SizedBox]
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      key: key,
    );
  }
}
