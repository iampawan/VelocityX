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

import 'package:velocity_x/src/dart/language.dart';

/// Date Time Extension Methods
extension VxDateTimeExtension on DateTime {
  ///
  ///Helps in converting the [DateTime] to readable Time Ago format of String.
  ///
  String timeAgo(
      {DateTime? clock, bool? enableFromNow, bool useShortForm = false}) {
    final mIsFromNowEnabled = enableFromNow ?? false;
    final mLanguage = English(shortForm: useShortForm);
    final mClock = clock ?? DateTime.now();
    var deltaTime = mClock.millisecondsSinceEpoch - millisecondsSinceEpoch;

    String pfx, sfx;

    if (mIsFromNowEnabled && deltaTime < 0) {
      deltaTime = isBefore(mClock) ? deltaTime : deltaTime.abs();
      pfx = mLanguage.prefixFromNow();
      sfx = mLanguage.suffixFromNow();
    } else {
      pfx = mLanguage.prefixAgo();
      sfx = mLanguage.suffixAgo();
    }

    final num seconds = deltaTime / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;
    final num years = days / 365;

    String res;
    if (seconds < 45) {
      res = mLanguage.lessThanOneMinute(seconds.round());
    } else if (seconds < 90) {
      res = mLanguage.aboutAMinute(minutes.round());
    } else if (minutes < 45) {
      res = mLanguage.minutes(minutes.round());
    } else if (minutes < 90) {
      res = mLanguage.aboutAnHour(minutes.round());
    } else if (hours < 24) {
      res = mLanguage.hours(hours.round());
    } else if (hours < 48) {
      res = mLanguage.aDay(hours.round());
    } else if (days < 30) {
      res = mLanguage.days(days.round());
    } else if (days < 60) {
      res = mLanguage.aboutAMonth(days.round());
    } else if (days < 365) {
      res = mLanguage.months(months.round());
    } else if (years < 2) {
      res = mLanguage.aboutAYear(months.round());
    } else {
      res = mLanguage.years(years.round());
    }
    return [pfx, res, sfx]
        .where((s) => s.isNotEmpty)
        .join(mLanguage.delimiter());
  }
}

extension VxHumanizedDuration on Duration {
  String toHumanizedString() {
    final seconds = '${inSeconds % 60}'.padLeft(2, '0');
    String minutes = '${inMinutes % 60}';
    if (inHours > 0 || inMinutes == 0) {
      minutes = minutes.padLeft(2, '0');
    }
    String value = '$minutes:$seconds';
    if (inHours > 0) {
      value = '$inHours:$minutes:$seconds';
    }
    return value;
  }
}
