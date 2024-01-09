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
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/velocity_xx.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';

/// A run of selectable text with a single style.
///
/// The [SelectableText] widget displays a string of text with a single style.
/// The string might break across multiple lines or might all be displayed on
/// the same line depending on the layout constraints.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=ZSU3ZXOs6hc}
///
/// The [style] argument is optional. When omitted, the text will use the style
/// from the closest enclosing [DefaultTextStyle]. If the given style's
/// [TextStyle.inherit] property is true (the default), the given style will
/// be merged with the closest enclosing [DefaultTextStyle]. This merging
/// behavior is useful, for example, to make the text bold while using the
/// default font family and size.
///
/// {@tool snippet}
///
/// ```dart
/// SelectableText(
///   'Hello! How are you?',
///   textAlign: TextAlign.center,
///   style: TextStyle(fontWeight: FontWeight.bold),
/// )
/// ```
/// {@end-tool}
///
@protected
class VxSelectableTextBuilder extends VxWidgetBuilder<SelectableText>
    with VxColorMixin<VxSelectableTextBuilder> {
  VxSelectableTextBuilder(String this._text) {
    setChildToColor(this);
  }

  VxSelectableTextBuilder.existing(String this._text, this._textStyle) {
    setChildToColor(this);
  }

  String? _text, _fontFamily;
  FontWeight? _fontWeight;
  TextAlign? _textAlign;
  double? _fontSize, _letterSpacing, _lineHeight, _scaleFactor, _wordSpacing;
  int? _maxLines;
  FontStyle? _fontStyle;
  TextStyle? _textStyle;
  TextDecoration? _decoration;
  Function? _onTap;
  Widget Function(BuildContext, EditableTextState)? _contextMenuBuilder;
  TextStyle? _themedStyle;
  StrutStyle? _strutStyle;
  bool? _showCursor;
  TextBaseline? _textBaseline;

  /// Creates a selectable text widget.
  ///
  VxSelectableTextBuilder selectableText(String text) {
    _text = text;
    return this;
  }

  /// Set [color] of the text
  VxSelectableTextBuilder color(Color color) {
    velocityColor = color;
    return this;
  }

  /// Set [color] of the text using hexvalue
  VxSelectableTextBuilder hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be resized according
  /// to the specified bounds and if necessary truncated according to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  VxSelectableTextBuilder maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  /// Set [fontFamily] for the text
  VxSelectableTextBuilder fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  /// The common baseline that should be aligned between this text span and its
  /// parent text span, or, for the root text spans, with the line box.
  VxSelectableTextBuilder textBaseLine(TextBaseline baseline) {
    _textBaseline = baseline;
    return this;
  }

  /// The amount of space (in logical pixels) to add at each sequence of
  /// white-space (i.e. between each word). A negative value can be used to
  /// bring the words closer.
  VxSelectableTextBuilder wordSpacing(double spacing) {
    _wordSpacing = spacing;
    return this;
  }

  /// Use textStyle to provide custom or any theme style.
  ///
  /// If the style's 'inherit' property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  VxSelectableTextBuilder textStyle(TextStyle style) {
    _themedStyle = style;
    return this;
  }

  /// The strut style to use. Strut style defines the strut, which sets minimum
  /// vertical layout metrics.
  ///
  /// Omitting or providing null will disable strut.
  ///
  /// Omitting or providing null for any properties of [StrutStyle] will result in
  /// default values being used. It is highly recommended to at least specify a
  /// font size.
  ///
  /// See [StrutStyle] for details.
  VxSelectableTextBuilder strutStyle(StrutStyle style) {
    _strutStyle = style;
    return this;
  }

  /// {@macro flutter.widgets.editableText.showCursor}
  VxSelectableTextBuilder showCursor(bool showCursor) {
    _showCursor = showCursor;
    return this;
  }

  /// How the text should be aligned horizontally.
  ///
  /// To align text in [center]
  VxSelectableTextBuilder get center => this.._textAlign = TextAlign.center;

  /// To align text in [start]
  VxSelectableTextBuilder get start => this.._textAlign = TextAlign.start;

  /// To align text in [end]
  VxSelectableTextBuilder get end => this.._textAlign = TextAlign.end;

  /// To align text as [justify]
  VxSelectableTextBuilder get justify => this.._textAlign = TextAlign.justify;

  /// To set fontSize of the text using [size]
  VxSelectableTextBuilder size(double? size) => this.._fontSize = size;

  /// Sets [textScaleFactor] to extra small i.e. 0.75
  VxSelectableTextBuilder get xs =>
      _fontSizedText(child: this, scaleFactor: 0.75);

  /// Sets [textScaleFactor] to small i.e. 0.875
  VxSelectableTextBuilder get sm =>
      _fontSizedText(child: this, scaleFactor: 0.875);

  /// Sets [textScaleFactor] to base i.e. 1 or default
  VxSelectableTextBuilder get base =>
      _fontSizedText(child: this, scaleFactor: 1);

  /// Sets [textScaleFactor] to large i.e. 1.125
  VxSelectableTextBuilder get lg =>
      _fontSizedText(child: this, scaleFactor: 1.125);

  /// Sets [textScaleFactor] to extra large i.e. 1.25
  VxSelectableTextBuilder get xl =>
      _fontSizedText(child: this, scaleFactor: 1.25);

  /// Sets [textScaleFactor] to twice extra large i.e. 1.5
  VxSelectableTextBuilder get xl2 =>
      _fontSizedText(child: this, scaleFactor: 1.5);

  /// Sets [textScaleFactor] to thrice extra large i.e. 1.875
  VxSelectableTextBuilder get xl3 =>
      _fontSizedText(child: this, scaleFactor: 1.875);

  /// Sets [textScaleFactor] to four times extra large i.e. 2.25
  VxSelectableTextBuilder get xl4 =>
      _fontSizedText(child: this, scaleFactor: 2.25);

  /// Sets [textScaleFactor] to five times extra large i.e. 3
  VxSelectableTextBuilder get xl5 =>
      _fontSizedText(child: this, scaleFactor: 3);

  /// Sets [textScaleFactor] to six times extra large i.e. 4
  VxSelectableTextBuilder get xl6 =>
      _fontSizedText(child: this, scaleFactor: 4);

  VxSelectableTextBuilder _fontSizedText(
      {required double scaleFactor, required VxSelectableTextBuilder child}) {
    _scaleFactor = scaleFactor;
    return this;
  }

  /// Sets [FontWeight] to [FontWeight.w100]
  VxSelectableTextBuilder get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  /// Sets [FontWeight] to [FontWeight.w200]
  VxSelectableTextBuilder get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  /// Sets [FontWeight] to [FontWeight.w300]
  VxSelectableTextBuilder get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  /// Sets [FontWeight] to [FontWeight.w400]
  VxSelectableTextBuilder get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  /// Sets [FontWeight] to [FontWeight.w500]
  VxSelectableTextBuilder get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  /// Sets [FontWeight] to [FontWeight.w600]
  VxSelectableTextBuilder get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  /// Sets [FontWeight] to [FontWeight.w700]
  VxSelectableTextBuilder get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  /// Sets [FontWeight] to [FontWeight.w800]
  VxSelectableTextBuilder get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  /// Sets [FontWeight] to [FontWeight.w900]
  VxSelectableTextBuilder get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VxSelectableTextBuilder _fontWeightedText(
      {required FontWeight weight, required VxSelectableTextBuilder child}) {
    _fontWeight = weight;
    return this;
  }

  /// Sets [FontStyle] to [FontStyle.italic]
  VxSelectableTextBuilder get italic => this.._fontStyle = FontStyle.italic;

  /// Sets [letterSpacing] to -3.0
  VxSelectableTextBuilder get tightest => this.._letterSpacing = -3.0;

  /// Sets [letterSpacing] to -2.0
  VxSelectableTextBuilder get tighter => this.._letterSpacing = -2.0;

  /// Sets [letterSpacing] to -1.0
  VxSelectableTextBuilder get tight => this.._letterSpacing = -1.0;

  /// Sets [letterSpacing] to 1.0
  VxSelectableTextBuilder get wide => this.._letterSpacing = 1.0;

  /// Sets [letterSpacing] to 2.0
  VxSelectableTextBuilder get wider => this.._letterSpacing = 2.0;

  /// Sets [letterSpacing] to 3.0
  VxSelectableTextBuilder get widest => this.._letterSpacing = 3.0;

  /// Sets custom [letterSpacing] with [val]
  VxSelectableTextBuilder letterSpacing(double val) =>
      this.._letterSpacing = val;

  /// Sets [TextDecoration] as [TextDecoration.underline]
  VxSelectableTextBuilder get underline =>
      this.._decoration = TextDecoration.underline;

  /// Sets [TextDecoration] as [TextDecoration.lineThrough]
  VxSelectableTextBuilder get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  /// Sets [TextDecoration] as [TextDecoration.overline]
  VxSelectableTextBuilder get overline =>
      this.._decoration = TextDecoration.overline;

  /// Converts the text to fully uppercase.
  VxSelectableTextBuilder get uppercase => this.._text = _text!.toUpperCase();

  /// Converts the text to fully lowercase.
  VxSelectableTextBuilder get lowercase => this.._text = _text!.toLowerCase();

  /// Converts the text to first letter of very word as uppercase.
  VxSelectableTextBuilder get capitalize =>
      this.._text = _text!.allWordsCapitilize();

  /// Converts the text to partially hideen text. Best for sensitive data.
  VxSelectableTextBuilder get hidePartial => this.._text = _text!.hidePartial();

  /// Sets [lineHeight] to 0.75
  VxSelectableTextBuilder get heightTight => this.._lineHeight = 0.75;

  /// Sets [lineHeight] to 0.875
  VxSelectableTextBuilder get heightSnug => this.._lineHeight = 0.875;

  /// Sets [lineHeight] to 1.25
  VxSelectableTextBuilder get heightRelaxed => this.._lineHeight = 1.25;

  /// Sets [lineHeight] to 1.5
  VxSelectableTextBuilder get heightLoose => this.._lineHeight = 1.5;

  /// Sets custom [lineHeight] with [val]
  VxSelectableTextBuilder lineHeight(double val) => this.._lineHeight = val;

  /// Called when the user taps on this selectable text.
  ///
  /// The selectable text builds a [GestureDetector] to handle input events like tap,
  /// to trigger focus requests, to move the caret, adjust the selection, etc.
  /// Handling some of those events by wrapping the selectable text with a competing
  /// GestureDetector is problematic.
  ///
  /// To unconditionally handle taps, without interfering with the selectable text's
  /// internal gesture detector, provide this callback.
  ///
  /// To be notified when the text field gains or loses the focus, provide a
  /// [focusNode] and add a listener to that.
  ///
  /// To listen to arbitrary pointer events without competing with the
  /// selectable text's internal gesture detector, use a [Listener].
  VxSelectableTextBuilder onTap(Function tap) => this.._onTap = tap;

  //Added context menu builder
  VxSelectableTextBuilder contextMenuBuilder(
          Widget Function(BuildContext, EditableTextState) menuBuilder) =>
      this.._contextMenuBuilder = menuBuilder;

  @override
  SelectableText make({Key? key}) {
    final ts = TextStyle(
      color: velocityColor,
      fontSize: _fontSize,
      fontStyle: _fontStyle,
      fontFamily: _fontFamily,
      fontWeight: _fontWeight,
      letterSpacing: _letterSpacing,
      decoration: _decoration,
      height: _lineHeight,
      textBaseline: _textBaseline ?? TextBaseline.alphabetic,
      wordSpacing: _wordSpacing,
    );
    return SelectableText(
      _text!,
      key: key,
      textAlign: _textAlign,
      maxLines: _maxLines,
      onTap: _onTap as void Function()?,
      enableInteractiveSelection: true,
      showCursor: _showCursor ?? false,
      textScaler:
          _scaleFactor == null ? null : TextScaler.linear(_scaleFactor!),
      style: _themedStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
      strutStyle: _strutStyle,
      contextMenuBuilder: _contextMenuBuilder,
    );
  }
}

extension VxSelectableTextExtensions on SelectableText {
  ///
  /// Extension method to directly access [VxSelectableTextBuilder] with any widget without wrapping or with dot operator.
  ///
  VxSelectableTextBuilder get selectableText =>
      VxSelectableTextBuilder.existing(data!, style);
}
