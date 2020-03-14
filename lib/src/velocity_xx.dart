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

mixin VelocityX {
  /// Pixel Values
  static const double pixel0 = 0.0;
  static const double pixel1 = 1.0;
  static const double pixel2 = 2.0;
  static const double pixel3 = 3.0;
  static const double pixel4 = 4.0;
  static const double pixel5 = 5.0;
  static const double pixel6 = 6.0;
  static const double pixel8 = 8.0;
  static const double pixel10 = 10.0;
  static const double pixel12 = 12.0;
  static const double pixel14 = 14.0;
  static const double pixel16 = 16.0;
  static const double pixel20 = 20.0;
  static const double pixel24 = 24.0;
  static const double pixel32 = 32.0;
  static const double pixel40 = 40.0;
  static const double pixel48 = 48.0;
  static const double pixel56 = 56.0;
  static const double pixel64 = 64.0;

  ///colors
  static const String black = "#000000";
  static const String white = "#FFFFFF";

  ///Gray Colors
  static const String gray100 = "#F7FAFC";
  static const String gray200 = "#EDF2F7";
  static const String gray300 = "#E2E8F0";
  static const String gray400 = "#CBD5E0";
  static const String gray500 = "#A0AEC0";
  static const String gray600 = "#718096";
  static const String gray700 = "#4A5568";
  static const String gray800 = "#2D3748";
  static const String gray900 = "#1A202C";

  ///Red Colors
  static const String red100 = "#FFF5F5";
  static const String red200 = "#FED7D7";
  static const String red300 = "#FEB2B2";
  static const String red400 = "#FC8181";
  static const String red500 = "#F56565";
  static const String red600 = "#E53E3E";
  static const String red700 = "#C53030";
  static const String red800 = "#9B2C2C";
  static const String red900 = "#742A2A";

  ///Orange Colors
  static const String orange100 = "#FFFAF0";
  static const String orange200 = "#FEEBC8";
  static const String orange300 = "#FBD38D";
  static const String orange400 = "#F6AD55";
  static const String orange500 = "#ED8936";
  static const String orange600 = "#DD6B20";
  static const String orange700 = "#C05621";
  static const String orange800 = "#9C4221";
  static const String orange900 = "#7B341E";

  ///Yellow Colors
  static const String yellow100 = "#FFFFF0";
  static const String yellow200 = "#FEFCBF";
  static const String yellow300 = "#FAF089";
  static const String yellow400 = "#F6E05E";
  static const String yellow500 = "#ECC94B";
  static const String yellow600 = "#D69E2E";
  static const String yellow700 = "#B7791F";
  static const String yellow800 = "#975A16";
  static const String yellow900 = "#744210";

  ///Green Colors
  static const String green100 = "#F0FFF4";
  static const String green200 = "#C6F6D5";
  static const String green300 = "#9AE6B4";
  static const String green400 = "#68D391";
  static const String green500 = "#48BB78";
  static const String green600 = "#38A169";
  static const String green700 = "#2F855A";
  static const String green800 = "#276749";
  static const String green900 = "#22543D";

  ///Teal Colors
  static const String teal100 = "#E6FFFA";
  static const String teal200 = "#B2F5EA";
  static const String teal300 = "#81E6D9";
  static const String teal400 = "#4FD1C5";
  static const String teal500 = "#38B2AC";
  static const String teal600 = "#319795";
  static const String teal700 = "#2C7A7B";
  static const String teal800 = "#285E61";
  static const String teal900 = "#234E52";

  ///Blue Colors
  static const String blue100 = "#EBF8FF";
  static const String blue200 = "#BEE3F8";
  static const String blue300 = "#90CDF4";
  static const String blue400 = "#63B3ED";
  static const String blue500 = "#4299E1";
  static const String blue600 = "#3182CE";
  static const String blue700 = "#2B6CB0";
  static const String blue800 = "#2C5282";
  static const String blue900 = "#2A4365";

  ///Indigo Colors
  static const String indigo100 = "#EBF4FF";
  static const String indigo200 = "#C3DAFE";
  static const String indigo300 = "#A3BFFA";
  static const String indigo400 = "#7F9CF5";
  static const String indigo500 = "#667EEA";
  static const String indigo600 = "#5A67D8";
  static const String indigo700 = "#4C51BF";
  static const String indigo800 = "#434190";
  static const String indigo900 = "#3C366B";

  ///Purple Colors
  static const String purple100 = "#FAF5FF";
  static const String purple200 = "#E9D8FD";
  static const String purple300 = "#D6BCFA";
  static const String purple400 = "#B794F4";
  static const String purple500 = "#9F7AEA";
  static const String purple600 = "#805AD5";
  static const String purple700 = "#6B46C1";
  static const String purple800 = "#553C9A";
  static const String purple900 = "#44337A";

  ///Pink Colors
  static const String pink100 = "#FFF5F7";
  static const String pink200 = "#FED7E2";
  static const String pink300 = "#FBB6CE";
  static const String pink400 = "#F687B3";
  static const String pink500 = "#ED64A6";
  static const String pink600 = "#D53F8C";
  static const String pink700 = "#B83280";
  static const String pink800 = "#97266D";
  static const String pink900 = "#702459";

  /// All Fixed EdgeInsets
  static EdgeInsets edp4 = const EdgeInsets.all(pixel4);
  static EdgeInsets edp8 = const EdgeInsets.all(pixel8);
  static EdgeInsets edp12 = const EdgeInsets.all(pixel12);
  static EdgeInsets edp16 = const EdgeInsets.all(pixel16);
  static EdgeInsets edp20 = const EdgeInsets.all(pixel20);
  static EdgeInsets edp24 = const EdgeInsets.all(pixel24);
  static EdgeInsets edp32 = const EdgeInsets.all(pixel32);

  /// Symmetric Fixed EdgeInsets
  static const edpVertical4 = EdgeInsets.symmetric(vertical: pixel4);
  static const edpHorizontal4 = EdgeInsets.symmetric(horizontal: pixel4);
  static const edpVertical8 = EdgeInsets.symmetric(vertical: pixel8);
  static const edpHorizontal8 = EdgeInsets.symmetric(horizontal: pixel8);
  static const edpHorizontal12 = EdgeInsets.symmetric(horizontal: pixel12);
  static const edpVertical12 = EdgeInsets.symmetric(vertical: pixel12);
  static const edpVertical16 = EdgeInsets.symmetric(vertical: pixel16);
  static const edpHorizontal16 = EdgeInsets.symmetric(horizontal: pixel16);
  static const edpVertical20 = EdgeInsets.symmetric(vertical: pixel20);
  static const edpHorizontal20 = EdgeInsets.symmetric(horizontal: pixel20);
  static const edpVertical24 = EdgeInsets.symmetric(vertical: pixel24);
  static const edpHorizontal24 = EdgeInsets.symmetric(horizontal: pixel24);
  static const edpVertical32 = EdgeInsets.symmetric(vertical: pixel24);
  static const edpHorizontal32 = EdgeInsets.symmetric(horizontal: pixel32);

  /// Get color from the hex value
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
