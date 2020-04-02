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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/text_align_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/text_scale_factor_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/text_style_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';

@protected
class VelocityXTextBuilder extends VelocityXWidgetBuilder<AutoSizeText>
    with
        VelocityColorMixin<VelocityXTextBuilder>,
        VelocityTextStyleMixin<VelocityXTextBuilder>,
        VelocityTextScaleFactorMixin<VelocityXTextBuilder>,
        VelocityTextAlignMixin<VelocityXTextBuilder> {
  VelocityXTextBuilder(this._text) : assert(_text != null) {
    setChildToColor(this);
    setChildForTextStyling(this);
    setChildForTextScaleFactor(this);
    setChildForTextAlign(this);
  }

  VelocityXTextBuilder.existing(this._text, this._textStyle)
      : assert(_text != null) {
    setChildToColor(this);
    setChildForTextStyling(this);
    setChildForTextScaleFactor(this);
    setChildForTextAlign(this);
  }

  String _text;
  int _maxLines;
  TextStyle _textStyle;

  VelocityXTextBuilder text(String text) {
    _text = text;
    return this;
  }

  VelocityXTextBuilder color(Color color) {
    velocityColor = color;
    return this;
  }

  VelocityXTextBuilder hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  VelocityXTextBuilder maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  VelocityXTextBuilder get uppercase => this.._text = _text.toUpperCase();

  VelocityXTextBuilder get lowercase => this.._text = _text.toLowerCase();

  VelocityXTextBuilder get capitalize =>
      this.._text = _text.allWordsCapitilize();

  VelocityXTextBuilder get hidePartial => this.._text = _text.hidePartial();

  @override
  AutoSizeText make({Key key}) {
    final ts = TextStyle(
      color: velocityColor,
      fontSize: velocityFontSize,
      fontStyle: velocityFontStyle,
      fontFamily: velocityFontFamily,
      fontWeight: velocityFontWeight,
      letterSpacing: velocityLetterSpacing,
      decoration: velocityTextDecoration,
      height: velocityLineHeight,
    );
    return AutoSizeText(
      _text,
      key: key,
      textAlign: velocityTextAlign,
      maxLines: _maxLines,
      textScaleFactor: velocityScaleFactor,
      softWrap: true,
      style: velocityTextStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
    );
  }
}

extension TextExtensions on Text {
  VelocityXTextBuilder get text => VelocityXTextBuilder.existing(data, style);
}
