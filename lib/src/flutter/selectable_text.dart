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
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';

@protected
class VxSelectableTextBuilder extends VelocityXWidgetBuilder<SelectableText>
    with VxColorMixin<VxSelectableTextBuilder> {
  VxSelectableTextBuilder(this._text) : assert(_text != null) {
    setChildToColor(this);
  }

  VxSelectableTextBuilder.existing(this._text, this._textStyle)
      : assert(_text != null) {
    setChildToColor(this);
  }

  String _text;
  String _fontFamily;
  FontWeight _fontWeight;
  TextAlign _textAlign;
  double _fontSize;
  int _maxLines;
  FontStyle _fontStyle;
  TextStyle _textStyle;
  double _letterSpacing;
  double _lineHeight;
  TextDecoration _decoration;
  Function _onTap;
  TextStyle _themedStyle;

  VxSelectableTextBuilder selectableText(String text) {
    _text = text;
    return this;
  }

  VxSelectableTextBuilder color(Color color) {
    velocityColor = color;
    return this;
  }

  VxSelectableTextBuilder hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  VxSelectableTextBuilder maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  VxSelectableTextBuilder fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  /// Use textStyle to provide custom or any theme style.
  VxSelectableTextBuilder textStyle(TextStyle _style) {
    _themedStyle = _style;
    return this;
  }

  VxSelectableTextBuilder get center => this.._textAlign = TextAlign.center;
  VxSelectableTextBuilder get start => this.._textAlign = TextAlign.start;
  VxSelectableTextBuilder get end => this.._textAlign = TextAlign.end;
  VxSelectableTextBuilder get justify => this.._textAlign = TextAlign.justify;

  VxSelectableTextBuilder size(double size) => this.._fontSize = size;

  VxSelectableTextBuilder get xs =>
      _fontSizedText(child: this, scaleFactor: 0.75);

  VxSelectableTextBuilder get sm =>
      _fontSizedText(child: this, scaleFactor: 0.875);

  VxSelectableTextBuilder get base =>
      _fontSizedText(child: this, scaleFactor: 1);

  VxSelectableTextBuilder get lg =>
      _fontSizedText(child: this, scaleFactor: 1.125);

  VxSelectableTextBuilder get xl =>
      _fontSizedText(child: this, scaleFactor: 1.25);

  VxSelectableTextBuilder get xl2 =>
      _fontSizedText(child: this, scaleFactor: 1.5);

  VxSelectableTextBuilder get xl3 =>
      _fontSizedText(child: this, scaleFactor: 1.875);

  VxSelectableTextBuilder get xl4 =>
      _fontSizedText(child: this, scaleFactor: 2.25);

  VxSelectableTextBuilder get xl5 =>
      _fontSizedText(child: this, scaleFactor: 3);

  VxSelectableTextBuilder get xl6 =>
      _fontSizedText(child: this, scaleFactor: 4);

  VxSelectableTextBuilder _fontSizedText(
      {@required double scaleFactor, @required VxSelectableTextBuilder child}) {
    return this;
  }

  VxSelectableTextBuilder get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  VxSelectableTextBuilder get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  VxSelectableTextBuilder get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  VxSelectableTextBuilder get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  VxSelectableTextBuilder get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  VxSelectableTextBuilder get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  VxSelectableTextBuilder get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  VxSelectableTextBuilder get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  VxSelectableTextBuilder get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VxSelectableTextBuilder _fontWeightedText(
      {@required FontWeight weight, @required VxSelectableTextBuilder child}) {
    _fontWeight = weight;
    return this;
  }

  VxSelectableTextBuilder get italic => this.._fontStyle = FontStyle.italic;

  VxSelectableTextBuilder get tightest => this.._letterSpacing = -3.0;
  VxSelectableTextBuilder get tighter => this.._letterSpacing = -2.0;
  VxSelectableTextBuilder get tight => this.._letterSpacing = -1.0;
  VxSelectableTextBuilder get wide => this.._letterSpacing = 1.0;
  VxSelectableTextBuilder get wider => this.._letterSpacing = 2.0;
  VxSelectableTextBuilder get widest => this.._letterSpacing = 3.0;

  VxSelectableTextBuilder letterSpacing(double val) =>
      this.._letterSpacing = val;

  VxSelectableTextBuilder get underline =>
      this.._decoration = TextDecoration.underline;

  VxSelectableTextBuilder get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  VxSelectableTextBuilder get overline =>
      this.._decoration = TextDecoration.overline;

  VxSelectableTextBuilder get uppercase => this.._text = _text.toUpperCase();
  VxSelectableTextBuilder get lowercase => this.._text = _text.toLowerCase();
  VxSelectableTextBuilder get capitalize =>
      this.._text = _text.allWordsCapitilize();
  VxSelectableTextBuilder get hidePartial => this.._text = _text.hidePartial();

  VxSelectableTextBuilder get heightTight => this.._lineHeight = 0.75;
  VxSelectableTextBuilder get heightSnug => this.._lineHeight = 0.875;
  VxSelectableTextBuilder get heightRelaxed => this.._lineHeight = 1.25;
  VxSelectableTextBuilder get heightLoose => this.._lineHeight = 1.5;
  VxSelectableTextBuilder lineHeight(double val) => this.._lineHeight = val;

  VxSelectableTextBuilder onTap(Function _tap) => this.._onTap = _tap;

  @override
  SelectableText make({Key key}) {
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
    return SelectableText(_text,
        key: key,
        textAlign: _textAlign,
        maxLines: _maxLines,
        toolbarOptions: const ToolbarOptions(
            copy: true, cut: true, paste: true, selectAll: true),
        onTap: _onTap,
        enableInteractiveSelection: true,
        // showCursor: true,
        // ? Because not available in stable channel
        // textScaleFactor: _scaleFactor,
        style: _themedStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts);
  }
}

extension SelectableTextExtensions on SelectableText {
  VxSelectableTextBuilder get selectableText =>
      VxSelectableTextBuilder.existing(data, style);
}
