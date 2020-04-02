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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin VelocityTextStyleMixin<T> {
  T _child;

  @protected
  double velocityLineHeight;

  @protected
  FontWeight velocityFontWeight;

  @protected
  double velocityLetterSpacing;

  @protected
  FontStyle velocityFontStyle;

  @protected
  TextDecoration velocityTextDecoration;

  @protected
  TextAlign velocityTextAlign;

  @protected
  double velocityFontSize;

  @protected
  String velocityFontFamily;

  @protected
  TextStyle velocityTextStyle;

  @protected
  void setChildForTextStyling(T child) {
    _child = child;
  }

  // Font Weight
  T get hairLine => _applyFontWeight(fontWeight: FontWeight.w100);

  T get thin => _applyFontWeight(fontWeight: FontWeight.w200);

  T get light => _applyFontWeight(fontWeight: FontWeight.w300);

  T get normal => _applyFontWeight(fontWeight: FontWeight.w400);

  T get medium => _applyFontWeight(fontWeight: FontWeight.w500);

  T get semiBold => _applyFontWeight(fontWeight: FontWeight.w600);

  T get bold => _applyFontWeight(fontWeight: FontWeight.w700);

  T get extraBold => _applyFontWeight(fontWeight: FontWeight.w800);

  T get extraBlack => _applyFontWeight(fontWeight: FontWeight.w900);

  T _applyFontWeight({@required FontWeight fontWeight}) {
    velocityFontWeight = fontWeight;
    return _child;
  }

  // Line Height
  T get heightTight => _applyLineHeight(lineHeight: 0.75);

  T get heightSnug => _applyLineHeight(lineHeight: 0.875);

  T get heightRelaxed => _applyLineHeight(lineHeight: 1.25);

  T get heightLoose => _applyLineHeight(lineHeight: 1.5);

  T lineHeight(double val) => _applyLineHeight(lineHeight: val);

  T _applyLineHeight({@required double lineHeight}) {
    velocityLineHeight = lineHeight;
    return _child;
  }

  // Letter Spacing
  T get tightest => _applyLetterSpacing(letterSpacing: -3.0);

  T get tighter => _applyLetterSpacing(letterSpacing: -2.0);

  T get tight => _applyLetterSpacing(letterSpacing: -1.0);

  T get wide => _applyLetterSpacing(letterSpacing: 1.0);

  T get wider => _applyLetterSpacing(letterSpacing: 2.0);

  T get widest => _applyLetterSpacing(letterSpacing: 3.0);

  T letterSpacing(double val) => _applyLetterSpacing(letterSpacing: val);

  T _applyLetterSpacing({@required double letterSpacing}) {
    velocityLetterSpacing = letterSpacing;
    return _child;
  }

  // Font Style
  T get italic => _applyFontStyle(fontStyle: FontStyle.italic);

  T _applyFontStyle({FontStyle fontStyle}) {
    velocityFontStyle = fontStyle;
    return _child;
  }

  // Text Decoration
  T get underline =>
      _applyTextDecoration(textDecoration: TextDecoration.underline);

  T get lineThrough =>
      _applyTextDecoration(textDecoration: TextDecoration.lineThrough);

  T get overline =>
      _applyTextDecoration(textDecoration: TextDecoration.overline);

  T _applyTextDecoration({TextDecoration textDecoration}) {
    velocityTextDecoration = textDecoration;
    return _child;
  }

  // Font Size
  T size(double size) {
    velocityFontSize = size;
    return _child;
  }

  // Font Family
  T fontFamily(String family) {
    velocityFontFamily = family;
    return _child;
  }

  // Custom TextStyle
  T textStyle(TextStyle style) {
    velocityTextStyle = style;
    return _child;
  }
}
