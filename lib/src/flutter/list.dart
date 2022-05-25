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

/// [VxDiscList] is inspired from html where you can have a circular disk with an item (string)
/// Use [VxDiscList] to have a list of strings with circular disk of boxes with a defined color.
class VxDiscList extends StatelessWidget {
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

  const VxDiscList(
    this._items, {
    Key? key,
    this.padding,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.primary = false,
    this.shrinkWrap = true,
    this.physics,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      itemBuilder: (context, i) {
        return HStack(
          [
            VxBox()
                .height(fontSize! / 2.8)
                .width(fontSize! / 2.8)
                .color(color)
                .roundedFull
                .makeCentered(),
            10.widthBox,
            Expanded(
                child: _items[i]
                    .selectableText
                    .color(color)
                    .size(fontSize)
                    .make()),
          ],
          crossAlignment: CrossAxisAlignment.center,
        ).p8();
      },
      itemCount: _items.length,
      padding: padding,
    );
  }
}

/// [VxDecimalList] is inspired from html where you can have a numeric index with an item (string)
/// Use [VxDecimalList] to have a list of strings with index.
class VxDecimalList extends StatelessWidget {
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

  const VxDecimalList(
    this._items, {
    Key? key,
    this.padding,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.primary = false,
    this.shrinkWrap = true,
    this.physics,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      itemBuilder: (context, i) {
        return HStack(
          [
            (i + 1).text.color(color).size(fontSize).make(),
            10.widthBox,
            Expanded(
                child: _items[i]
                    .selectableText
                    .color(color)
                    .size(fontSize)
                    .make()),
          ],
          crossAlignment: CrossAxisAlignment.center,
        ).p8();
      },
      itemCount: _items.length,
      padding: padding,
    );
  }
}
