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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  static const String blackHex = "#000000";
  static const String whiteHex = "#ffffff";

  ///colors
  static Color black = hexToColor(blackHex);
  static Color white = hexToColor(whiteHex);

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

  static Color gray100 = hexToColor(grayHex100);
  static Color gray200 = hexToColor(grayHex200);
  static Color gray300 = hexToColor(grayHex300);
  static Color gray400 = hexToColor(grayHex400);
  static Color gray500 = hexToColor(grayHex500);
  static Color gray600 = hexToColor(grayHex600);
  static Color gray700 = hexToColor(grayHex700);
  static Color gray800 = hexToColor(grayHex800);
  static Color gray900 = hexToColor(grayHex900);

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

  static Color red100 = hexToColor(redHex100);
  static Color red200 = hexToColor(redHex200);
  static Color red300 = hexToColor(redHex300);
  static Color red400 = hexToColor(redHex400);
  static Color red500 = hexToColor(redHex500);
  static Color red600 = hexToColor(redHex600);
  static Color red700 = hexToColor(redHex700);
  static Color red800 = hexToColor(redHex800);
  static Color red900 = hexToColor(redHex900);

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

  static Color orange100 = hexToColor(orangeHex100);
  static Color orange200 = hexToColor(orangeHex200);
  static Color orange300 = hexToColor(orangeHex300);
  static Color orange400 = hexToColor(orangeHex400);
  static Color orange500 = hexToColor(orangeHex500);
  static Color orange600 = hexToColor(orangeHex600);
  static Color orange700 = hexToColor(orangeHex700);
  static Color orange800 = hexToColor(orangeHex800);
  static Color orange900 = hexToColor(orangeHex900);

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

  static Color yellow100 = hexToColor(yellowHex100);
  static Color yellow200 = hexToColor(yellowHex200);
  static Color yellow300 = hexToColor(yellowHex300);
  static Color yellow400 = hexToColor(yellowHex400);
  static Color yellow500 = hexToColor(yellowHex500);
  static Color yellow600 = hexToColor(yellowHex600);
  static Color yellow700 = hexToColor(yellowHex700);
  static Color yellow800 = hexToColor(yellowHex800);
  static Color yellow900 = hexToColor(yellowHex900);

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

  static Color green100 = hexToColor(greenHex100);
  static Color green200 = hexToColor(greenHex200);
  static Color green300 = hexToColor(greenHex300);
  static Color green400 = hexToColor(greenHex400);
  static Color green500 = hexToColor(greenHex500);
  static Color green600 = hexToColor(greenHex600);
  static Color green700 = hexToColor(greenHex700);
  static Color green800 = hexToColor(greenHex800);
  static Color green900 = hexToColor(greenHex900);

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

  static Color teal100 = hexToColor(tealHex100);
  static Color teal200 = hexToColor(tealHex200);
  static Color teal300 = hexToColor(tealHex300);
  static Color teal400 = hexToColor(tealHex400);
  static Color teal500 = hexToColor(tealHex500);
  static Color teal600 = hexToColor(tealHex600);
  static Color teal700 = hexToColor(tealHex700);
  static Color teal800 = hexToColor(tealHex800);
  static Color teal900 = hexToColor(tealHex900);

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

  static Color blue100 = hexToColor(blueHex100);
  static Color blue200 = hexToColor(blueHex200);
  static Color blue300 = hexToColor(blueHex300);
  static Color blue400 = hexToColor(blueHex400);
  static Color blue500 = hexToColor(blueHex500);
  static Color blue600 = hexToColor(blueHex600);
  static Color blue700 = hexToColor(blueHex700);
  static Color blue800 = hexToColor(blueHex800);
  static Color blue900 = hexToColor(blueHex900);

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

  static Color indigo100 = hexToColor(indigoHex100);
  static Color indigo200 = hexToColor(indigoHex200);
  static Color indigo300 = hexToColor(indigoHex300);
  static Color indigo400 = hexToColor(indigoHex400);
  static Color indigo500 = hexToColor(indigoHex500);
  static Color indigo600 = hexToColor(indigoHex600);
  static Color indigo700 = hexToColor(indigoHex700);
  static Color indigo800 = hexToColor(indigoHex800);
  static Color indigo900 = hexToColor(indigoHex900);

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

  static Color purple100 = hexToColor(purpleHex100);
  static Color purple200 = hexToColor(purpleHex200);
  static Color purple300 = hexToColor(purpleHex300);
  static Color purple400 = hexToColor(purpleHex400);
  static Color purple500 = hexToColor(purpleHex500);
  static Color purple600 = hexToColor(purpleHex600);
  static Color purple700 = hexToColor(purpleHex700);
  static Color purple800 = hexToColor(purpleHex800);
  static Color purple900 = hexToColor(purpleHex900);

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

  static Color pink100 = hexToColor(pinkHex100);
  static Color pink200 = hexToColor(pinkHex200);
  static Color pink300 = hexToColor(pinkHex300);
  static Color pink400 = hexToColor(pinkHex400);
  static Color pink500 = hexToColor(pinkHex500);
  static Color pink600 = hexToColor(pinkHex600);
  static Color pink700 = hexToColor(pinkHex700);
  static Color pink800 = hexToColor(pinkHex800);
  static Color pink900 = hexToColor(pinkHex900);

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

  static ShapeBorder roundedSm =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5));
  static ShapeBorder rounded =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  static ShapeBorder roundedLg =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

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
          {DateTime time,
          int sequenceNumber,
          int level = 0,
          String name = '',
          Zone zone,
          Object error,
          StackTrace stackTrace}) =>
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
  bool get isReleaseMode => kReleaseMode;

  ///Checks whether debug mode or not
  bool get isDebugMode => kDebugMode;

  ///Checks whether profile mode or not
  bool get isProfileMode => kProfileMode;

  ///Checks whether profile mode or not
  bool get isWeb => kIsWeb;

  /// Get color from the hex value
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
