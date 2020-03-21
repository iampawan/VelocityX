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
class VelocityXSelectableTextBuilder extends VelocityXWidgetBuilder<SelectableText> with VelocityColorMixin<VelocityXSelectableTextBuilder> {
  VelocityXSelectableTextBuilder(this._text) : assert(_text != null) {
    setChildToColor(this);
  }

  VelocityXSelectableTextBuilder.existing(this._text, this._textStyle) : assert(_text != null) {
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
  Function _onTap;

  VelocityXSelectableTextBuilder selectableText(String text) {
    _text = text;
    return this;
  }

  VelocityXSelectableTextBuilder color(Color color) {
    velocityColor = color;
    return this;
  }

  VelocityXSelectableTextBuilder hexColor(String colorHex) => this..velocityColor = VelocityX.hexToColor(colorHex);

  VelocityXSelectableTextBuilder maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  VelocityXSelectableTextBuilder fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  VelocityXSelectableTextBuilder get center => this.._textAlign = TextAlign.center;
  VelocityXSelectableTextBuilder get start => this.._textAlign = TextAlign.start;
  VelocityXSelectableTextBuilder get end => this.._textAlign = TextAlign.end;
  VelocityXSelectableTextBuilder get justify => this.._textAlign = TextAlign.justify;

  VelocityXSelectableTextBuilder size(double size) => this.._fontSize = size;

  VelocityXSelectableTextBuilder get xs => _fontSizedText(child: this, scaleFactor: 0.75);

  VelocityXSelectableTextBuilder get sm => _fontSizedText(child: this, scaleFactor: 0.875);

  VelocityXSelectableTextBuilder get base => _fontSizedText(child: this, scaleFactor: 1);

  VelocityXSelectableTextBuilder get lg => _fontSizedText(child: this, scaleFactor: 1.125);

  VelocityXSelectableTextBuilder get xl => _fontSizedText(child: this, scaleFactor: 1.25);

  VelocityXSelectableTextBuilder get xl2 => _fontSizedText(child: this, scaleFactor: 1.5);

  VelocityXSelectableTextBuilder get xl3 => _fontSizedText(child: this, scaleFactor: 1.875);

  VelocityXSelectableTextBuilder get xl4 => _fontSizedText(child: this, scaleFactor: 2.25);

  VelocityXSelectableTextBuilder get xl5 => _fontSizedText(child: this, scaleFactor: 3);

  VelocityXSelectableTextBuilder get xl6 => _fontSizedText(child: this, scaleFactor: 4);

  VelocityXSelectableTextBuilder _fontSizedText({@required double scaleFactor, @required VelocityXSelectableTextBuilder child}) {
    _scaleFactor = scaleFactor;
    return this;
  }

  VelocityXSelectableTextBuilder get hairLine => _fontWeightedText(child: this, weight: FontWeight.w100);

  VelocityXSelectableTextBuilder get thin => _fontWeightedText(child: this, weight: FontWeight.w200);

  VelocityXSelectableTextBuilder get light => _fontWeightedText(child: this, weight: FontWeight.w300);

  VelocityXSelectableTextBuilder get normal => _fontWeightedText(child: this, weight: FontWeight.w400);

  VelocityXSelectableTextBuilder get medium => _fontWeightedText(child: this, weight: FontWeight.w500);

  VelocityXSelectableTextBuilder get semiBold => _fontWeightedText(child: this, weight: FontWeight.w600);

  VelocityXSelectableTextBuilder get bold => _fontWeightedText(child: this, weight: FontWeight.w700);

  VelocityXSelectableTextBuilder get extraBold => _fontWeightedText(child: this, weight: FontWeight.w800);

  VelocityXSelectableTextBuilder get extraBlack => _fontWeightedText(child: this, weight: FontWeight.w900);

  VelocityXSelectableTextBuilder _fontWeightedText({@required FontWeight weight, @required VelocityXSelectableTextBuilder child}) {
    _fontWeight = weight;
    return this;
  }

  VelocityXSelectableTextBuilder get italic => this.._fontStyle = FontStyle.italic;

  VelocityXSelectableTextBuilder get tightest => this.._letterSpacing = -3.0;
  VelocityXSelectableTextBuilder get tighter => this.._letterSpacing = -2.0;
  VelocityXSelectableTextBuilder get tight => this.._letterSpacing = -1.0;
  VelocityXSelectableTextBuilder get wide => this.._letterSpacing = 1.0;
  VelocityXSelectableTextBuilder get wider => this.._letterSpacing = 2.0;
  VelocityXSelectableTextBuilder get widest => this.._letterSpacing = 3.0;

  VelocityXSelectableTextBuilder letterSpacing(double val) => this.._letterSpacing = val;

  VelocityXSelectableTextBuilder get underline => this.._decoration = TextDecoration.underline;

  VelocityXSelectableTextBuilder get lineThrough => this.._decoration = TextDecoration.lineThrough;

  VelocityXSelectableTextBuilder get overline => this.._decoration = TextDecoration.overline;

  VelocityXSelectableTextBuilder get uppercase => this.._text = _text.toUpperCase();
  VelocityXSelectableTextBuilder get lowercase => this.._text = _text.toLowerCase();
  VelocityXSelectableTextBuilder get capitalize => this.._text = _text.allWordsCapitilize();
  VelocityXSelectableTextBuilder get hidePartial => this.._text = _text.hidePartial();

  VelocityXSelectableTextBuilder get heightTight => this.._lineHeight = 0.75;
  VelocityXSelectableTextBuilder get heightSnug => this.._lineHeight = 0.875;
  VelocityXSelectableTextBuilder get heightRelaxed => this.._lineHeight = 1.25;
  VelocityXSelectableTextBuilder get heightLoose => this.._lineHeight = 1.5;
  VelocityXSelectableTextBuilder lineHeight(double val) => this.._lineHeight = val;

  VelocityXSelectableTextBuilder onTap(Function _tap) => this.._onTap = _tap;

  @override
  SelectableText make({Key key}) {
    return SelectableText(
      _text,
      key: key,
      textAlign: _textAlign,
      maxLines: _maxLines,
      toolbarOptions: const ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      onTap: _onTap,
      enableInteractiveSelection: true,

      // showCursor: true,
      // textScaleFactor: _scaleFactor,
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

extension SelectableTextExtensions on SelectableText {
  VelocityXSelectableTextBuilder get selectableText => VelocityXSelectableTextBuilder.existing(data, style);
}
