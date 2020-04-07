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
import 'package:velocity_x/velocity_x.dart';

class VxRichText extends VelocityXWidgetBuilder<AutoSizeText>
    with VxColorMixin<VxRichText> {
  VxRichText(this._text) : assert(_text != null) {
    setChildToColor(this);
  }

  VxRichText.existing(this._text, this._textStyle)
      : assert(_text != null) {
    setChildToColor(this);
  }

  String _text;
  List<TextSpan> _textSpanChildren;
  String _fontFamily;
  FontWeight _fontWeight;
  TextAlign _textAlign;
  double _scaleFactor;
  double _fontSize;
  int _maxLines;
  FontStyle _fontStyle;
  double _letterSpacing;
  double _lineHeight;
  TextDecoration _decoration;
  GestureRecognizer _gestureRecognizer;
  TextStyle _textStyle;
  TextStyle _themedStyle;

  VxRichText tap(Function function) {
    final recognizer = TapGestureRecognizer()..onTap = function;
    return this.._gestureRecognizer = recognizer;
  }

  VxRichText doubleTap(Function function) {
    final recognizer = DoubleTapGestureRecognizer()..onDoubleTap = function;
    return this.._gestureRecognizer = recognizer;
  }

  VxRichText withTextSpanChildren(List<TextSpan> children) {
    _textSpanChildren = children ?? <TextSpan>[];
    return this;
  }

  VxRichText color(Color color) {
    velocityColor = color;
    return this;
  }

  VxRichText hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  VxRichText maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  VxRichText fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  /// Use textStyle to provide custom or any theme style.
  VxRichText textStyle(TextStyle _style) {
    _themedStyle = _style;
    return this;
  }

  VxRichText get center => this.._textAlign = TextAlign.center;

  VxRichText get start => this.._textAlign = TextAlign.start;

  VxRichText get end => this.._textAlign = TextAlign.end;

  VxRichText get justify => this.._textAlign = TextAlign.justify;

  VxRichText size(double size) => this.._fontSize = size;

  VxRichText get xs =>
      _fontSizedText(child: this, scaleFactor: 0.75);

  VxRichText get sm =>
      _fontSizedText(child: this, scaleFactor: 0.875);

  VxRichText get base =>
      _fontSizedText(child: this, scaleFactor: 1);

  VxRichText get lg =>
      _fontSizedText(child: this, scaleFactor: 1.125);

  VxRichText get xl =>
      _fontSizedText(child: this, scaleFactor: 1.25);

  VxRichText get xl2 =>
      _fontSizedText(child: this, scaleFactor: 1.5);

  VxRichText get xl3 =>
      _fontSizedText(child: this, scaleFactor: 1.875);

  VxRichText get xl4 =>
      _fontSizedText(child: this, scaleFactor: 2.25);

  VxRichText get xl5 =>
      _fontSizedText(child: this, scaleFactor: 3);

  VxRichText get xl6 =>
      _fontSizedText(child: this, scaleFactor: 4);

  VxRichText _fontSizedText(
      {@required double scaleFactor,
      @required VxRichText child}) {
    _scaleFactor = scaleFactor;
    return this;
  }

  VxRichText get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  VxRichText get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  VxRichText get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  VxRichText get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  VxRichText get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  VxRichText get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  VxRichText get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  VxRichText get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  VxRichText get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VxRichText _fontWeightedText(
      {@required FontWeight weight, @required VxRichText child}) {
    _fontWeight = weight;
    return this;
  }

  VxRichText get italic => this.._fontStyle = FontStyle.italic;

  VxRichText get tightest => this.._letterSpacing = -3.0;

  VxRichText get tighter => this.._letterSpacing = -2.0;

  VxRichText get tight => this.._letterSpacing = -1.0;

  VxRichText get wide => this.._letterSpacing = 1.0;

  VxRichText get wider => this.._letterSpacing = 2.0;

  VxRichText get widest => this.._letterSpacing = 3.0;

  VxRichText letterSpacing(double val) =>
      this.._letterSpacing = val;

  VxRichText get underline =>
      this.._decoration = TextDecoration.underline;

  VxRichText get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  VxRichText get overline =>
      this.._decoration = TextDecoration.overline;

  VxRichText get uppercase => this.._text = _text.toUpperCase();

  VxRichText get lowercase => this.._text = _text.toLowerCase();

  VxRichText get capitalize =>
      this.._text = _text.allWordsCapitilize();

  VxRichText get hidePartial => this.._text = _text.hidePartial();

  VxRichText get heightTight => this.._lineHeight = 0.75;

  VxRichText get heightSnug => this.._lineHeight = 0.875;

  VxRichText get heightRelaxed => this.._lineHeight = 1.25;

  VxRichText get heightLoose => this.._lineHeight = 1.5;

  VxRichText lineHeight(double val) => this.._lineHeight = val;

  @override
  AutoSizeText make({Key key}) {
    final ts = TextStyle(
      color: velocityColor,
      fontSize: _fontSize,
      fontStyle: _fontStyle,
      fontFamily: _fontFamily,
      fontWeight: _fontWeight,
      letterSpacing: _letterSpacing,
      decoration: _decoration,
      height: _lineHeight,
    );
    return AutoSizeText.rich(
      TextSpan(
        text: _text,
        children: _textSpanChildren,
        recognizer: _gestureRecognizer,
        style: _themedStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
      ),
      key: key,
      textAlign: _textAlign,
      maxLines: _maxLines,
      textScaleFactor: _scaleFactor,
      softWrap: true,
    );
  }
}

class VelocityXTextSpan extends VelocityXTextSpanBuilder
    with VxColorMixin<VelocityXTextSpan> {
  VelocityXTextSpan(this._text) : assert(_text != null) {
    setChildToColor(this);
  }

  String _text;
  GestureRecognizer _gestureRecognizer;
  TextDecoration _decoration;
  String _fontFamily;
  FontWeight _fontWeight;
  double _fontSize;
  FontStyle _fontStyle;
  double _letterSpacing;
  double _lineHeight;
  List<TextSpan> _textSpanChildren;
  TextStyle _textStyle;
  TextStyle _themedStyle;

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
      this..velocityColor = Vx.hexToColor(colorHex);

  VelocityXTextSpan fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  /// Use textStyle to provide custom or any theme style.
  VelocityXTextSpan textStyle(TextStyle _style) {
    _themedStyle = _style;
    return this;
  }

  VelocityXTextSpan size(double size) => this.._fontSize = size;

  VelocityXTextSpan get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  VelocityXTextSpan get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  VelocityXTextSpan get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  VelocityXTextSpan get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  VelocityXTextSpan get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  VelocityXTextSpan get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  VelocityXTextSpan get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  VelocityXTextSpan get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  VelocityXTextSpan get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VelocityXTextSpan _fontWeightedText(
      {@required FontWeight weight, @required VelocityXTextSpan child}) {
    _fontWeight = weight;
    return this;
  }

  VelocityXTextSpan get italic => this.._fontStyle = FontStyle.italic;

  VelocityXTextSpan get tightest => this.._letterSpacing = -3.0;

  VelocityXTextSpan get tighter => this.._letterSpacing = -2.0;

  VelocityXTextSpan get tight => this.._letterSpacing = -1.0;

  VelocityXTextSpan get wide => this.._letterSpacing = 1.0;

  VelocityXTextSpan get wider => this.._letterSpacing = 2.0;

  VelocityXTextSpan get widest => this.._letterSpacing = 3.0;

  VelocityXTextSpan letterSpacing(double val) => this.._letterSpacing = val;

  VelocityXTextSpan get underline =>
      this.._decoration = TextDecoration.underline;

  VelocityXTextSpan get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  VelocityXTextSpan get overline => this.._decoration = TextDecoration.overline;

  VelocityXTextSpan get uppercase => this.._text = _text.toUpperCase();

  VelocityXTextSpan get lowercase => this.._text = _text.toLowerCase();

  VelocityXTextSpan get capitalize => this.._text = _text.allWordsCapitilize();

  VelocityXTextSpan get hidePartial => this.._text = _text.hidePartial();

  VelocityXTextSpan get heightTight => this.._lineHeight = 0.75;

  VelocityXTextSpan get heightSnug => this.._lineHeight = 0.875;

  VelocityXTextSpan get heightRelaxed => this.._lineHeight = 1.25;

  VelocityXTextSpan get heightLoose => this.._lineHeight = 1.5;

  VelocityXTextSpan lineHeight(double val) => this.._lineHeight = val;

  @override
  TextSpan make({Key key}) {
    final ts = TextStyle(
      color: velocityColor,
      fontSize: _fontSize,
      fontStyle: _fontStyle,
      fontFamily: _fontFamily,
      fontWeight: _fontWeight,
      letterSpacing: _letterSpacing,
      decoration: _decoration,
      height: _lineHeight,
    );
    return TextSpan(
      text: _text,
      recognizer: _gestureRecognizer,
      children: _textSpanChildren,
      style: _themedStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
    );
  }
}

extension VelocityXRichTextExtension on RichText {
  /// Get RichText Widget for the String
  VxRichText get richText =>
      VxRichText.existing((text as TextSpan).text, text.style);
}

extension VelocityXTextSpanExtension on TextSpan {
  /// Get TextSpan for the String
  VelocityXTextSpan get textSpan => VelocityXTextSpan(text);
}
