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
import 'package:velocity_x/src/responsive_ui.dart';

import 'flutter/text.dart';

class VelocityXExtensions {}

/// Extension Methods & Widgets for the strings

extension StringExtension on String {
  ///Returns first letter of the string as Caps eg -> Flutter
  String firstLetterUpperCase() => length > 1
      ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
      : this;

  ///Removes first element
  String get eliminateFirst => "${substring(1, length)}";

  /// Return a bool if the string is null or empty
  bool get isEmptyOrNull => this == null || isEmpty;

  bool validateEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  /// Returns the string if it is not `null`, or the empty string otherwise
  String get orEmpty => this ?? "";

// if the string is empty perform an action
  String ifEmpty(Function action) => isEmpty ? action() : this;

  /// Returns a String without white space at all
  /// "hello world" // helloworld
  String removeAllWhiteSpace() => replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns true if s is neither null, empty nor is solely made of whitespace characters.
  bool get isNotBlank => this != null && trim().isNotEmpty;

  /// Get Text Widget for the String
  VelocityXTextBuilder get text => VelocityXTextBuilder(this);
}

/// Extension Methods & Widgets for the numbers
extension NumExtension on num {
  String toDoubleStringAsFixed({int digit = 2}) =>
      toStringAsFixed(truncateToDouble() == this ? 0 : digit);

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
  Widget get wBox => SizedBox(
        width: toDouble(),
      );
  Widget get hBox => SizedBox(
        height: toDouble(),
      );
}

extension ContextExtensions on BuildContext {
  /// Extension for getting textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  MaterialResponsiveUiData get mdResponsive =>
      MaterialResponsiveUiData.of(this);

  /// Extension for getting NavigatorSatte
  NavigatorState get nav => Navigator.of(this);

  /// Screen Sizes Extensions for responsive UI
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
}
