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

extension SizedBoxExtension on Widget {
  ///All available widths
  Widget w({Key key, @required double width}) => SizedBox(
        key: key,
        width: width,
        child: this,
      );
  Widget w0({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 0,
        child: this,
      );

  Widget w1({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 1,
        child: this,
      );

  Widget w2({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 2,
        child: this,
      );

  Widget w4({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 4,
        child: this,
      );

  Widget w8({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 8,
        child: this,
      );

  Widget w10({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 10,
        child: this,
      );

  Widget w15({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 15,
        child: this,
      );

  Widget w16({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 16,
        child: this,
      );

  Widget w20({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 20,
        child: this,
      );

  Widget w24({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 24,
        child: this,
      );

  Widget w32({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 32,
        child: this,
      );

  Widget w40({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 40,
        child: this,
      );

  Widget w48({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 48,
        child: this,
      );

  Widget w56({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 56,
        child: this,
      );

  Widget w60({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 60,
        child: this,
      );

  Widget w64({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 64,
        child: this,
      );

  Widget wHalf({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 50,
        child: this,
      );

  Widget wOneThird({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 33.333333,
        child: this,
      );

  Widget wTwoThird({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 66.666667,
        child: this,
      );

  Widget wOneForth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 25,
        child: this,
      );

  Widget wThreeForth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 75,
        child: this,
      );

  Widget wFourFifth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 80,
        child: this,
      );

  Widget wFull({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.screenWidth,
        child: this,
      );

  ///All available heights

  Widget h({Key key, @required double height}) => SizedBox(
        key: key,
        height: height,
        child: this,
      );

  Widget h0({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 0,
        child: this,
      );

  Widget h1({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 1,
        child: this,
      );

  Widget h2({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 2,
        child: this,
      );

  Widget h4({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 4,
        child: this,
      );

  Widget h8({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 8,
        child: this,
      );

  Widget h10({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 10,
        child: this,
      );

  Widget h15({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 15,
        child: this,
      );

  Widget h16({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 16,
        child: this,
      );

  Widget h20({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 20,
        child: this,
      );

  Widget h24({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 24,
        child: this,
      );

  Widget h32({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 32,
        child: this,
      );

  Widget h40({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 40,
        child: this,
      );

  Widget h48({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 48,
        child: this,
      );

  Widget h56({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 56,
        child: this,
      );

  Widget h60({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 60,
        child: this,
      );

  Widget h64({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 64,
        child: this,
      );

  Widget hHalf({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 50,
        child: this,
      );

  Widget hOneThird({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 33.333333,
        child: this,
      );

  Widget hThoThird({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 66.666667,
        child: this,
      );

  Widget hOneForth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 25,
        child: this,
      );

  Widget hThreeForth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 75,
        child: this,
      );

  Widget hFourFifth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.percentHeight * 80,
        child: this,
      );

  Widget hFull({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        height: context.screenHeight,
        child: this,
      );

  /// All Size Width - Height
  Widget wh({Key key, @required double width, @required double height}) =>
      SizedBox(
        key: key,
        width: width,
        height: height,
        child: this,
      );

  Widget wh0({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 0,
        height: context.percentHeight * 0,
        child: this,
      );

  Widget wh1({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 1,
        height: context.percentHeight * 1,
        child: this,
      );

  Widget wh2({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 2,
        height: context.percentHeight * 2,
        child: this,
      );

  Widget wh4({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 4,
        height: context.percentHeight * 4,
        child: this,
      );

  Widget wh8({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 8,
        height: context.percentHeight * 8,
        child: this,
      );

  Widget wh10({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 10,
        height: context.percentHeight * 10,
        child: this,
      );

  Widget wh15({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 15,
        height: context.percentHeight * 15,
        child: this,
      );

  Widget wh16({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 16,
        height: context.percentHeight * 16,
        child: this,
      );

  Widget wh20({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 20,
        height: context.percentHeight * 20,
        child: this,
      );

  Widget wh24({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 24,
        height: context.percentHeight * 24,
        child: this,
      );

  Widget wh32({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 32,
        height: context.percentHeight * 32,
        child: this,
      );

  Widget wh40({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 40,
        height: context.percentHeight * 40,
        child: this,
      );

  Widget wh48({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 48,
        height: context.percentHeight * 48,
        child: this,
      );

  Widget wh56({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 56,
        height: context.percentHeight * 56,
        child: this,
      );

  Widget wh60({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 60,
        height: context.percentHeight * 60,
        child: this,
      );

  Widget wh64({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 64,
        height: context.percentHeight * 64,
        child: this,
      );

  Widget whHalf({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 50,
        height: context.percentHeight * 50,
        child: this,
      );

  Widget whOneThird({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 33.333333,
        height: context.percentHeight * 33.333333,
        child: this,
      );

  Widget whThoThird({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 66.666667,
        height: context.percentHeight * 66.666667,
        child: this,
      );

  Widget whOneForth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 25,
        height: context.percentHeight * 25,
        child: this,
      );

  Widget whThreeForth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 75,
        height: context.percentHeight * 75,
        child: this,
      );

  Widget whFourFifth({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.percentWidth * 80,
        height: context.percentHeight * 80,
        child: this,
      );

  Widget whFull({Key key, @required BuildContext context}) => SizedBox(
        key: key,
        width: context.screenWidth,
        height: context.screenHeight,
        child: this,
      );
}
