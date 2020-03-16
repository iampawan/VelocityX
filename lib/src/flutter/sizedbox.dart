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
import 'package:velocity_x/src/velocity_x_extensions.dart';

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

extension SizedBoxExtension on Widget {
  ///All available widths
  Widget w(double width) => SizedBox(
        width: width,
        child: this,
      );
  Widget w0(BuildContext context) => SizedBox(
        width: context.percentWidth * 0,
        child: this,
      );

  Widget w1(BuildContext context) => SizedBox(
        width: context.percentWidth * 1,
        child: this,
      );

  Widget w2(BuildContext context) => SizedBox(
        width: context.percentWidth * 2,
        child: this,
      );

  Widget w4(BuildContext context) => SizedBox(
        width: context.percentWidth * 4,
        child: this,
      );

  Widget w8(BuildContext context) => SizedBox(
        width: context.percentWidth * 8,
        child: this,
      );

  Widget w10(BuildContext context) => SizedBox(
        width: context.percentWidth * 10,
        child: this,
      );

  Widget w15(BuildContext context) => SizedBox(
        width: context.percentWidth * 15,
        child: this,
      );

  Widget w16(BuildContext context) => SizedBox(
        width: context.percentWidth * 16,
        child: this,
      );

  Widget w20(BuildContext context) => SizedBox(
        width: context.percentWidth * 20,
        child: this,
      );

  Widget w24(BuildContext context) => SizedBox(
        width: context.percentWidth * 24,
        child: this,
      );

  Widget w32(BuildContext context) => SizedBox(
        width: context.percentWidth * 32,
        child: this,
      );

  Widget w40(BuildContext context) => SizedBox(
        width: context.percentWidth * 40,
        child: this,
      );

  Widget w48(BuildContext context) => SizedBox(
        width: context.percentWidth * 48,
        child: this,
      );

  Widget w56(BuildContext context) => SizedBox(
        width: context.percentWidth * 56,
        child: this,
      );

  Widget w60(BuildContext context) => SizedBox(
        width: context.percentWidth * 60,
        child: this,
      );

  Widget w64(BuildContext context) => SizedBox(
        width: context.percentWidth * 64,
        child: this,
      );

  Widget wHalf(BuildContext context) => SizedBox(
        width: context.percentWidth * 50,
        child: this,
      );

  Widget wOneThird(BuildContext context) => SizedBox(
        width: context.percentWidth * 33.333333,
        child: this,
      );

  Widget wTwoThird(BuildContext context) => SizedBox(
        width: context.percentWidth * 66.666667,
        child: this,
      );

  Widget wOneForth(BuildContext context) => SizedBox(
        width: context.percentWidth * 25,
        child: this,
      );

  Widget wThreeForth(BuildContext context) => SizedBox(
        width: context.percentWidth * 75,
        child: this,
      );

  Widget wFourFifth(BuildContext context) => SizedBox(
        width: context.percentWidth * 80,
        child: this,
      );

  Widget wFull(BuildContext context) => SizedBox(
        width: context.screenWidth,
        child: this,
      );

  ///All available heights

  Widget h(double height) => SizedBox(
        height: height,
        child: this,
      );

  Widget h0(BuildContext context) => SizedBox(
        height: context.percentHeight * 0,
        child: this,
      );

  Widget h1(BuildContext context) => SizedBox(
        height: context.percentHeight * 1,
        child: this,
      );

  Widget h2(BuildContext context) => SizedBox(
        height: context.percentHeight * 2,
        child: this,
      );

  Widget h4(BuildContext context) => SizedBox(
        height: context.percentHeight * 4,
        child: this,
      );

  Widget h8(BuildContext context) => SizedBox(
        height: context.percentHeight * 8,
        child: this,
      );

  Widget h10(BuildContext context) => SizedBox(
        height: context.percentHeight * 10,
        child: this,
      );

  Widget h15(BuildContext context) => SizedBox(
        height: context.percentHeight * 15,
        child: this,
      );

  Widget h16(BuildContext context) => SizedBox(
        height: context.percentHeight * 16,
        child: this,
      );

  Widget h20(BuildContext context) => SizedBox(
        height: context.percentHeight * 20,
        child: this,
      );

  Widget h24(BuildContext context) => SizedBox(
        height: context.percentHeight * 24,
        child: this,
      );

  Widget h32(BuildContext context) => SizedBox(
        height: context.percentHeight * 32,
        child: this,
      );

  Widget h40(BuildContext context) => SizedBox(
        height: context.percentHeight * 40,
        child: this,
      );

  Widget h48(BuildContext context) => SizedBox(
        height: context.percentHeight * 48,
        child: this,
      );

  Widget h56(BuildContext context) => SizedBox(
        height: context.percentHeight * 56,
        child: this,
      );

  Widget h60(BuildContext context) => SizedBox(
        height: context.percentHeight * 60,
        child: this,
      );

  Widget h64(BuildContext context) => SizedBox(
        height: context.percentHeight * 64,
        child: this,
      );

  Widget hHalf(BuildContext context) => SizedBox(
        height: context.percentHeight * 50,
        child: this,
      );

  Widget hOneThird(BuildContext context) => SizedBox(
        height: context.percentHeight * 33.333333,
        child: this,
      );

  Widget hThoThird(BuildContext context) => SizedBox(
        height: context.percentHeight * 66.666667,
        child: this,
      );

  Widget hOneForth(BuildContext context) => SizedBox(
        height: context.percentHeight * 25,
        child: this,
      );

  Widget hThreeForth(BuildContext context) => SizedBox(
        height: context.percentHeight * 75,
        child: this,
      );

  Widget hFourFifth(BuildContext context) => SizedBox(
        height: context.percentHeight * 80,
        child: this,
      );

  Widget hFull(BuildContext context) => SizedBox(
        height: context.screenHeight,
        child: this,
      );

  /// All Size Width - Height
  Widget wh(double width, double height) => SizedBox(
        width: width,
        height: height,
        child: this,
      );

  Widget wh0(BuildContext context) => SizedBox(
        width: context.percentWidth * 0,
        height: context.percentHeight * 0,
        child: this,
      );

  Widget wh1(BuildContext context) => SizedBox(
        width: context.percentWidth * 1,
        height: context.percentHeight * 1,
        child: this,
      );

  Widget wh2(BuildContext context) => SizedBox(
        width: context.percentWidth * 2,
        height: context.percentHeight * 2,
        child: this,
      );

  Widget wh4(BuildContext context) => SizedBox(
        width: context.percentWidth * 4,
        height: context.percentHeight * 4,
        child: this,
      );

  Widget wh8(BuildContext context) => SizedBox(
        width: context.percentWidth * 8,
        height: context.percentHeight * 8,
        child: this,
      );

  Widget wh10(BuildContext context) => SizedBox(
        width: context.percentWidth * 10,
        height: context.percentHeight * 10,
        child: this,
      );

  Widget wh15(BuildContext context) => SizedBox(
        width: context.percentWidth * 15,
        height: context.percentHeight * 15,
        child: this,
      );

  Widget wh16(BuildContext context) => SizedBox(
        width: context.percentWidth * 16,
        height: context.percentHeight * 16,
        child: this,
      );

  Widget wh20(BuildContext context) => SizedBox(
        width: context.percentWidth * 20,
        height: context.percentHeight * 20,
        child: this,
      );

  Widget wh24(BuildContext context) => SizedBox(
        width: context.percentWidth * 24,
        height: context.percentHeight * 24,
        child: this,
      );

  Widget wh32(BuildContext context) => SizedBox(
        width: context.percentWidth * 32,
        height: context.percentHeight * 32,
        child: this,
      );

  Widget wh40(BuildContext context) => SizedBox(
        width: context.percentWidth * 40,
        height: context.percentHeight * 40,
        child: this,
      );

  Widget wh48(BuildContext context) => SizedBox(
        width: context.percentWidth * 48,
        height: context.percentHeight * 48,
        child: this,
      );

  Widget wh56(BuildContext context) => SizedBox(
        width: context.percentWidth * 56,
        height: context.percentHeight * 56,
        child: this,
      );

  Widget wh60(BuildContext context) => SizedBox(
        width: context.percentWidth * 60,
        height: context.percentHeight * 60,
        child: this,
      );

  Widget wh64(BuildContext context) => SizedBox(
        width: context.percentWidth * 64,
        height: context.percentHeight * 64,
        child: this,
      );

  Widget whHalf(BuildContext context) => SizedBox(
        width: context.percentWidth * 50,
        height: context.percentHeight * 50,
        child: this,
      );

  Widget whOneThird(BuildContext context) => SizedBox(
        width: context.percentWidth * 33.333333,
        height: context.percentHeight * 33.333333,
        child: this,
      );

  Widget whThoThird(BuildContext context) => SizedBox(
        width: context.percentWidth * 66.666667,
        height: context.percentHeight * 66.666667,
        child: this,
      );

  Widget whOneForth(BuildContext context) => SizedBox(
        width: context.percentWidth * 25,
        height: context.percentHeight * 25,
        child: this,
      );

  Widget whThreeForth(BuildContext context) => SizedBox(
        width: context.percentWidth * 75,
        height: context.percentHeight * 75,
        child: this,
      );

  Widget whFourFifth(BuildContext context) => SizedBox(
        width: context.percentWidth * 80,
        height: context.percentHeight * 80,
        child: this,
      );

  Widget whFull(BuildContext context) => SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: this,
      );
}
