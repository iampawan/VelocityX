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
class VelocityXTextBuilder extends VelocityXWidgetBuilder<AutoSizeText>
    with VelocityColorMixin<VelocityXTextBuilder> {
  VelocityXTextBuilder(this._text) : assert(_text != null) {
    setChildToColor(this);
  }

  VelocityXTextBuilder.existing(this._text, this._textStyle)
      : assert(_text != null) {
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
  TextStyle _textStyle;
  double _letterSpacing;
  double _lineHeight;
  TextDecoration _decoration;

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

  VelocityXTextBuilder fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  VelocityXTextBuilder get center => this.._textAlign = TextAlign.center;
  VelocityXTextBuilder get start => this.._textAlign = TextAlign.start;
  VelocityXTextBuilder get end => this.._textAlign = TextAlign.end;
  VelocityXTextBuilder get justify => this.._textAlign = TextAlign.justify;

  VelocityXTextBuilder size(double size) => this.._fontSize = size;

  VelocityXTextBuilder get xs => _fontSizedText(child: this, scaleFactor: 0.75);

  VelocityXTextBuilder get sm =>
      _fontSizedText(child: this, scaleFactor: 0.875);

  VelocityXTextBuilder get base => _fontSizedText(child: this, scaleFactor: 1);

  VelocityXTextBuilder get lg =>
      _fontSizedText(child: this, scaleFactor: 1.125);

  VelocityXTextBuilder get xl => _fontSizedText(child: this, scaleFactor: 1.25);

  VelocityXTextBuilder get xl2 => _fontSizedText(child: this, scaleFactor: 1.5);

  VelocityXTextBuilder get xl3 =>
      _fontSizedText(child: this, scaleFactor: 1.875);

  VelocityXTextBuilder get xl4 =>
      _fontSizedText(child: this, scaleFactor: 2.25);

  VelocityXTextBuilder get xl5 => _fontSizedText(child: this, scaleFactor: 3);

  VelocityXTextBuilder get xl6 => _fontSizedText(child: this, scaleFactor: 4);

  VelocityXTextBuilder _fontSizedText(
      {@required double scaleFactor, @required VelocityXTextBuilder child}) {
    _scaleFactor = scaleFactor;
    return this;
  }

  VelocityXTextBuilder get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  VelocityXTextBuilder get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  VelocityXTextBuilder get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  VelocityXTextBuilder get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  VelocityXTextBuilder get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  VelocityXTextBuilder get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  VelocityXTextBuilder get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  VelocityXTextBuilder get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  VelocityXTextBuilder get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VelocityXTextBuilder _fontWeightedText(
      {@required FontWeight weight, @required VelocityXTextBuilder child}) {
    _fontWeight = weight;
    return this;
  }

  VelocityXTextBuilder get italic => this.._fontStyle = FontStyle.italic;

  VelocityXTextBuilder get tightest => this.._letterSpacing = -3.0;
  VelocityXTextBuilder get tighter => this.._letterSpacing = -2.0;
  VelocityXTextBuilder get tight => this.._letterSpacing = -1.0;
  VelocityXTextBuilder get wide => this.._letterSpacing = 1.0;
  VelocityXTextBuilder get wider => this.._letterSpacing = 2.0;
  VelocityXTextBuilder get widest => this.._letterSpacing = 3.0;

  VelocityXTextBuilder letterSpacing(double val) => this.._letterSpacing = val;

  VelocityXTextBuilder get underline =>
      this.._decoration = TextDecoration.underline;

  VelocityXTextBuilder get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  VelocityXTextBuilder get oveline =>
      this.._decoration = TextDecoration.overline;

  VelocityXTextBuilder get uppercase => this.._text = _text.toUpperCase();
  VelocityXTextBuilder get lowercase => this.._text = _text.toLowerCase();
  VelocityXTextBuilder get capitalize =>
      this.._text = _text.allWordsCapitilize();
  VelocityXTextBuilder get hidePartial => this.._text = _text.hidePartial();

  VelocityXTextBuilder get heightTight => this.._lineHeight = 0.75;
  VelocityXTextBuilder get heightSnug => this.._lineHeight = 0.875;
  VelocityXTextBuilder get heightRelaxed => this.._lineHeight = 1.25;
  VelocityXTextBuilder get heightLoose => this.._lineHeight = 1.5;
  VelocityXTextBuilder lineHeight(double val) => this.._lineHeight = val;

  @override
  AutoSizeText make({Key key}) {
    return AutoSizeText(
      _text,
      key: key,
      textAlign: _textAlign,
      maxLines: _maxLines,
      textScaleFactor: _scaleFactor,
      softWrap: true,
      style: _textStyle?.copyWith(
            color: velocityColor,
            fontSize: _fontSize ?? 14.0,
            fontStyle: _fontStyle ?? FontStyle.normal,
            fontFamily: _fontFamily,
            fontWeight: _fontWeight,
            letterSpacing: _letterSpacing ?? 0.0,
            decoration: _decoration ?? TextDecoration.none,
            height: _lineHeight,
          ) ??
          TextStyle(
            color: velocityColor,
            fontSize: _fontSize ?? 14.0,
            fontStyle: _fontStyle ?? FontStyle.normal,
            fontFamily: _fontFamily,
            fontWeight: _fontWeight,
            letterSpacing: _letterSpacing ?? 0.0,
            decoration: _decoration ?? TextDecoration.none,
            height: _lineHeight,
          ),
    );
  }
}

extension TextExtensions on Text {
  VelocityXTextBuilder get text => VelocityXTextBuilder.existing(data, style);
}
