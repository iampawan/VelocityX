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

import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Mixin [Vx] provides basic operations and utilities
mixin Vx {
  /// Pixel Values
  static const double dp0 = 0.0;
  static const double dp1 = 1.0;
  static const double dp2 = 2.0;
  static const double dp3 = 3.0;
  static const double dp4 = 4.0;
  static const double dp5 = 5.0;
  static const double dp6 = 6.0;
  static const double dp8 = 8.0;
  static const double dp10 = 10.0;
  static const double dp12 = 12.0;
  static const double dp14 = 14.0;
  static const double dp16 = 16.0;
  static const double dp20 = 20.0;
  static const double dp24 = 24.0;
  static const double dp32 = 32.0;
  static const double dp40 = 40.0;
  static const double dp48 = 48.0;
  static const double dp56 = 56.0;
  static const double dp64 = 64.0;

  ///Colors
  static const String blackHex = "#000000";
  static const String whiteHex = "#ffffff";

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  ///Gray Colors
  static const String grayHex100 = "#F7FAFC";
  static const String grayHex200 = "#EDF2F7";
  static const String grayHex300 = "#E2E8F0";
  static const String grayHex400 = "#CBD5E0";
  static const String grayHex500 = "#A0AEC0";
  static const String grayHex600 = "#718096";
  static const String grayHex700 = "#4A5568";
  static const String grayHex800 = "#2D3748";
  static const String grayHex900 = "#1A202C";

  static const Color gray100 = Color(0xFFF7FAFC);
  static const Color gray200 = Color(0xFFEDF2F7);
  static const Color gray300 = Color(0xFFE2E8F0);
  static const Color gray400 = Color(0xFFCBD5E0);
  static const Color gray500 = Color(0xFFA0AEC0);
  static const Color gray600 = Color(0xFF718096);
  static const Color gray700 = Color(0xFF4A5568);
  static const Color gray800 = Color(0xFF2D3748);
  static const Color gray900 = Color(0xFF1A202C);

  ///Red Colors
  static const String redHex100 = "#FFF5F5";
  static const String redHex200 = "#FED7D7";
  static const String redHex300 = "#FEB2B2";
  static const String redHex400 = "#FC8181";
  static const String redHex500 = "#F56565";
  static const String redHex600 = "#E53E3E";
  static const String redHex700 = "#C53030";
  static const String redHex800 = "#9B2C2C";
  static const String redHex900 = "#742A2A";

  static const Color red100 = Color(0xFFFFF5F5);
  static const Color red200 = Color(0xFFFED7D7);
  static const Color red300 = Color(0xFFFEB2B2);
  static const Color red400 = Color(0xFFFC8181);
  static const Color red500 = Color(0xFFF56565);
  static const Color red600 = Color(0xFFE53E3E);
  static const Color red700 = Color(0xFFC53030);
  static const Color red800 = Color(0xFF9B2C2C);
  static const Color red900 = Color(0xFF742A2A);

  ///Orange Colors
  static const String orangeHex100 = "#FFFAF0";
  static const String orangeHex200 = "#FEEBC8";
  static const String orangeHex300 = "#FBD38D";
  static const String orangeHex400 = "#F6AD55";
  static const String orangeHex500 = "#ED8936";
  static const String orangeHex600 = "#DD6B20";
  static const String orangeHex700 = "#C05621";
  static const String orangeHex800 = "#9C4221";
  static const String orangeHex900 = "#7B341E";

  static const Color orange100 = Color(0xFFFFFAF0);
  static const Color orange200 = Color(0xFFFEEBC8);
  static const Color orange300 = Color(0xFFFBD38D);
  static const Color orange400 = Color(0xFFF6AD55);
  static const Color orange500 = Color(0xFFED8936);
  static const Color orange600 = Color(0xFFDD6B20);
  static const Color orange700 = Color(0xFFC05621);
  static const Color orange800 = Color(0xFF9C4221);
  static const Color orange900 = Color(0xFF7B341E);

  ///Yellow Colors
  static const String yellowHex100 = "#FFFFF0";
  static const String yellowHex200 = "#FEFCBF";
  static const String yellowHex300 = "#FAF089";
  static const String yellowHex400 = "#F6E05E";
  static const String yellowHex500 = "#ECC94B";
  static const String yellowHex600 = "#D69E2E";
  static const String yellowHex700 = "#B7791F";
  static const String yellowHex800 = "#975A16";
  static const String yellowHex900 = "#744210";

  static const Color yellow100 = Color(0xFFFFFFF0);
  static const Color yellow200 = Color(0xFFFEFCBF);
  static const Color yellow300 = Color(0xFFFAF089);
  static const Color yellow400 = Color(0xFFF6E05E);
  static const Color yellow500 = Color(0xFFECC94B);
  static const Color yellow600 = Color(0xFFD69E2E);
  static const Color yellow700 = Color(0xFFB7791F);
  static const Color yellow800 = Color(0xFF975A16);
  static const Color yellow900 = Color(0xFF744210);

  ///Green Colors
  static const String greenHex100 = "#F0FFF4";
  static const String greenHex200 = "#C6F6D5";
  static const String greenHex300 = "#9AE6B4";
  static const String greenHex400 = "#68D391";
  static const String greenHex500 = "#48BB78";
  static const String greenHex600 = "#38A169";
  static const String greenHex700 = "#2F855A";
  static const String greenHex800 = "#276749";
  static const String greenHex900 = "#22543D";

  static const Color green100 = Color(0xFFF0FFF4);
  static const Color green200 = Color(0xFFC6F6D5);
  static const Color green300 = Color(0xFF9AE6B4);
  static const Color green400 = Color(0xFF68D391);
  static const Color green500 = Color(0xFF48BB78);
  static const Color green600 = Color(0xFF38A169);
  static const Color green700 = Color(0xFF2F855A);
  static const Color green800 = Color(0xFF276749);
  static const Color green900 = Color(0xFF22543D);

  ///Teal Colors
  static const String tealHex100 = "#E6FFFA";
  static const String tealHex200 = "#B2F5EA";
  static const String tealHex300 = "#81E6D9";
  static const String tealHex400 = "#4FD1C5";
  static const String tealHex500 = "#38B2AC";
  static const String tealHex600 = "#319795";
  static const String tealHex700 = "#2C7A7B";
  static const String tealHex800 = "#285E61";
  static const String tealHex900 = "#234E52";

  static const Color teal100 = Color(0xFFE6FFFA);
  static const Color teal200 = Color(0xFFB2F5EA);
  static const Color teal300 = Color(0xFF81E6D9);
  static const Color teal400 = Color(0xFF4FD1C5);
  static const Color teal500 = Color(0xFF38B2AC);
  static const Color teal600 = Color(0xFF319795);
  static const Color teal700 = Color(0xFF2C7A7B);
  static const Color teal800 = Color(0xFF285E61);
  static const Color teal900 = Color(0xFF234E52);

  ///Blue Colors
  static const String blueHex100 = "#EBF8FF";
  static const String blueHex200 = "#BEE3F8";
  static const String blueHex300 = "#90CDF4";
  static const String blueHex400 = "#63B3ED";
  static const String blueHex500 = "#4299E1";
  static const String blueHex600 = "#3182CE";
  static const String blueHex700 = "#2B6CB0";
  static const String blueHex800 = "#2C5282";
  static const String blueHex900 = "#2A4365";

  static const Color blue100 = Color(0xFFEBF8FF);
  static const Color blue200 = Color(0xFFBEE3F8);
  static const Color blue300 = Color(0xFF90CDF4);
  static const Color blue400 = Color(0xFF63B3ED);
  static const Color blue500 = Color(0xFF4299E1);
  static const Color blue600 = Color(0xFF3182CE);
  static const Color blue700 = Color(0xFF2B6CB0);
  static const Color blue800 = Color(0xFF2C5282);
  static const Color blue900 = Color(0xFF2A4365);

  ///Indigo Colors
  static const String indigoHex100 = "#EBF4FF";
  static const String indigoHex200 = "#C3DAFE";
  static const String indigoHex300 = "#A3BFFA";
  static const String indigoHex400 = "#7F9CF5";
  static const String indigoHex500 = "#667EEA";
  static const String indigoHex600 = "#5A67D8";
  static const String indigoHex700 = "#4C51BF";
  static const String indigoHex800 = "#434190";
  static const String indigoHex900 = "#3C366B";

  static const Color indigo100 = Color(0xFFEBF4FF);
  static const Color indigo200 = Color(0xFFC3DAFE);
  static const Color indigo300 = Color(0xFFA3BFFA);
  static const Color indigo400 = Color(0xFF7F9CF5);
  static const Color indigo500 = Color(0xFF667EEA);
  static const Color indigo600 = Color(0xFF5A67D8);
  static const Color indigo700 = Color(0xFF4C51BF);
  static const Color indigo800 = Color(0xFF434190);
  static const Color indigo900 = Color(0xFF3C366B);

  ///Purple Colors
  static const String purpleHex100 = "#FAF5FF";
  static const String purpleHex200 = "#E9D8FD";
  static const String purpleHex300 = "#D6BCFA";
  static const String purpleHex400 = "#B794F4";
  static const String purpleHex500 = "#9F7AEA";
  static const String purpleHex600 = "#805AD5";
  static const String purpleHex700 = "#6B46C1";
  static const String purpleHex800 = "#553C9A";
  static const String purpleHex900 = "#44337A";

  static const Color purple100 = Color(0xFFFAF5FF);
  static const Color purple200 = Color(0xFFE9D8FD);
  static const Color purple300 = Color(0xFFD6BCFA);
  static const Color purple400 = Color(0xFFB794F4);
  static const Color purple500 = Color(0xFF9F7AEA);
  static const Color purple600 = Color(0xFF805AD5);
  static const Color purple700 = Color(0xFF6B46C1);
  static const Color purple800 = Color(0xFF553C9A);
  static const Color purple900 = Color(0xFF44337A);

  ///Pink Colors
  static const String pinkHex100 = "#FFF5F7";
  static const String pinkHex200 = "#FED7E2";
  static const String pinkHex300 = "#FBB6CE";
  static const String pinkHex400 = "#F687B3";
  static const String pinkHex500 = "#ED64A6";
  static const String pinkHex600 = "#D53F8C";
  static const String pinkHex700 = "#B83280";
  static const String pinkHex800 = "#97266D";
  static const String pinkHex900 = "#702459";

  static const Color pink100 = Color(0xFFFFF5F7);
  static const Color pink200 = Color(0xFFFED7E2);
  static const Color pink300 = Color(0xFFFBB6CE);
  static const Color pink400 = Color(0xFFF687B3);
  static const Color pink500 = Color(0xFFED64A6);
  static const Color pink600 = Color(0xFFD53F8C);
  static const Color pink700 = Color(0xFFB83280);
  static const Color pink800 = Color(0xFF97266D);
  static const Color pink900 = Color(0xFF702459);

  /// All Fixed EdgeInsets
  static EdgeInsets m0 = const EdgeInsets.all(dp0);
  static EdgeInsets m1 = const EdgeInsets.all(dp1);
  static EdgeInsets m2 = const EdgeInsets.all(dp2);
  static EdgeInsets m4 = const EdgeInsets.all(dp4);
  static EdgeInsets m8 = const EdgeInsets.all(dp8);
  static EdgeInsets m12 = const EdgeInsets.all(dp12);
  static EdgeInsets m16 = const EdgeInsets.all(dp16);
  static EdgeInsets m20 = const EdgeInsets.all(dp20);
  static EdgeInsets m24 = const EdgeInsets.all(dp24);
  static EdgeInsets m32 = const EdgeInsets.all(dp32);
  static EdgeInsets m64 = const EdgeInsets.all(dp64);

  /// Symmetric Fixed EdgeInsets
  static const mV0 = EdgeInsets.symmetric(vertical: dp0);
  static const mH0 = EdgeInsets.symmetric(horizontal: dp0);
  static const mV1 = EdgeInsets.symmetric(vertical: dp1);
  static const mH1 = EdgeInsets.symmetric(horizontal: dp1);
  static const mV2 = EdgeInsets.symmetric(vertical: dp2);
  static const mH2 = EdgeInsets.symmetric(horizontal: dp2);
  static const mV4 = EdgeInsets.symmetric(vertical: dp4);
  static const mH4 = EdgeInsets.symmetric(horizontal: dp4);
  static const mV8 = EdgeInsets.symmetric(vertical: dp8);
  static const mH8 = EdgeInsets.symmetric(horizontal: dp8);
  static const mH12 = EdgeInsets.symmetric(horizontal: dp12);
  static const mV12 = EdgeInsets.symmetric(vertical: dp12);
  static const mV16 = EdgeInsets.symmetric(vertical: dp16);
  static const mH16 = EdgeInsets.symmetric(horizontal: dp16);
  static const mV20 = EdgeInsets.symmetric(vertical: dp20);
  static const mH20 = EdgeInsets.symmetric(horizontal: dp20);
  static const mV24 = EdgeInsets.symmetric(vertical: dp24);
  static const mH24 = EdgeInsets.symmetric(horizontal: dp24);
  static const mV32 = EdgeInsets.symmetric(vertical: dp24);
  static const mH32 = EdgeInsets.symmetric(horizontal: dp32);
  static const mV64 = EdgeInsets.symmetric(vertical: dp24);
  static const mH64 = EdgeInsets.symmetric(horizontal: dp32);

  /// [EdgeInsets] with custom [left], [right], [top] & [bottom] values
  static EdgeInsets mLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      EdgeInsets.fromLTRB(left, top, right, bottom);

  /// [EdgeInsets] with custom symmetric [v] for vertical and [h] for horizontal value
  static EdgeInsets mSymmetric({double v = 0.0, double h = 0.0}) =>
      EdgeInsets.symmetric(
        vertical: v,
        horizontal: h,
      );

  /// [EdgeInsets] with custom [left], [right], [top] & [bottom] values
  static EdgeInsets mOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);

  /// [ShapeBorder] with border radius 7.5
  static ShapeBorder roundedSm =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5));

  /// [ShapeBorder] with border radius 15
  static ShapeBorder rounded =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));

  /// [ShapeBorder] with border radius 30
  static ShapeBorder roundedLg =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

  /// [ShapeBorder] with custom border [radius]
  static ShapeBorder withRounded(double radius) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));

  // Emit a log event.
  ///
  /// This function was designed to map closely to the logging information
  /// collected by `package:logging`.
  ///
  /// - [message] is the log message
  /// - [time] (optional) is the timestamp
  /// - [sequenceNumber] (optional) is a monotonically increasing sequence number
  /// - [level] (optional) is the severity level (a value between 0 and 2000); see
  ///   the `package:logging` `Level` class for an overview of the possible values
  /// - [name] (optional) is the name of the source of the log message
  /// - [zone] (optional) the zone where the log was emitted
  /// - [error] (optional) an error object associated with this log event
  /// - [stackTrace] (optional) a stack trace associated with this log event
  static void log(String message,
          {DateTime? time,
          int? sequenceNumber,
          int level = 0,
          String name = '',
          Zone? zone,
          Object? error,
          StackTrace? stackTrace}) =>
      dev.log(message,
          error: error,
          level: level,
          name: name,
          sequenceNumber: sequenceNumber,
          stackTrace: stackTrace,
          time: time,
          zone: zone);

  /// Send a reference to [object] to any attached debuggers.
  ///
  /// Debuggers may open an inspector on the object. Returns the argument.
  static void inspect(Object object) => dev.inspect(object);

  ///Checks whether release mode or not
  static bool get isReleaseMode => kReleaseMode;

  ///Checks whether debug mode or not
  static bool get isDebugMode => kDebugMode;

  ///Checks whether profile mode or not
  static bool get isProfileMode => kProfileMode;

  ///Checks whether web or not
  static bool get isWeb => kIsWeb;

  ///Checks whether android or not
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// Get color from the hex value
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  /// Get Color in [int]
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    hexColor = hexColor.replaceAll('0X', '');
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  /// Get Random Non-Primary Color
  static Color get randomOpaqueColor =>
      Color(Random().nextInt(0xffffffff)).withAlpha(0xff);

  /// Get Random Primary Color
  static Color get randomPrimaryColor =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  /// Get Random Non-Primary Color
  static Color get randomColor => Color.fromARGB(
      100, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  // /// Check if connected to internet
  // static Future<bool> isConnectedToInternet() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       print('Connected to internet');
  //       return true;
  //     }
  //   } on SocketException catch (_) {
  //     print('Not connected to internet');
  //     return false;
  //   }
  //   return false;
  // }
}
