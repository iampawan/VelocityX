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
import 'package:velocity_x/src/flutter/selectable_text.dart';
import 'package:velocity_x/src/responsive_ui.dart';
import 'package:velocity_x/velocity_x.dart';

import 'flutter/text.dart';

class VelocityXExtensions {}

/// Extension Methods & Widgets for the strings

extension StringExtension on String {
  ///Returns first letter of the string as Caps eg -> Flutter
  String firstLetterUpperCase() => length > 1 ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}" : this;

  ///Removes first element
  String get eliminateFirst => "${substring(1, length)}";

  /// Return a bool if the string is null or empty
  bool get isEmptyOrNull => this == null || isEmpty;

  bool validateEmail() => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  /// Returns the string if it is not `null`, or the empty string otherwise
  String get orEmpty => this ?? "";

// if the string is empty perform an action
  String ifEmpty(Function action) => isEmpty ? action() : this;

  /// Returns a String without white space at all
  /// "hello world" // helloworld
  String removeAllWhiteSpace() => replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns true if s is neither null, empty nor is solely made of whitespace characters.
  bool get isNotBlank => this != null && trim().isNotEmpty;

  ///
  /// Replaces chars of the given String [s] with [replace].
  ///
  /// The default value of [replace] is *.
  /// [begin] determines the start of the 'replacing'. If [begin] is null, it starts from index 0.
  /// [end] defines the end of the 'replacing'. If [end] is null, it ends at [s] length divided by 2.
  /// If [s] is empty or consists of only 1 char, the method returns null.
  ///
  /// Example :
  /// 1234567890 => *****67890
  /// 1234567890 with begin 2 and end 6 => 12****7890
  /// 1234567890 with begin 1 => 1****67890
  ///
  String hidePartial({int begin = 0, int end, String replace = '*'}) {
    final buffer = StringBuffer();
    if (length <= 1) {
      return null;
    }
    if (end == null) {
      end = (length / 2).round();
    } else {
      if (end > length) {
        end = length;
      }
    }
    for (var i = 0; i < length; i++) {
      if (i >= end) {
        buffer.write(String.fromCharCode(runes.elementAt(i)));
        continue;
      }
      if (i >= begin) {
        buffer.write(replace);
        continue;
      }
      buffer.write(String.fromCharCode(runes.elementAt(i)));
    }
    return buffer.toString();
  }

  ///Capitalize all words inside a string
  String allWordsCapitilize() {
    return toLowerCase().split(' ').map((word) {
      final String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  /// Get Text Widget for the String
  VelocityXTextBuilder get text => VelocityXTextBuilder(this);

  /// Get SelectableText Widget for the String
  VelocityXSelectableTextBuilder get selectableText => VelocityXSelectableTextBuilder(this);
}

/// Extension Methods & Widgets for the numbers
extension NumExtension on num {
  String toDoubleStringAsFixed({int digit = 2}) => toStringAsFixed(truncateToDouble() == this ? 0 : digit);

  bool get isNull => this == null;
  bool get isNotNull => this != null;

  /// Returns number of digits in this number
  int get numberOfDigits => toString().length;

  /// Returns if the number is even
  bool get isEven => this % 2 == 0;

  /// Returns if the number is odd
  bool get isOdd => this % 2 != 0;

  /// Returns if the number is positive
  bool get isPositive => this > 0;

  /// Returns if the number is negative
  bool get isNegative => this < 0;

  ///Widgets
  Widget get widthBox => SizedBox(
        width: toDouble(),
      );
  Widget get heightBox => SizedBox(
        height: toDouble(),
      );

  Widget get squareBox => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );

  /// Get Text Widget for the String
  VelocityXTextBuilder get text => VelocityXTextBuilder(toString());
}

extension ListWidgetExtension on List<Widget> {
  Widget vStack({Key key, MainAxisAlignment alignment, CrossAxisAlignment crossAlignment, MainAxisSize axisSize}) => VStack(
        this,
        key: key,
        alignment: alignment,
        axisSize: axisSize,
        crossAlignment: crossAlignment,
      );
  Widget hStack({Key key, MainAxisAlignment alignment, CrossAxisAlignment crossAlignment, MainAxisSize axisSize}) => HStack(
        this,
        key: key,
        alignment: alignment,
        axisSize: axisSize,
        crossAlignment: crossAlignment,
      );
  Widget zStack({Key key, AlignmentGeometry alignment, StackFit fit, Overflow overflow}) => ZStack(
        this,
        key: key,
        alignment: alignment,
        fit: fit,
        overflow: overflow,
      );
}

extension ListStringExtension on List<String> {
  Widget discList({
    Key key,
    Color color = Colors.black,
    double fontSize,
    EdgeInsetsGeometry padding,
  }) =>
      VelocityDiscList(
        this,
        key: key,
        padding: padding,
        fontSize: fontSize,
        color: color,
      );

  Widget decimalList({
    Key key,
    Color color = Colors.black,
    double fontSize,
    EdgeInsetsGeometry padding,
  }) =>
      VelocityDecimalList(
        this,
        key: key,
        padding: padding,
        fontSize: fontSize,
        color: color,
      );
}

extension ContextExtensions on BuildContext {
  MaterialResponsiveUiData get _mdResponsive => MaterialResponsiveUiData.of(this);

  /// Screen Sizes Extensions for responsive UI
  int get mdColumns => _mdResponsive.columns;
  double get mdGutter => _mdResponsive.gutter;
  MobileDeviceType get mdDeviceType => _mdResponsive.deviceInfo.deviceType;
  MobileDeviceSize get mdDeviceSize => _mdResponsive.deviceInfo.deviceSize;
  MobileWindowSize get mdWindowSize => _mdResponsive.windowSize;

  MediaQueryData get mq => MediaQuery.of(this);
  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;
  double get percentWidth => screenWidth / 100;
  double get percentHeight => screenHeight / 100;
  double get _safeAreaHorizontal => mq.padding.left + mq.padding.right;
  double get _safeAreaVertical => mq.padding.top + mq.padding.bottom;
  double get safePercentWidth => (screenWidth - _safeAreaHorizontal) / 100;
  double get safePercentHeight => (screenHeight - _safeAreaVertical) / 100;

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Extension for getting NavigatorSatte
  NavigatorState get nav => Navigator.of(this);

  /// Extension for getting textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;
}
