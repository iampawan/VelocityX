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
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/src/flutter/rich_text.dart';
import 'package:velocity_x/src/flutter/selectable_text.dart';
import 'package:velocity_x/src/flutter/text.dart';

/// Extension Methods & Widgets for the strings
extension VxStringExtension on String {
  ///Returns first letter of the string as Caps eg -> Flutter
  String firstLetterUpperCase() => length > 1
      ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
      : this;

  ///Removes first element
  String get eliminateFirst => length > 1 ? "${substring(1, length)}" : "";

  ///Removes last element
  String get eliminateLast => length > 1 ? "${substring(0, length - 1)}" : "";

  /// Return a bool if the string is null or empty
  bool get isEmpty => trimLeft().isEmpty;

  ///
  /// Uses regex to check if the provided string is a valid email address or not
  ///
  bool validateEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  /// Check if String is Right to Left Language
  bool isRtlLanguage() {
    final _rtlLocaleRegex = RegExp(
        r'^(ar|dv|he|iw|fa|nqo|ps|sd|ug|ur|yi|.*[-_]'
        r'(Arab|Hebr|Thaa|Nkoo|Tfng))(?!.*[-_](Latn|Cyrl)($|-|_))'
        r'($|-|_)',
        caseSensitive: false);

    final bool _rtlCheck = _rtlLocaleRegex.hasMatch(this);

    return _rtlCheck;
  }

  /// Returns the string if it is not `null`, or the empty string otherwise
  String get orEmpty => this;

// if the string is empty perform an action
  String ifEmpty(Function action) => isEmpty ? action() : this;

  /// Returns a String without white space at all
  /// "hello world" // helloworld
  String removeAllWhiteSpace() => replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns true if s is neither null, empty nor is solely made of whitespace characters.
  bool get isNotBlank => trim().isNotEmpty;

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
  String? hidePartial({int begin = 0, int? end, String replace = '*'}) {
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

  /// Format numeric currency
  String get numCurrency =>
      intl.NumberFormat.currency(customPattern: "#,##0.00")
          .format(double.tryParse(this))
          .toString();

  /// Format numeric currency with provided locale
  String numCurrencyWithLocale({String locale = "en_US"}) =>
      intl.NumberFormat.currency(
        locale: locale,
      ).format(double.tryParse(this)).toString();

  ///Capitalize all words inside a string
  String allWordsCapitilize() {
    return toLowerCase().split(' ').map((word) {
      final String leftText =
          (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  /// Returns a value according to the contract for [Comparator] indicating
  /// the ordering between [this] and [other], ignoring letter case.
  ///
  /// Example:
  /// ```dart
  /// 'ABC'.compareToIgnoringCase('abd'); // negative value
  /// 'ABC'.compareToIgnoringCase('abc'); // zero
  /// 'ABC'.compareToIgnoringCase('abb'); // positive value
  /// ```
  ///
  /// NOTE: This implementation relies on [String].`toLowerCase`, which is not
  /// locale aware. Therefore, this method is likely to exhibit unexpected
  /// behavior for non-ASCII characters.
  int compareToIgnoringCase(String other) =>
      toLowerCase().compareTo(other.toLowerCase());

  /// Returns a copy of [this] with [other] inserted starting at [index].
  ///
  /// Example:
  /// ```dart
  /// 'word'.insert('s', 0); // 'sword'
  /// 'word'.insert('ke', 3); // 'worked'
  /// 'word'.insert('y', 4); // 'wordy'
  /// ```
  String insert(String other, int index) => (StringBuffer()
        ..write(substring(0, index))
        ..write(other)
        ..write(substring(index)))
      .toString();

  /// Returns the concatenation of [other] and [this].
  ///
  /// Example:
  /// ```dart
  /// 'word'.prepend('key'); // 'keyword'
  /// ```
  String prepend(String other) => other + this;

  /// Returns [this] with characters in reverse order.
  ///
  /// Example:
  /// ```dart
  /// 'word'.reverse(); // 'drow'
  /// ```
  ///
  /// WARNING: This is the naive-est possible implementation, relying on native
  /// string indexing. Therefore, this method is almost guaranteed to exhibit
  /// unexpected behavior for non-ASCII characters.
  String reverse() {
    final stringBuffer = StringBuffer();
    for (var i = length - 1; i >= 0; i--) {
      stringBuffer.write(this[i]);
    }
    return stringBuffer.toString();
  }

  /// Checks the validity of the credit/debit card number using the Luhn algorithm.
  bool isCreditCardValid() {
    int _sum = 0;
    bool _alternate = false;

    for (int i = length - 1; i >= 0; i--) {
      int digit = int.parse(this[i]);

      if (_alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      _sum += digit;

      _alternate = !_alternate;
    }

    return _sum % 10 == 0;
  }

  bool isNumber() {
    final isMatch = RegExp("[1-9]").hasMatch(this);
    return isMatch;
  }

  bool isLetter() {
    final isMatch = RegExp("[A-Za-z]").hasMatch(this);
    return isMatch;
  }

  bool isSymbol() {
    const String pattern =
        "[`~!@#\$%^&*()_\-+=<>?:\"{}|,.//\/;'\\[\]·~！@#￥%……&*（）——\-+={}|《》？：“”【】、；‘’，。、]";
    for (int i = 0; i < length; i++) {
      if (pattern.contains(this[i])) {
        return true;
      }
    }
    return false;
  }

  /// Check if string is json decodable
  bool get isJsonDecodable {
    try {
      jsonDecode(this) as Map<String, dynamic>;
      // ignore: unused_catch_clause
    } on FormatException catch (e) {
      return false;
    }

    return true;
  }

  // Remove non Alpha-Numeric characters from string
  String filterChars() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  /// Convert DateString to DateTime Object
  DateTime? toDate() {
    try {
      final DateTime st = DateTime.parse(this);
      return st;
      // ignore: unused_catch_clause
    } on FormatException catch (e) {
      return null;
    }
  }

  /// Converts [YYMMDD HH:MM] Date to a fully DateString representation,
  /// if you need to use locale, dont forget to use [initializeDateFormatting]
  /// in your main() function.
  ///
  /// **Example**
  ///
  /// **Input:** 2021-70-16
  ///
  /// **Output:** Friday, October 16
  String toDateString([String? locale]) {
    return intl.DateFormat.MMMMEEEEd(locale).format(toDate()!);
  }

  static final _camelCaseMatcher = RegExp('[A-Z][a-z]*');

  /// From 'foo_bar' to 'fooBar'
  String get lowerCamelCase {
    final out = StringBuffer();
    final parts = split('_');
    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      if (part.isNotEmpty)
        out.write(i == 0 ? part.toLowerCase() : part.capitalized);
    }
    return out.toString();
  }

  /// from 'foo_bar' to 'FooBar'
  String get upperCamelCase {
    final out = StringBuffer();
    final parts = split('_');
    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      if (part.isNotEmpty) {
        out.write(part.capitalized);
      }
    }
    return out.toString();
  }

  /// from 'foo' to 'Foo'
  String get capitalized => this[0].toUpperCase() + substring(1);

  /// from fooBar to foo_bar
  String get snakeCase => replaceAllMapped(_camelCaseMatcher,
      (match) => '${match.start == 0 ? '' : '_'}${match[0]!.toLowerCase()}');

  /// Get Text Widget for the String
  VxTextBuilder get text => VxTextBuilder(this);

  /// Get SelectableText Widget for the String
  VxSelectableTextBuilder get selectableText => VxSelectableTextBuilder(this);

  /// Get TextSpan for the String
  VelocityXTextSpan get textSpan => VelocityXTextSpan(this);

  /// Get RichText Widget for the String
  VxRichText get richText => VxRichText(this);
}

extension VxNullableStringIsEmptyOrNullExtension on String? {
  /// Returns `true` if the String is either null or empty.
  bool get isEmptyOrNull => this?.isEmpty ?? true;
}

extension VxNullableStringIsNotEmptyAndNotNullExtension on String? {
  bool get isNotEmptyAndNotNull => this != null && this!.isNotEmpty;
}
