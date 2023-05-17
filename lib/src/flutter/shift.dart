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

///  Use it to pin and shift widget useful for making complex ui Eg
/// Container(
///   height: 200,
///   width: 200,
///   decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffE0D8F9)
///       ),
/// ).shift(100, alignment: Alignment.bottomRight) ,

class VxShifter extends StatelessWidget {
  const VxShifter({
    super.key,

    // @required this.w,
    // this.color,
    this.child,
    required this.alignment,
    required this.shift,

    // @required this.paddingPerc,
  });

  final double shift;
  // final Color color;
  final Widget? child;
  final Alignment alignment;
  // final int paddingPerc;

  @override
  Widget build(BuildContext context) {
    double x, y;
    if (alignment == Alignment.topRight) {
      x = shift;
      y = -shift;
    } else if (alignment == Alignment.topLeft) {
      x = -shift;
      y = -shift;
    } else if (alignment == Alignment.bottomRight) {
      x = shift;
      y = shift;
    } else if (alignment == Alignment.bottomLeft) {
      x = -shift;
      y = shift;
    } else {
      throw UnsupportedError('Not supported alignment $alignment');
    }

    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: Offset(x, y),
        child: child,
      ),
    );
  }
}

extension VxShiftWidgetExt on Widget {
  Widget shift(
    double shift, {
    Key? key,
    required Alignment alignment,
  }) =>
      VxShifter(
        key: key,
        alignment: alignment,
        shift: shift,
        child: this,
      );
}
