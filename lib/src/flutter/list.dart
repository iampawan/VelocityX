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

class VelocityDiscList extends StatelessWidget {
  final List<String> _items;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double fontSize;

  const VelocityDiscList(
    this._items, {
    Key key,
    this.padding,
    this.color = Colors.black,
    this.fontSize = 14.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return HStack(
          [
            VelocityBox().height(fontSize / 2.8).width(fontSize / 2.8).color(color).roundedFull.makeCentered(),
            10.widthBox,
            _items[i].text.color(color).size(fontSize).make(),
          ],
          crossAlignment: CrossAxisAlignment.center,
        ).p8();
      },
      itemCount: _items.length,
      padding: padding,
    );
  }
}

class VelocityDecimalList extends StatelessWidget {
  final List<String> _items;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double fontSize;

  const VelocityDecimalList(
    this._items, {
    Key key,
    this.padding,
    this.color = Colors.black,
    this.fontSize = 14.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return HStack(
          [
            (i + 1).text.color(color).size(fontSize).make(),
            10.widthBox,
            _items[i].text.color(color).size(fontSize).make(),
          ],
          crossAlignment: CrossAxisAlignment.center,
        ).p8();
      },
      itemCount: _items.length,
      padding: padding,
    );
  }
}
