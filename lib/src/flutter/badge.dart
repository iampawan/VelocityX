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
import 'package:velocity_x/src/flutter/common/velocity_round.dart';

enum VxBadgeType { point, round, ellipse }

enum VxBadgePosition { left, right, leftTop, rightTop, leftBottom, rightBottom }

/// VxBadge widget for using common badges as number or dot.

class VxBadge extends StatelessWidget {
  final VxBadgeType type;
  final Color? color;
  final TextStyle? textStyle;
  final int? count;
  final bool limit;
  final Widget? child;
  final double? size;
  final VxBadgePosition position;

  /// To provide an optional widget like an Icon
  final Widget? optionalWidget;

  const VxBadge({
    super.key,
    required this.child,
    this.type = VxBadgeType.round,
    this.color,
    this.textStyle,
    this.count,
    this.limit = false,
    this.size,
    this.optionalWidget,
    this.position = VxBadgePosition.rightTop,
  });

  @override
  Widget build(BuildContext context) {
    if (child == null && optionalWidget == null) {
      return getVxRound();
    }
    return positionView();
  }

  /// Get the number to show in the badge
  String getNumber() {
    if (count == null) {
      return "";
    } else if (limit && count! > 99) {
      return '99+';
    }
    return '$count';
  }

  /// Get the style of the text
  TextStyle getTextStyle() {
    return textStyle ?? const TextStyle(fontSize: 8, color: Colors.white);
  }

  /// Get the Vx Round type whether [VxBadgeType.point] or [VxBadgeType.ellipse] or [VxBadgeType.round]
  Widget getVxRound() {
    if (type == VxBadgeType.point) {
      return VxRound(
        type: VxRoundType.point,
        size: size,
        color: color,
      );
    } else if (type == VxBadgeType.round) {
      return VxRound(
        type: VxRoundType.round,
        color: color,
        size: size,
        child: optionalWidget ??
            Text(
              getNumber(),
              style: getTextStyle(),
            ),
      );
    } else {
      return VxRound(
        type: VxRoundType.ellipse,
        color: color,
        size: size,
        child: optionalWidget ??
            Text(
              getNumber(),
              style: getTextStyle(),
            ),
      );
    }
  }

  /// Get the position view
  Widget positionView() {
    final List<Widget> children = [];
    children.add(child!);
    if (position == VxBadgePosition.left) {
      children.insert(0, getVxRound());
    } else if (position == VxBadgePosition.right) {
      children.add(getVxRound());
    } else if (position == VxBadgePosition.leftTop) {
      children.add(Positioned(
        top: 0,
        left: 0,
        child: getVxRound(),
      ));
    } else if (position == VxBadgePosition.rightTop) {
      children.add(Positioned(
        top: 0,
        right: 0,
        child: getVxRound(),
      ));
    } else if (position == VxBadgePosition.leftBottom) {
      children.add(Positioned(
        bottom: 0,
        left: 0,
        child: getVxRound(),
      ));
    } else if (position == VxBadgePosition.rightBottom) {
      children.add(Positioned(
        bottom: 0,
        right: 0,
        child: getVxRound(),
      ));
    }

    if (position == VxBadgePosition.left || position == VxBadgePosition.right) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    } else {
      return Stack(
        children: children,
      );
    }
  }
}

extension VxBadgeExtension on Widget {
  ///
  /// Extension method to directly access [VxBadge] with any widget without wrapping or with dot operator.
  ///
  /// show [badge] extension

  Widget badge({
    VxBadgeType type = VxBadgeType.round,
    Color? color,
    TextStyle? textStyle,
    int? count,
    bool limit = false,
    double? size,
    Widget? optionalWidget,
    VxBadgePosition position = VxBadgePosition.rightTop,
  }) =>
      VxBadge(
        textStyle: textStyle,
        color: color,
        limit: limit,
        count: count,
        position: position,
        size: size,
        type: type,
        optionalWidget: optionalWidget,
        child: this,
      );
}
