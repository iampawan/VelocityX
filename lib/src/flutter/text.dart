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
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';

@protected
class VxTextBuilder extends VelocityXWidgetBuilder<AutoSizeText>
    with VxColorMixin<VxTextBuilder> {
  VxTextBuilder(this._text) : assert(_text != null) {
    setChildToColor(this);
  }

  VxTextBuilder.existing(this._text, this._textStyle) : assert(_text != null) {
    setChildToColor(this);
  }

  String _text;
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
  TextStyle _textStyle;
  TextStyle _themedStyle;

  VxTextBuilder text(String text) {
    _text = text;
    return this;
  }

  VxTextBuilder color(Color color) {
    velocityColor = color;
    return this;
  }

  VxTextBuilder hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  VxTextBuilder maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  VxTextBuilder fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  /// Use textStyle to provide custom or any theme style.
  VxTextBuilder textStyle(TextStyle _style) {
    _themedStyle = _style;
    return this;
  }

  VxTextBuilder get center => this.._textAlign = TextAlign.center;
  VxTextBuilder get start => this.._textAlign = TextAlign.start;
  VxTextBuilder get end => this.._textAlign = TextAlign.end;
  VxTextBuilder get justify => this.._textAlign = TextAlign.justify;

  VxTextBuilder size(double size) => this.._fontSize = size;

  VxTextBuilder get xs => _fontSizedText(child: this, scaleFactor: 0.75);

  VxTextBuilder get sm => _fontSizedText(child: this, scaleFactor: 0.875);

  VxTextBuilder get base => _fontSizedText(child: this, scaleFactor: 1);

  VxTextBuilder get lg => _fontSizedText(child: this, scaleFactor: 1.125);

  VxTextBuilder get xl => _fontSizedText(child: this, scaleFactor: 1.25);

  VxTextBuilder get xl2 => _fontSizedText(child: this, scaleFactor: 1.5);

  VxTextBuilder get xl3 => _fontSizedText(child: this, scaleFactor: 1.875);

  VxTextBuilder get xl4 => _fontSizedText(child: this, scaleFactor: 2.25);

  VxTextBuilder get xl5 => _fontSizedText(child: this, scaleFactor: 3);

  VxTextBuilder get xl6 => _fontSizedText(child: this, scaleFactor: 4);

  VxTextBuilder _fontSizedText(
      {@required double scaleFactor, @required VxTextBuilder child}) {
    _fontSize = _fontSize ?? 14.0;
    _scaleFactor = scaleFactor;
    return this;
  }

  VxTextBuilder get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  VxTextBuilder get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  VxTextBuilder get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  VxTextBuilder get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  VxTextBuilder get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  VxTextBuilder get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  VxTextBuilder get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  VxTextBuilder get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  VxTextBuilder get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VxTextBuilder _fontWeightedText(
      {@required FontWeight weight, @required VxTextBuilder child}) {
    _fontWeight = weight;
    return this;
  }

  VxTextBuilder get italic => this.._fontStyle = FontStyle.italic;

  VxTextBuilder get tightest => this.._letterSpacing = -3.0;
  VxTextBuilder get tighter => this.._letterSpacing = -2.0;
  VxTextBuilder get tight => this.._letterSpacing = -1.0;
  VxTextBuilder get wide => this.._letterSpacing = 1.0;
  VxTextBuilder get wider => this.._letterSpacing = 2.0;
  VxTextBuilder get widest => this.._letterSpacing = 3.0;

  VxTextBuilder letterSpacing(double val) => this.._letterSpacing = val;

  VxTextBuilder get underline => this.._decoration = TextDecoration.underline;

  VxTextBuilder get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  VxTextBuilder get overline => this.._decoration = TextDecoration.overline;

  VxTextBuilder get uppercase => this.._text = _text.toUpperCase();
  VxTextBuilder get lowercase => this.._text = _text.toLowerCase();
  VxTextBuilder get capitalize => this.._text = _text.allWordsCapitilize();
  VxTextBuilder get hidePartial => this.._text = _text.hidePartial();

  VxTextBuilder get heightTight => this.._lineHeight = 0.75;
  VxTextBuilder get heightSnug => this.._lineHeight = 0.875;
  VxTextBuilder get heightRelaxed => this.._lineHeight = 1.25;
  VxTextBuilder get heightLoose => this.._lineHeight = 1.5;
  VxTextBuilder lineHeight(double val) => this.._lineHeight = val;

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
    return AutoSizeText(_text,
        key: key,
        textAlign: _textAlign,
        maxLines: _maxLines,
        textScaleFactor: _scaleFactor,
        softWrap: true,
        style: _themedStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts);
  }
}

extension TextExtensions on Text {
  VxTextBuilder get text => VxTextBuilder.existing(data, style);
}
