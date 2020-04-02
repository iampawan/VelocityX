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
import 'package:velocity_x/src/flutter/velocityx_mixins/text_align_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/text_style_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';

@protected
class VelocityXSelectableTextBuilder
    extends VelocityXWidgetBuilder<SelectableText>
    with
        VelocityColorMixin<VelocityXSelectableTextBuilder>,
        VelocityTextStyleMixin<VelocityXSelectableTextBuilder>,
        VelocityTextAlignMixin<VelocityXSelectableTextBuilder> {
  VelocityXSelectableTextBuilder(this._text) : assert(_text != null) {
    setChildToColor(this);
    setChildForTextStyling(this);
    setChildForTextAlign(this);
  }

  VelocityXSelectableTextBuilder.existing(this._text, this._textStyle)
      : assert(_text != null) {
    setChildToColor(this);
    setChildForTextStyling(this);
    setChildForTextAlign(this);
  }

  String _text;
  int _maxLines;
  TextStyle _textStyle;
  Function _onTap;

  VelocityXSelectableTextBuilder selectableText(String text) {
    _text = text;
    return this;
  }

  VelocityXSelectableTextBuilder color(Color color) {
    velocityColor = color;
    return this;
  }

  VelocityXSelectableTextBuilder hexColor(String colorHex) =>
      this..velocityColor = VelocityX.hexToColor(colorHex);

  VelocityXSelectableTextBuilder maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  VelocityXSelectableTextBuilder get uppercase =>
      this.._text = _text.toUpperCase();

  VelocityXSelectableTextBuilder get lowercase =>
      this.._text = _text.toLowerCase();

  VelocityXSelectableTextBuilder get capitalize =>
      this.._text = _text.allWordsCapitilize();

  VelocityXSelectableTextBuilder get hidePartial =>
      this.._text = _text.hidePartial();

  VelocityXSelectableTextBuilder onTap(Function _tap) => this.._onTap = _tap;

  @override
  SelectableText make({Key key}) {
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
    return SelectableText(
      _text,
      key: key,
      textAlign: velocityTextAlign,
      maxLines: _maxLines,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
      onTap: _onTap,
      enableInteractiveSelection: true,
      // showCursor: true,
      // ? Because not available in stable channel
      // textScaleFactor: _scaleFactor,
      style: velocityTextStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
    );
  }
}

extension SelectableTextExtensions on SelectableText {
  VelocityXSelectableTextBuilder get selectableText =>
      VelocityXSelectableTextBuilder.existing(data, style);
}
