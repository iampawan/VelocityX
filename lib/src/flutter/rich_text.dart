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
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/src/flutter/builder.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/color_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/text_align_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/text_scale_factor_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/text_style_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

class VelocityXRichTextBuilder extends VelocityXWidgetBuilder<AutoSizeText>
    with
        VelocityColorMixin<VelocityXRichTextBuilder>,
        VelocityTextAlignMixin<VelocityXRichTextBuilder>,
        VelocityTextStyleMixin<VelocityXRichTextBuilder>,
        VelocityTextScaleFactorMixin<VelocityXRichTextBuilder> {
  VelocityXRichTextBuilder(this._text) : assert(_text != null) {
    setChildToColor(this);
    setChildForTextAlign(this);
    setChildForTextStyling(this);
    setChildForTextScaleFactor(this);
  }

  VelocityXRichTextBuilder.existing(this._text, this._textStyle)
      : assert(_text != null) {
    setChildToColor(this);
    setChildForTextAlign(this);
    setChildForTextStyling(this);
    setChildForTextScaleFactor(this);
  }

  String _text;
  List<TextSpan> _textSpanChildren;
  int _maxLines;
  GestureRecognizer _gestureRecognizer;
  TextStyle _textStyle;

  VelocityXRichTextBuilder tap(Function function) {
    final recognizer = TapGestureRecognizer()..onTap = function;
    return this.._gestureRecognizer = recognizer;
  }

  VelocityXRichTextBuilder doubleTap(Function function) {
    final recognizer = DoubleTapGestureRecognizer()..onDoubleTap = function;
    return this.._gestureRecognizer = recognizer;
  }

  VelocityXRichTextBuilder withTextSpanChildren(List<TextSpan> children) {
    _textSpanChildren = children ?? <TextSpan>[];
    return this;
  }

  VelocityXRichTextBuilder color(Color color) {
    velocityColor = color;
    return this;
  }

  VelocityXRichTextBuilder hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  VelocityXRichTextBuilder maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  VelocityXRichTextBuilder get uppercase => this.._text = _text.toUpperCase();

  VelocityXRichTextBuilder get lowercase => this.._text = _text.toLowerCase();

  VelocityXRichTextBuilder get capitalize =>
      this.._text = _text.allWordsCapitilize();

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
    return AutoSizeText.rich(
      TextSpan(
        text: _text,
        children: _textSpanChildren,
        recognizer: _gestureRecognizer,
        style: velocityTextStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
      ),
      key: key,
      textAlign: velocityTextAlign,
      maxLines: _maxLines,
      textScaleFactor: velocityScaleFactor,
      softWrap: true,
    );
  }
}

class VelocityXTextSpan extends VelocityXTextSpanBuilder
    with
        VelocityColorMixin<VelocityXTextSpan>,
        VelocityTextAlignMixin<VelocityXTextSpan>,
        VelocityTextStyleMixin<VelocityXTextSpan>,
        VelocityTextScaleFactorMixin<VelocityXTextSpan> {
  VelocityXTextSpan(this._text) : assert(_text != null) {
    setChildToColor(this);
    setChildForTextAlign(this);
    setChildForTextStyling(this);
    setChildForTextScaleFactor(this);
  }

  String _text;
  GestureRecognizer _gestureRecognizer;
  List<TextSpan> _textSpanChildren;
  TextStyle _textStyle;

  VelocityXTextSpan tap(Function function) {
    final recognizer = TapGestureRecognizer()..onTap = function;
    return this.._gestureRecognizer = recognizer;
  }

  VelocityXTextSpan doubleTap(Function function) {
    final recognizer = DoubleTapGestureRecognizer()..onDoubleTap = function;
    return this.._gestureRecognizer = recognizer;
  }

  VelocityXTextSpan withChildren(List<TextSpan> children) {
    return this.._textSpanChildren = children ?? <TextSpan>[];
  }

  VelocityXTextSpan color(Color color) {
    velocityColor = color;
    return this;
  }

  VelocityXTextSpan hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  @override
  TextSpan make({Key key}) {
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
    return TextSpan(
      text: _text,
      recognizer: _gestureRecognizer,
      children: _textSpanChildren,
      style: velocityTextStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
    );
  }
}

extension VelocityXRichTextExtension on RichText {
  /// Get RichText Widget for the String
  VelocityXRichTextBuilder get richText =>
      VelocityXRichTextBuilder.existing((text as TextSpan).text, text.style);
}

extension VelocityXTextSpanExtension on TextSpan {
  /// Get TextSpan for the String
  VelocityXTextSpan get textSpan => VelocityXTextSpan(text);
}
