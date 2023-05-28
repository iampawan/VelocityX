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

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/flutter/flex.dart';
import 'package:velocity_x/src/flutter/list.dart';
import 'package:velocity_x/src/flutter/swiper.dart';

/// Extension Methods for List of widgets.
extension VxListWidgetExtension on List<Widget> {
  ///
  /// Extension for using [VStack] directly with list of widgets
  ///
  Widget vStack(
          {Key? key,
          MainAxisAlignment? alignment,
          CrossAxisAlignment? crossAlignment,
          MainAxisSize? axisSize}) =>
      VStack(
        this,
        key: key,
        alignment: alignment,
        axisSize: axisSize,
        crossAlignment: crossAlignment,
      );

  ///
  /// Extension for using [HStack] directly with list of widgets
  ///
  Widget hStack(
          {Key? key,
          MainAxisAlignment? alignment,
          CrossAxisAlignment? crossAlignment,
          MainAxisSize? axisSize}) =>
      HStack(
        this,
        key: key,
        alignment: alignment,
        axisSize: axisSize,
        crossAlignment: crossAlignment,
      );

  ///
  /// Extension for using [ZStack] directly with list of widgets
  ///
  Widget zStack(
          {Key? key,
          AlignmentGeometry? alignment,
          StackFit? fit,
          Clip? clip}) =>
      ZStack(
        this,
        key: key,
        alignment: alignment,
        fit: fit,
        clip: clip,
      );

  //
  /// Extension for using [OverflowBar] directly with list of widgets
  ///
  Widget aStack(
          {Key? key,
          Clip clipBehavior = Clip.none,
          OverflowBarAlignment overflowAlignment = OverflowBarAlignment.start,
          VerticalDirection overflowDirection = VerticalDirection.down,
          double overflowSpacing = 0.0,
          double spacing = 0.0,
          TextDirection? textDirection}) =>
      AStack(
        key: key,
        clipBehavior: clipBehavior,
        overflowAlignment: overflowAlignment,
        overflowDirection: overflowDirection,
        overflowSpacing: overflowSpacing,
        spacing: spacing,
        textDirection: textDirection,
        children: this,
      );

  /// Same as [hStack]. Added just for ease who are familiar with Flutter widgets.
  Widget row(
          {Key? key,
          MainAxisAlignment? alignment,
          CrossAxisAlignment? crossAlignment,
          MainAxisSize? axisSize}) =>
      hStack(
          key: key,
          alignment: alignment,
          axisSize: axisSize,
          crossAlignment: crossAlignment);

  /// Same as [vStack]. Added just for ease who are familiar with Flutter widgets.
  Widget column(
          {Key? key,
          MainAxisAlignment? alignment,
          CrossAxisAlignment? crossAlignment,
          MainAxisSize? axisSize}) =>
      vStack(
          key: key,
          alignment: alignment,
          axisSize: axisSize,
          crossAlignment: crossAlignment);

  /// Same as [zStack]. Added just for ease who are familiar with Flutter widgets.
  Widget stack(
          {Key? key,
          AlignmentGeometry? alignment,
          StackFit? fit,
          Clip? clip}) =>
      ZStack(
        this,
        key: key,
        alignment: alignment,
        fit: fit,
        clip: clip,
      );

  ///
  /// Extension for using [VxSwiper] vertically directly with list of widgets
  ///
  Widget vSwiper({
    Key? key,
    double? height,
    double aspectRatio = 16 / 9,
    bool enableInfiniteScroll = true,
    bool enlargeCenterPage = false,
    Function(int index)? onPageChanged,
    ScrollPhysics? scrollPhysics,
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

  ///
  /// Extension for using [VxSwiper] directly with list of widgets
  ///
  Widget swiper(
          {Key? key,
          double? height,
          double aspectRatio = 16 / 9,
          bool enableInfiniteScroll = true,
          bool enlargeCenterPage = false,
          Function(int index)? onPageChanged,
          ScrollPhysics? scrollPhysics,
          Axis scrollDirection = Axis.horizontal,
          num viewportFraction = 0.8,
          bool autoPlay = false,
          bool reverse = false,
          Duration? pauseAutoPlayOnTouch,
          Duration autoPlayAnimationDuration =
              const Duration(milliseconds: 800),
          Duration autoPlayInterval = const Duration(seconds: 5),
          Curve autoPlayCurve = Curves.fastOutSlowIn,
          num initialPage = 0,
          int realPage = 10000,
          bool isFastScrollingEnabled = false}) =>
      VxSwiper(
        items: this,
        height: height,
        aspectRatio: aspectRatio,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        onPageChanged: onPageChanged,
        scrollPhysics: scrollPhysics,
        scrollDirection: scrollDirection,
        viewportFraction: viewportFraction,
        autoPlay: autoPlay,
        pauseAutoPlayOnTouch: pauseAutoPlayOnTouch,
        reverse: reverse,
        autoPlayAnimationDuration: autoPlayAnimationDuration,
        autoPlayCurve: autoPlayCurve,
        autoPlayInterval: autoPlayInterval,
        initialPage: initialPage,
        realPage: realPage,
        isFastScrollingEnabled: isFastScrollingEnabled,
      );
}

extension VxListStringExtension on List<String> {
  ///
  /// Extension for using [VxUnorderedList] directly with list of strings.
  ///
  Widget unorderedList({
    Key? key,
    Color color = Colors.black,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool? primary,
    bool shrinkWrap = true,
  }) =>
      VxUnorderedList(
        this,
        key: key,
        padding: padding,
        fontSize: fontSize,
        color: color,
        physics: physics,
        primary: primary,
        shrinkWrap: shrinkWrap,
      );

  ///
  /// Extension for using [VxOrderedList] directly with list of strings.
  ///
  Widget orderedList({
    Key? key,
    Color color = Colors.black,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool? primary,
    bool shrinkWrap = true,
    VxListType type = VxListType.decimal,
  }) =>
      VxOrderedList(
        this,
        key: key,
        padding: padding,
        fontSize: fontSize,
        color: color,
        physics: physics,
        primary: primary,
        shrinkWrap: shrinkWrap,
        type: type,
      );
}

extension ExtensionUint8List on Uint8List {
  List<int> bit32ListFromUInt8List() {
    final Uint8List bytes = this;
    final int additionalLength = bytes.length % 4 > 0 ? 4 : 0;
    final List<int> result =
        (bytes.length ~/ 4 + additionalLength).generate((_) => 0);
    for (int i = 0; i < bytes.length; i++) {
      final int resultIdx = i ~/ 4;
      final int bitShiftAmount = (3 - i % 4).toInt();
      result[resultIdx] |= bytes[i] << bitShiftAmount;
    }
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i] << 24;
    }
    return result;
  }
}

extension ExtensionListUnsafe on List? {
  /// null or Empty returns true
  bool checkNullOrEmpty() => this == null || this!.isEmpty;
}

extension VxExtensionList<T> on List<T> {
  String? get base64Encode {
    if (T != int) {
      return null;
    }
    return base64.encode(this as List<int>);
  }

  String? get utf8Decode {
    if (T != int) {
      return null;
    }
    return utf8.decode(this as List<int>);
  }

  Uint8List? get uInt8ListFrom32BitList {
    if (T != int) {
      return null;
    }
    final List<int> bit32 = this as List<int>;
    final Uint8List result = Uint8List(bit32.length * 4);
    for (int i = 0; i < bit32.length; i++) {
      for (int j = 0; j < 4; j++) {
        result[i * 4 + j] = bit32[i] >> (j * 8);
      }
    }
    return result;
  }

  /// List<int> toUtf8
  String? get toUtf8 {
    if (T != int) {
      return null;
    }
    final List<int?> words = this as List<int>;
    final int sigBytes = words.length;
    final List<int> chars = sigBytes.generate((int i) {
      if (words[i >> 2] == null) {
        words[i >> 2] = 0;
      }
      final int bite =
          ((words[i >> 2]!).toSigned(32) >> (24 - (i % 4) * 8)) & 0xff;
      return bite;
    });
    return String.fromCharCodes(chars);
  }

  /// list.map.toList()
  List<E> builder<E>(E Function(T) builder) =>
      map<E>((T e) => builder(e)).toList();

  List<E> generate<E>(E Function(int index) generator,
          {bool growable = true}) =>
      length.generate<E>((int index) => generator(index), growable: growable);

  /// list.asMap().entries.map.toList()
  List<E> builderEntry<E>(E Function(MapEntry<int, T>) builder) =>
      asMap().entries.map((MapEntry<int, T> entry) => builder(entry)).toList();

  /// Adds child elements and returns a new array
  List<T> addT(T value, {bool isAdd = true}) {
    if (isAdd) {
      add(value);
    }
    return this;
  }

  /// Adds an array and returns the new array
  List<T> addAllT(List<T> iterable, {bool isAdd = true}) {
    if (isAdd) {
      addAll(iterable);
    }
    return this;
  }

  /// Insert child elements and return new array
  List<T> insertT(int index, T value, {bool isInsert = true}) {
    if (isInsert) {
      insert(index, value);
    }
    return this;
  }

  /// Insert the array and return the new array
  List<T> insertAllT(int index, List<T> iterable, {bool isInsert = true}) {
    if (isInsert) {
      insertAll(index, iterable);
    }
    return this;
  }

  /// Replace the specified area and return a new array
  List<T> replaceRangeT(int start, int end, Iterable<T> replacement,
      {bool isReplace = true}) {
    if (isReplace) {
      replaceRange(start, end, replacement);
    }
    return this;
  }
}
