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
import 'package:velocity_x/src/velocity_x_extensions.dart';

class TwoTile extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final Color titleColor;
  final String subtitle;
  final TextSpan subtitle2;
  final TextSpan subtitle3;
  final double subtitleFontSize;
  final Color subtitleColor;
  final bool isSubtitleBold;
  final bool isHorizontal;
  final CrossAxisAlignment crossAxisAlignment;

  const TwoTile({
    Key key,
    @required this.title,
    this.titleFontSize = 14.0,
    this.titleColor = Colors.grey,
    @required this.subtitle,
    this.subtitle2,
    this.subtitle3,
    this.subtitleFontSize = 16.0,
    this.subtitleColor,
    this.isSubtitleBold = false,
    this.isHorizontal = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final list = [
      Text(
        title,
        style: TextStyle(fontSize: titleFontSize, color: titleColor),
      ),
      8.hBox(),
      Text.rich(
        TextSpan(
          text: subtitle,
          children: [
            subtitle2 ?? const TextSpan(),
            subtitle3 ?? const TextSpan(),
          ],
        ),
        maxLines: 1,
        textAlign: TextAlign.justify,
        softWrap: true,
        style: TextStyle(
          fontWeight: isSubtitleBold ? FontWeight.bold : FontWeight.normal,
          fontSize: subtitleFontSize,
          textBaseline: TextBaseline.alphabetic,
          color: subtitleColor,
        ),
      )
    ];
    if (isHorizontal) {
      return Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        textBaseline: TextBaseline.alphabetic,
        children: list,
      );
    } else {
      return Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        textBaseline: TextBaseline.alphabetic,
        children: list,
      );
    }
  }
}

class TwoTileColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;

  const TwoTileColumn({Key key, @required this.top, @required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        10.hBox(),
        bottom,
      ],
    );
  }
}

class TwoTileRow extends StatelessWidget {
  final Widget left;
  final Widget right;

  const TwoTileRow({Key key, @required this.left, @required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        left,
        10.wBox(),
        right,
      ],
    );
  }
}

class TwoTileIconColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final Widget icon;

  const TwoTileIconColumn(
      {Key key, @required this.top, @required this.bottom, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        10.hBox(),
        Row(
          children: <Widget>[
            icon,
            10.wBox(),
            bottom,
          ],
        ),
      ],
    );
  }
}
