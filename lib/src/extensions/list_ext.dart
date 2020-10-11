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
import 'package:velocity_x/src/flutter/flex.dart';
import 'package:velocity_x/src/flutter/list.dart';
import 'package:velocity_x/src/flutter/swiper.dart';

extension ListWidgetExtension on List<Widget> {
  Widget vStack(
          {Key key,
          MainAxisAlignment alignment,
          CrossAxisAlignment crossAlignment,
          MainAxisSize axisSize}) =>
      VStack(
        this,
        key: key,
        alignment: alignment,
        axisSize: axisSize,
        crossAlignment: crossAlignment,
      );
  Widget hStack(
          {Key key,
          MainAxisAlignment alignment,
          CrossAxisAlignment crossAlignment,
          MainAxisSize axisSize}) =>
      HStack(
        this,
        key: key,
        alignment: alignment,
        axisSize: axisSize,
        crossAlignment: crossAlignment,
      );
  Widget zStack(
          {Key key, AlignmentGeometry alignment, StackFit fit, Clip clip}) =>
      ZStack(
        this,
        key: key,
        alignment: alignment,
        fit: fit,
        clip: clip,
      );

  /// Same as [hStack]. Added just for ease who are familiar with Flutter widgets.
  Widget row(
          {Key key,
          MainAxisAlignment alignment,
          CrossAxisAlignment crossAlignment,
          MainAxisSize axisSize}) =>
      hStack(
          key: key,
          alignment: alignment,
          axisSize: axisSize,
          crossAlignment: crossAlignment);

  /// Same as [vStack]. Added just for ease who are familiar with Flutter widgets.
  Widget column(
          {Key key,
          MainAxisAlignment alignment,
          CrossAxisAlignment crossAlignment,
          MainAxisSize axisSize}) =>
      vStack(
          key: key,
          alignment: alignment,
          axisSize: axisSize,
          crossAlignment: crossAlignment);

  /// Same as [zStack]. Added just for ease who are familiar with Flutter widgets.
  Widget stack(
          {Key key, AlignmentGeometry alignment, StackFit fit, Clip clip}) =>
      ZStack(
        this,
        key: key,
        alignment: alignment,
        fit: fit,
        clip: clip,
      );

  Widget vSwiper({
    Key key,
    double height,
    double aspectRatio = 16 / 9,
    bool enableInfiniteScroll = true,
    bool enlargeCenterPage = false,
    Function(int index) onPageChanged,
    ScrollPhysics scrollPhysics,
    Axis scrollDirection = Axis.vertical,
  }) =>
      VxSwiper(
        items: this,
        height: height,
        aspectRatio: aspectRatio,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        onPageChanged: onPageChanged,
        scrollPhysics: scrollPhysics,
        scrollDirection: scrollDirection,
      );

  Widget swiper({
    Key key,
    double height,
    double aspectRatio = 16 / 9,
    bool enableInfiniteScroll = true,
    bool enlargeCenterPage = false,
    Function(int index) onPageChanged,
    ScrollPhysics scrollPhysics,
    Axis scrollDirection = Axis.horizontal,
  }) =>
      VxSwiper(
        items: this,
        height: height,
        aspectRatio: aspectRatio,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        onPageChanged: onPageChanged,
        scrollPhysics: scrollPhysics,
        scrollDirection: scrollDirection,
      );
}

extension ListStringExtension on List<String> {
  Widget discList({
    Key key,
    Color color = Colors.black,
    double fontSize,
    EdgeInsetsGeometry padding,
    ScrollPhysics physics,
    bool primary,
    bool shrinkWrap = true,
  }) =>
      VxDiscList(
        this,
        key: key,
        padding: padding,
        fontSize: fontSize,
        color: color,
        physics: physics,
        primary: primary,
        shrinkWrap: shrinkWrap,
      );

  Widget decimalList({
    Key key,
    Color color = Colors.black,
    double fontSize,
    EdgeInsetsGeometry padding,
    ScrollPhysics physics,
    bool primary,
    bool shrinkWrap = true,
  }) =>
      VxDecimalList(
        this,
        key: key,
        padding: padding,
        fontSize: fontSize,
        color: color,
        physics: physics,
        primary: primary,
        shrinkWrap: shrinkWrap,
      );
}
