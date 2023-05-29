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

enum VxRoundType { point, round, ellipse }

/// VxRound Widget for different dot indicators
class VxRound extends StatelessWidget {
  final VxRoundType type;
  final double? size;
  final Color? color;
  final dynamic child;
  final TextStyle? textStyle;

  const VxRound({
    super.key,
    this.type = VxRoundType.point,
    this.size,
    this.color,
    this.child,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (type == VxRoundType.point) {
      final double tempSize = size ?? 8;
      return Container(
        width: tempSize,
        height: tempSize,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColorLight,
          shape: BoxShape.circle,
        ),
      );
    } else if (type == VxRoundType.round) {
      final double tempSize = size ?? 16;
      return Container(
        width: tempSize,
        height: tempSize,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColorLight,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: getContent(),
      );
    } else {
      final double tempSize = size ?? 16;
      final Radius radius = Radius.circular(tempSize / 2);
      return Container(
        constraints: BoxConstraints(
            maxHeight: tempSize, minHeight: tempSize, minWidth: tempSize),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.horizontal(left: radius, right: radius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [getContent()!],
        ),
      );
    }
  }

  /// Get the background color
  Color getBgColor(BuildContext context) {
    return color ?? Theme.of(context).primaryColor;
  }

  /// Get the text style
  TextStyle getTextStyle() {
    return textStyle ?? const TextStyle(fontSize: 8, color: Colors.white);
  }

  /// Get the content
  Widget? getContent() {
    if (child is String) {
      return Text(child, style: getTextStyle(), maxLines: 1);
    } else if (child is Widget) {
      return child;
    } else {
      return const Offstage();
    }
  }
}
