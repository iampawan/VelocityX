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

/// [VxUnorderedList] is inspired from html where you can have a circular disk with an item (string)
/// Use [VxUnorderedList] to have a list of strings with circular disk of boxes with a defined color.
class VxUnorderedList extends StatelessWidget {
  /// List of strings
  final List<String> _items;

  /// Add padding to the listview
  final EdgeInsetsGeometry? padding;

  /// Specify color of the disc. Default is black
  final Color color;

  /// Specify fontSize of the text. Default is 14. It also adjusts the disc size.
  final double? fontSize;

  /// If the listview is primary. Default is false.
  final bool? primary;

  /// If the listview is shrinkWrapped. Default is true.
  final bool shrinkWrap;

  /// Specify the [ScrollPhysics].
  final ScrollPhysics? physics;

  /// Specify the direction of the listview. Default is vertical.
  final Axis direction;

  /// If the children is wrapped with expanded widget. Default is false.
  final bool isExpandedChild;

  const VxUnorderedList(
    this._items, {
    super.key,
    this.padding,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.primary = false,
    this.shrinkWrap = true,
    this.physics,
    this.direction = Axis.vertical,
    this.isExpandedChild = false,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      shrinkWrap: shrinkWrap,
      scrollDirection: direction,
      primary: primary,
      physics: physics,
      itemCount: _items.length,
      padding: padding,
      itemBuilder: (context, i) {
        final mainChild = _items[i]
            .selectableText
            .color(color)
            .size(fontSize)
            .make()
            .expand();
        var children = [
          VxBox()
              .square(fontSize! / 2.8)
              .color(color)
              .roundedFull
              .makeCentered(),
          10.widthBox,
          if (isExpandedChild) mainChild.expand() else mainChild,
        ];
        return HStack(
          children,
          crossAlignment: CrossAxisAlignment.center,
        ).p8();
      },
    );
  }
}

enum VxListType {
  decimal,
  upperAlpha,
  lowerAlpha,
  upperRoman,
  lowerRoman,
}

class VxOrderedList extends StatelessWidget {
  /// Specify the list of items
  final List<String> items;

  /// Specify the type of list. Default is decimal
  final VxListType type;

  /// Add padding to the listview
  final EdgeInsetsGeometry? padding;

  /// Specify color of the item. Default is black
  final Color color;

  /// Specify fontSize of the text. Default is 14. It also adjusts the disc size.
  final double? fontSize;

  /// If the listview is primary. Default is false.
  final bool? primary;

  /// If the listview is shrinkWrapped. Default is true.
  final bool shrinkWrap;

  /// Specify the [ScrollPhysics].
  final ScrollPhysics? physics;

  /// Specify the direction of the listview. Default is vertical.
  final Axis direction;

  /// If the children is wrapped with expanded widget. Default is false.
  final bool isExpandedChild;

  const VxOrderedList(
    this.items, {
    super.key,
    this.type = VxListType.decimal,
    this.padding,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.primary = false,
    this.shrinkWrap = true,
    this.physics,
    this.direction = Axis.vertical,
    this.isExpandedChild = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      scrollDirection: direction,
      padding: padding,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final formattedItem = _formatItem(index + 1);
        final mainChild =
            item.selectableText.color(color).size(fontSize).make();
        return HStack(
          [
            formattedItem.text.color(color).size(fontSize).make(),
            8.widthBox,
            if (isExpandedChild) mainChild.expand() else mainChild,
          ],
          crossAlignment: CrossAxisAlignment.center,
        ).p8();
      },
    );
  }

  String _formatItem(int index) {
    switch (type) {
      case VxListType.decimal:
        return '$index.';
      case VxListType.upperAlpha:
        return '${String.fromCharCode(65 + index - 1)}.';
      case VxListType.lowerAlpha:
        return '${String.fromCharCode(97 + index - 1)}.';
      case VxListType.upperRoman:
        return '${_toRomanNumeral(index)}.';
      case VxListType.lowerRoman:
        return '${_toRomanNumeral(index).toLowerCase()}.';
      default:
        return '$index.';
    }
  }

  String _toRomanNumeral(int number) {
    // Roman numeral conversion logic
    // Implement the conversion algorithm according to your needs
    // This is a simplified example
    if (number == 1) return 'I';
    if (number == 2) return 'II';
    if (number == 3) return 'III';
    if (number >= 1000) return 'M${_toRomanNumeral(number - 1000)}';
    if (number >= 900) return 'CM${_toRomanNumeral(number - 900)}';
    if (number >= 500) return 'D${_toRomanNumeral(number - 500)}';
    if (number >= 400) return 'CD${_toRomanNumeral(number - 400)}';
    if (number >= 100) return 'C${_toRomanNumeral(number - 100)}';
    if (number >= 90) return 'XC${_toRomanNumeral(number - 90)}';
    if (number >= 50) return 'L${_toRomanNumeral(number - 50)}';
    if (number >= 40) return 'XL${_toRomanNumeral(number - 40)}';
    if (number >= 10) return 'X${_toRomanNumeral(number - 10)}';
    if (number >= 9) return 'IX${_toRomanNumeral(number - 9)}';
    if (number >= 5) return 'V${_toRomanNumeral(number - 5)}';
    if (number >= 4) return 'IV${_toRomanNumeral(number - 4)}';
    if (number >= 1) return 'I${_toRomanNumeral(number - 1)}';

    return '';
  }
}
