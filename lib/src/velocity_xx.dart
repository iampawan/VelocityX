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
  static const double pixel8 = 8.0;
  static const double pixel12 = 12.0;
  static const double pixel16 = 16.0;
  static const double pixel20 = 20.0;

  /// All Fixed EdgeInsets
  static EdgeInsets edp8 = const EdgeInsets.all(pixel8);
  static EdgeInsets edp12 = const EdgeInsets.all(pixel12);
  static EdgeInsets edp16 = const EdgeInsets.all(pixel16);
  static EdgeInsets edp20 = const EdgeInsets.all(pixel20);

  /// Symmetric Fixed EdgeInsets
  static const edpVertical8 = EdgeInsets.symmetric(vertical: pixel8);
  static const edpHorizontal8 = EdgeInsets.symmetric(horizontal: pixel8);
  static const edpHorizontal12 = EdgeInsets.symmetric(horizontal: pixel12);
  static const edpVertical12 = EdgeInsets.symmetric(vertical: pixel12);
  static const edpVertical16 = EdgeInsets.symmetric(vertical: pixel16);
  static const edpHorizontal16 = EdgeInsets.symmetric(horizontal: pixel16);
  static const edpVertical20 = EdgeInsets.symmetric(vertical: pixel20);
  static const edpHorizontal20 = EdgeInsets.symmetric(horizontal: pixel20);

  /// Get color from the hex value
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
