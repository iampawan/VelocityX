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

  static Color blackColor = hexToColor(black);
  static Color whiteColor = hexToColor(white);

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

  static Color grayColor100 = hexToColor(gray100);
  static Color grayColor200 = hexToColor(gray200);
  static Color grayColor300 = hexToColor(gray300);
  static Color grayColor400 = hexToColor(gray400);
  static Color grayColor500 = hexToColor(gray500);
  static Color grayColor600 = hexToColor(gray600);
  static Color grayColor700 = hexToColor(gray700);
  static Color grayColor800 = hexToColor(gray800);
  static Color grayColor900 = hexToColor(gray900);

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

  static Color redColor100 = hexToColor(red100);
  static Color redColor200 = hexToColor(red200);
  static Color redColor300 = hexToColor(red300);
  static Color redColor400 = hexToColor(red400);
  static Color redColor500 = hexToColor(red500);
  static Color redColor600 = hexToColor(red600);
  static Color redColor700 = hexToColor(red700);
  static Color redColor800 = hexToColor(red800);
  static Color redColor900 = hexToColor(red900);

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

  static Color orangeColor100 = hexToColor(orange100);
  static Color orangeColor200 = hexToColor(orange200);
  static Color orangeColor300 = hexToColor(orange300);
  static Color orangeColor400 = hexToColor(orange400);
  static Color orangeColor500 = hexToColor(orange500);
  static Color orangeColor600 = hexToColor(orange600);
  static Color orangeColor700 = hexToColor(orange700);
  static Color orangeColor800 = hexToColor(orange800);
  static Color orangeColor900 = hexToColor(orange900);

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

  static Color yellowColor100 = hexToColor(yellow100);
  static Color yellowColor200 = hexToColor(yellow200);
  static Color yellowColor300 = hexToColor(yellow300);
  static Color yellowColor400 = hexToColor(yellow400);
  static Color yellowColor500 = hexToColor(yellow500);
  static Color yellowColor600 = hexToColor(yellow600);
  static Color yellowColor700 = hexToColor(yellow700);
  static Color yellowColor800 = hexToColor(yellow800);
  static Color yellowColor900 = hexToColor(yellow900);

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

  static Color greenColor100 = hexToColor(green100);
  static Color greenColor200 = hexToColor(green200);
  static Color greenColor300 = hexToColor(green300);
  static Color greenColor400 = hexToColor(green400);
  static Color greenColor500 = hexToColor(green500);
  static Color greenColor600 = hexToColor(green600);
  static Color greenColor700 = hexToColor(green700);
  static Color greenColor800 = hexToColor(green800);
  static Color greenColor900 = hexToColor(green900);

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

  static Color tealColor100 = hexToColor(teal100);
  static Color tealColor200 = hexToColor(teal200);
  static Color tealColor300 = hexToColor(teal300);
  static Color tealColor400 = hexToColor(teal400);
  static Color tealColor500 = hexToColor(teal500);
  static Color tealColor600 = hexToColor(teal600);
  static Color tealColor700 = hexToColor(teal700);
  static Color tealColor800 = hexToColor(teal800);
  static Color tealColor900 = hexToColor(teal900);

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

  static Color blueColor100 = hexToColor(blue100);
  static Color blueColor200 = hexToColor(blue200);
  static Color blueColor300 = hexToColor(blue300);
  static Color blueColor400 = hexToColor(blue400);
  static Color blueColor500 = hexToColor(blue500);
  static Color blueColor600 = hexToColor(blue600);
  static Color blueColor700 = hexToColor(blue700);
  static Color blueColor800 = hexToColor(blue800);
  static Color blueColor900 = hexToColor(blue900);

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

  static Color indigoColor100 = hexToColor(indigo100);
  static Color indigoColor200 = hexToColor(indigo200);
  static Color indigoColor300 = hexToColor(indigo300);
  static Color indigoColor400 = hexToColor(indigo400);
  static Color indigoColor500 = hexToColor(indigo500);
  static Color indigoColor600 = hexToColor(indigo600);
  static Color indigoColor700 = hexToColor(indigo700);
  static Color indigoColor800 = hexToColor(indigo800);
  static Color indigoColor900 = hexToColor(indigo900);

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

  static Color purpleColor100 = hexToColor(purple100);
  static Color purpleColor200 = hexToColor(purple200);
  static Color purpleColor300 = hexToColor(purple300);
  static Color purpleColor400 = hexToColor(purple400);
  static Color purpleColor500 = hexToColor(purple500);
  static Color purpleColor600 = hexToColor(purple600);
  static Color purpleColor700 = hexToColor(purple700);
  static Color purpleColor800 = hexToColor(purple800);
  static Color purpleColor900 = hexToColor(purple900);

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

  static Color pinkColor100 = hexToColor(pink100);
  static Color pinkColor200 = hexToColor(pink200);
  static Color pinkColor300 = hexToColor(pink300);
  static Color pinkColor400 = hexToColor(pink400);
  static Color pinkColor500 = hexToColor(pink500);
  static Color pinkColor600 = hexToColor(pink600);
  static Color pinkColor700 = hexToColor(pink700);
  static Color pinkColor800 = hexToColor(pink800);
  static Color pinkColor900 = hexToColor(pink900);

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
