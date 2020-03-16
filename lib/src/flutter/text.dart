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

class VelocityXTextBuilder extends VelocityXWidgetBuilder<AutoSizeText> {
  VelocityXTextBuilder(this._text);

  VelocityXTextBuilder.existing(this._text, this._textStyle);

  String _text;
  Color _color;
  String _fontFamily;
  FontWeight _fontWeight;
  TextAlign _textAlign;
  double _scaleFactor;
  double _fontSize;
  int _maxLines;
  FontStyle _fontStyle;
  TextStyle _textStyle;

  VelocityXTextBuilder text(String text) {
    _text = text;
    return this;
  }

  VelocityXTextBuilder color(Color color) {
    _color = color;
    return this;
  }

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

  VelocityXTextBuilder get white =>
      _coloredText(child: this, color: VelocityX.white);
  VelocityXTextBuilder get black =>
      _coloredText(child: this, color: VelocityX.black);

  VelocityXTextBuilder get gray100 =>
      _coloredText(child: this, color: VelocityX.gray100);
  VelocityXTextBuilder get gray200 =>
      _coloredText(child: this, color: VelocityX.gray200);
  VelocityXTextBuilder get gray300 =>
      _coloredText(child: this, color: VelocityX.gray300);
  VelocityXTextBuilder get gray400 =>
      _coloredText(child: this, color: VelocityX.gray400);
  VelocityXTextBuilder get gray500 =>
      _coloredText(child: this, color: VelocityX.gray500);
  VelocityXTextBuilder get gray600 =>
      _coloredText(child: this, color: VelocityX.gray600);
  VelocityXTextBuilder get gray700 =>
      _coloredText(child: this, color: VelocityX.gray700);
  VelocityXTextBuilder get gray800 =>
      _coloredText(child: this, color: VelocityX.gray800);
  VelocityXTextBuilder get gray900 =>
      _coloredText(child: this, color: VelocityX.gray900);

  VelocityXTextBuilder get red100 =>
      _coloredText(child: this, color: VelocityX.red100);
  VelocityXTextBuilder get red200 =>
      _coloredText(child: this, color: VelocityX.red200);
  VelocityXTextBuilder get red300 =>
      _coloredText(child: this, color: VelocityX.red300);
  VelocityXTextBuilder get red400 =>
      _coloredText(child: this, color: VelocityX.red400);
  VelocityXTextBuilder get red500 =>
      _coloredText(child: this, color: VelocityX.red500);
  VelocityXTextBuilder get red600 =>
      _coloredText(child: this, color: VelocityX.red600);
  VelocityXTextBuilder get red700 =>
      _coloredText(child: this, color: VelocityX.red700);
  VelocityXTextBuilder get red800 =>
      _coloredText(child: this, color: VelocityX.red800);
  VelocityXTextBuilder get red900 =>
      _coloredText(child: this, color: VelocityX.red900);

  VelocityXTextBuilder get orange100 =>
      _coloredText(child: this, color: VelocityX.orange100);
  VelocityXTextBuilder get orange200 =>
      _coloredText(child: this, color: VelocityX.orange200);
  VelocityXTextBuilder get orange300 =>
      _coloredText(child: this, color: VelocityX.orange300);
  VelocityXTextBuilder get orange400 =>
      _coloredText(child: this, color: VelocityX.orange400);
  VelocityXTextBuilder get orange500 =>
      _coloredText(child: this, color: VelocityX.orange500);
  VelocityXTextBuilder get orange600 =>
      _coloredText(child: this, color: VelocityX.orange600);
  VelocityXTextBuilder get orange700 =>
      _coloredText(child: this, color: VelocityX.orange700);
  VelocityXTextBuilder get orange800 =>
      _coloredText(child: this, color: VelocityX.orange800);
  VelocityXTextBuilder get orange900 =>
      _coloredText(child: this, color: VelocityX.orange900);

  VelocityXTextBuilder get yellow100 =>
      _coloredText(child: this, color: VelocityX.yellow100);
  VelocityXTextBuilder get yellow200 =>
      _coloredText(child: this, color: VelocityX.yellow200);
  VelocityXTextBuilder get yellow300 =>
      _coloredText(child: this, color: VelocityX.yellow300);
  VelocityXTextBuilder get yellow400 =>
      _coloredText(child: this, color: VelocityX.yellow400);
  VelocityXTextBuilder get yellow500 =>
      _coloredText(child: this, color: VelocityX.yellow500);
  VelocityXTextBuilder get yellow600 =>
      _coloredText(child: this, color: VelocityX.yellow600);
  VelocityXTextBuilder get yellow700 =>
      _coloredText(child: this, color: VelocityX.yellow700);
  VelocityXTextBuilder get yellow800 =>
      _coloredText(child: this, color: VelocityX.yellow800);
  VelocityXTextBuilder get yellow900 =>
      _coloredText(child: this, color: VelocityX.yellow900);

  VelocityXTextBuilder get green100 =>
      _coloredText(child: this, color: VelocityX.green100);
  VelocityXTextBuilder get green200 =>
      _coloredText(child: this, color: VelocityX.green200);
  VelocityXTextBuilder get green300 =>
      _coloredText(child: this, color: VelocityX.green300);
  VelocityXTextBuilder get green400 =>
      _coloredText(child: this, color: VelocityX.green400);
  VelocityXTextBuilder get green500 =>
      _coloredText(child: this, color: VelocityX.green500);
  VelocityXTextBuilder get green600 =>
      _coloredText(child: this, color: VelocityX.green600);
  VelocityXTextBuilder get green700 =>
      _coloredText(child: this, color: VelocityX.green700);
  VelocityXTextBuilder get green800 =>
      _coloredText(child: this, color: VelocityX.green800);
  VelocityXTextBuilder get green900 =>
      _coloredText(child: this, color: VelocityX.green900);

  VelocityXTextBuilder get teal100 =>
      _coloredText(child: this, color: VelocityX.teal100);
  VelocityXTextBuilder get teal200 =>
      _coloredText(child: this, color: VelocityX.teal200);
  VelocityXTextBuilder get teal300 =>
      _coloredText(child: this, color: VelocityX.teal300);
  VelocityXTextBuilder get teal400 =>
      _coloredText(child: this, color: VelocityX.teal400);
  VelocityXTextBuilder get teal500 =>
      _coloredText(child: this, color: VelocityX.teal500);
  VelocityXTextBuilder get teal600 =>
      _coloredText(child: this, color: VelocityX.teal600);
  VelocityXTextBuilder get teal700 =>
      _coloredText(child: this, color: VelocityX.teal700);
  VelocityXTextBuilder get teal800 =>
      _coloredText(child: this, color: VelocityX.teal800);
  VelocityXTextBuilder get teal900 =>
      _coloredText(child: this, color: VelocityX.teal900);

  VelocityXTextBuilder get blue100 =>
      _coloredText(child: this, color: VelocityX.blue100);
  VelocityXTextBuilder get blue200 =>
      _coloredText(child: this, color: VelocityX.blue200);
  VelocityXTextBuilder get blue300 =>
      _coloredText(child: this, color: VelocityX.blue300);
  VelocityXTextBuilder get blue400 =>
      _coloredText(child: this, color: VelocityX.blue400);
  VelocityXTextBuilder get blue500 =>
      _coloredText(child: this, color: VelocityX.blue500);
  VelocityXTextBuilder get blue600 =>
      _coloredText(child: this, color: VelocityX.blue600);
  VelocityXTextBuilder get blue700 =>
      _coloredText(child: this, color: VelocityX.blue700);
  VelocityXTextBuilder get blue800 =>
      _coloredText(child: this, color: VelocityX.blue800);
  VelocityXTextBuilder get blue900 =>
      _coloredText(child: this, color: VelocityX.blue900);

  VelocityXTextBuilder get indigo100 =>
      _coloredText(child: this, color: VelocityX.indigo100);
  VelocityXTextBuilder get indigo200 =>
      _coloredText(child: this, color: VelocityX.indigo200);
  VelocityXTextBuilder get indigo300 =>
      _coloredText(child: this, color: VelocityX.indigo300);
  VelocityXTextBuilder get indigo400 =>
      _coloredText(child: this, color: VelocityX.indigo400);
  VelocityXTextBuilder get indigo500 =>
      _coloredText(child: this, color: VelocityX.indigo500);
  VelocityXTextBuilder get indigo600 =>
      _coloredText(child: this, color: VelocityX.indigo600);
  VelocityXTextBuilder get indigo700 =>
      _coloredText(child: this, color: VelocityX.indigo700);
  VelocityXTextBuilder get indigo800 =>
      _coloredText(child: this, color: VelocityX.indigo800);
  VelocityXTextBuilder get indigo900 =>
      _coloredText(child: this, color: VelocityX.indigo900);

  VelocityXTextBuilder get purple100 =>
      _coloredText(child: this, color: VelocityX.purple100);
  VelocityXTextBuilder get purple200 =>
      _coloredText(child: this, color: VelocityX.purple200);
  VelocityXTextBuilder get purple300 =>
      _coloredText(child: this, color: VelocityX.purple300);
  VelocityXTextBuilder get purple400 =>
      _coloredText(child: this, color: VelocityX.purple400);
  VelocityXTextBuilder get purple500 =>
      _coloredText(child: this, color: VelocityX.purple500);
  VelocityXTextBuilder get purple600 =>
      _coloredText(child: this, color: VelocityX.purple600);
  VelocityXTextBuilder get purple700 =>
      _coloredText(child: this, color: VelocityX.purple700);
  VelocityXTextBuilder get purple800 =>
      _coloredText(child: this, color: VelocityX.purple800);
  VelocityXTextBuilder get purple900 =>
      _coloredText(child: this, color: VelocityX.purple900);

  VelocityXTextBuilder get pink100 =>
      _coloredText(child: this, color: VelocityX.pink100);
  VelocityXTextBuilder get pink200 =>
      _coloredText(child: this, color: VelocityX.pink200);
  VelocityXTextBuilder get pink300 =>
      _coloredText(child: this, color: VelocityX.pink300);
  VelocityXTextBuilder get pink400 =>
      _coloredText(child: this, color: VelocityX.pink400);
  VelocityXTextBuilder get pink500 =>
      _coloredText(child: this, color: VelocityX.pink500);
  VelocityXTextBuilder get pink600 =>
      _coloredText(child: this, color: VelocityX.pink600);
  VelocityXTextBuilder get pink700 =>
      _coloredText(child: this, color: VelocityX.pink700);
  VelocityXTextBuilder get pink800 =>
      _coloredText(child: this, color: VelocityX.pink800);
  VelocityXTextBuilder get pink900 =>
      _coloredText(child: this, color: VelocityX.pink900);

  VelocityXTextBuilder get transparent => this.._color = Colors.transparent;

  VelocityXTextBuilder _coloredText(
      {@required String color, @required VelocityXTextBuilder child}) {
    _color = VelocityX.hexToColor(color);
    return this;
  }

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

  @override
  AutoSizeText build() {
    return AutoSizeText(
      _text,
      textAlign: _textAlign,
      maxLines: _maxLines,
      textScaleFactor: _scaleFactor,
      softWrap: true,
      style: _textStyle?.copyWith(
            color: _color,
            fontSize: _fontSize ?? 14.0,
            fontStyle: _fontStyle ?? FontStyle.normal,
            fontFamily: _fontFamily,
            fontWeight: _fontWeight,
          ) ??
          TextStyle(
            color: _color,
            fontSize: _fontSize ?? 14.0,
            fontStyle: _fontStyle ?? FontStyle.normal,
            fontFamily: _fontFamily,
            fontWeight: _fontWeight,
          ),
    );
  }
}

extension TextExtensions on Text {
  VelocityXTextBuilder get text => VelocityXTextBuilder.existing(data, style);
}
