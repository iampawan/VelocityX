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

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/builder.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/color_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/render_mixin.dart';
import 'package:velocity_x/src/velocity_xx.dart';

import 'nothing.dart';

/// Creates a [AutoSizeText] widget with a [TextSpan].
@protected
class VxRichText extends VxWidgetBuilder<Widget>
    with VxColorMixin<VxRichText>, VxRenderMixin<VxRichText> {
  VxRichText(String this._text) {
    setChildToColor(this);
    setChildForRender(this);
  }

  VxRichText.existing(String this._text, this._textStyle) {
    setChildToColor(this);
  }

  String? _text, _fontFamily;
  List<TextSpan>? _textSpanChildren;
  FontWeight? _fontWeight;
  TextAlign? _textAlign;
  double? _scaleFactor,
      _wordSpacing,
      _fontSize,
      _letterSpacing,
      _lineHeight,
      _maxFontSize,
      _stepGranularity,
      _minFontSize;
  int? _maxLines;
  FontStyle? _fontStyle;
  TextDecoration? _decoration;
  GestureRecognizer? _gestureRecognizer;
  TextStyle? _textStyle, _themedStyle;
  StrutStyle? _strutStyle;
  TextOverflow? _overflow;
  TextBaseline? _textBaseline;
  Widget? _replacement;
  bool? _softWrap, _wrapWords;
  bool _isIntrinsic = false;

  /// Set tap func
  VxRichText tap(Function function) {
    final recognizer = TapGestureRecognizer()
      ..onTap = function as void Function()?;
    return this.._gestureRecognizer = recognizer;
  }

  /// Set doubleTap func
  VxRichText doubleTap(Function function) {
    final recognizer = DoubleTapGestureRecognizer()
      ..onDoubleTap = function as void Function()?;
    return this.._gestureRecognizer = recognizer;
  }

  /// Set children with list of text spans
  VxRichText withTextSpanChildren(List<TextSpan> children) {
    _textSpanChildren = children;
    return this;
  }

  /// Set [color] of the text
  VxRichText color(Color color) {
    velocityColor = color;
    return this;
  }

  /// Set [color] of the text using hexvalue
  VxRichText hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  /// [LayoutBuilder] does not support using IntrinsicWidth or IntrinsicHeight.
  ///
  /// Note: Use it only for few widgets like [DataTable] which doesn't work well with Vx but using [isIntrinsic] will disable [AutoSizeText].
  VxRichText get isIntrinsic => this.._isIntrinsic = true;

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
  VxRichText maxLines(int lines) {
    _maxLines = lines;
    return this;
  }

  /// Set [fontFamily] for the text
  VxRichText fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  /// Use textStyle to provide custom or any theme style.
  ///
  /// If the style's 'inherit' property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  VxRichText textStyle(TextStyle? style) {
    _themedStyle = style;
    return this;
  }

  ///
  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  VxRichText minFontSize(double minFontSize) {
    _minFontSize = minFontSize;
    return this;
  }

  ///
  ///  The maximum text size constraint to be used when auto-sizing text.
  ///
  VxRichText maxFontSize(double maxFontSize) {
    _maxFontSize = maxFontSize;
    return this;
  }

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  VxRichText stepGranularity(double stepGranularity) {
    _stepGranularity = stepGranularity;
    return this;
  }

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  VxRichText overflowReplacement(Widget overflowReplacement) {
    _replacement = overflowReplacement;
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
  VxRichText strutStyle(StrutStyle? style) {
    _strutStyle = style;
    return this;
  }

  // Give custom text alignment
  VxRichText align(TextAlign align) => this.._textAlign = align;

  /// How the text should be aligned horizontally.
  ///
  /// To align text in [center]
  VxRichText get center => this.._textAlign = TextAlign.center;

  /// To align text in [start]
  VxRichText get start => this.._textAlign = TextAlign.start;

  /// To align text in [end]
  VxRichText get end => this.._textAlign = TextAlign.end;

  /// To align text as [justify]
  VxRichText get justify => this.._textAlign = TextAlign.justify;

  /// To overlow text as [fade]
  VxRichText get fade => this.._overflow = TextOverflow.fade;

  /// To overlow text as [ellipsis]
  VxRichText get ellipsis => this.._overflow = TextOverflow.ellipsis;

  /// To overlow text as [visible]
  VxRichText get visible => this.._overflow = TextOverflow.visible;

  /// To set fontSize of the text using [size]
  VxRichText size(double size) => this.._fontSize = size;

  /// Sets [TextTheme] display large
  VxRichText displayLarge(BuildContext context) {
    _themedStyle = context.textTheme.displayLarge;
    return this;
  }

  /// Sets [TextTheme] display medium
  VxRichText displayMedium(BuildContext context) {
    _themedStyle = context.textTheme.displayMedium;
    return this;
  }

  /// Sets [TextTheme] display small
  VxRichText displaySmall(BuildContext context) {
    _themedStyle = context.textTheme.displaySmall;
    return this;
  }

  /// Sets [TextTheme] headline large
  VxRichText headlineLarge(BuildContext context) {
    _themedStyle = context.textTheme.headlineLarge;
    return this;
  }

  /// Sets [TextTheme] headline medium
  VxRichText headlineMedium(BuildContext context) {
    _themedStyle = context.textTheme.headlineMedium;
    return this;
  }

  /// Sets [TextTheme] headline small
  VxRichText headlineSmall(BuildContext context) {
    _themedStyle = context.textTheme.headlineSmall;
    return this;
  }

  /// Sets [TextTheme] title large
  VxRichText titleLarge(BuildContext context) {
    _themedStyle = context.textTheme.titleLarge;
    return this;
  }

  /// Sets [TextTheme] title medium
  VxRichText titleMedium(BuildContext context) {
    _themedStyle = context.textTheme.titleMedium;
    return this;
  }

  /// Sets [TextTheme] title small
  VxRichText titleSmall(BuildContext context) {
    _themedStyle = context.textTheme.titleSmall;
    return this;
  }

  /// Sets [TextTheme] body large
  VxRichText bodyLarge(BuildContext context) {
    _themedStyle = context.textTheme.bodyLarge;
    return this;
  }

  /// Sets [TextTheme] body medium
  VxRichText bodyMedium(BuildContext context) {
    _themedStyle = context.textTheme.bodyMedium;
    return this;
  }

  /// Sets [TextTheme] body small
  VxRichText bodySmall(BuildContext context) {
    _themedStyle = context.textTheme.bodySmall;
    return this;
  }

  /// Sets [TextTheme] label large
  VxRichText labelLarge(BuildContext context) {
    _themedStyle = context.textTheme.labelLarge;
    return this;
  }

  /// Sets [TextTheme] label medium
  VxRichText labelMedium(BuildContext context) {
    _themedStyle = context.textTheme.labelMedium;
    return this;
  }

  /// Sets [TextTheme] label small
  VxRichText labelSmall(BuildContext context) {
    _themedStyle = context.textTheme.labelSmall;
    return this;
  }

  /// Sets [textScaleFactor] to extra small i.e. 0.75
  VxRichText get xs => _fontSizedText(child: this, scaleFactor: 0.75);

  /// Sets [textScaleFactor] to small i.e. 0.875
  VxRichText get sm => _fontSizedText(child: this, scaleFactor: 0.875);

  /// Sets [textScaleFactor] to base i.e. 1 or default
  VxRichText get base => _fontSizedText(child: this, scaleFactor: 1);

  /// Sets [textScaleFactor] to large i.e. 1.125
  VxRichText get lg => _fontSizedText(child: this, scaleFactor: 1.125);

  /// Sets [textScaleFactor] to extra large i.e. 1.25
  VxRichText get xl => _fontSizedText(child: this, scaleFactor: 1.25);

  /// Sets [textScaleFactor] to twice extra large i.e. 1.5
  VxRichText get xl2 => _fontSizedText(child: this, scaleFactor: 1.5);

  /// Sets [textScaleFactor] to thrice extra large i.e. 1.875
  VxRichText get xl3 => _fontSizedText(child: this, scaleFactor: 1.875);

  /// Sets [textScaleFactor] to four times extra large i.e. 2.25
  VxRichText get xl4 => _fontSizedText(child: this, scaleFactor: 2.25);

  /// Sets [textScaleFactor] to five times extra large i.e. 3
  VxRichText get xl5 => _fontSizedText(child: this, scaleFactor: 3);

  /// Sets [textScaleFactor] to six times extra large i.e. 4
  VxRichText get xl6 => _fontSizedText(child: this, scaleFactor: 4);

  /// Sets [textScaleFactor] to custom value
  VxRichText scale(double value) =>
      _fontSizedText(child: this, scaleFactor: value);

  VxRichText _fontSizedText(
      {required double scaleFactor, required VxRichText child}) {
    _scaleFactor = scaleFactor;
    return this;
  }

  /// The common baseline that should be aligned between this text span and its
  /// parent text span, or, for the root text spans, with the line box.
  VxRichText textBaseLine(TextBaseline baseline) {
    _textBaseline = baseline;
    return this;
  }

  /// The amount of space (in logical pixels) to add at each sequence of
  /// white-space (i.e. between each word). A negative value can be used to
  /// bring the words closer.
  VxRichText wordSpacing(double spacing) {
    _wordSpacing = spacing;
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
      {required FontWeight weight, required VxRichText child}) {
    _fontWeight = weight;
    return this;
  }

  /// Sets [FontStyle] to [FontStyle.italic]
  VxRichText get italic => this.._fontStyle = FontStyle.italic;

  /// Sets [letterSpacing] to -3.0
  VxRichText get tightest => this.._letterSpacing = -3.0;

  /// Sets [letterSpacing] to -2.0
  VxRichText get tighter => this.._letterSpacing = -2.0;

  /// Sets [letterSpacing] to -1.0
  VxRichText get tight => this.._letterSpacing = -1.0;

  /// Sets [letterSpacing] to 1.0
  VxRichText get wide => this.._letterSpacing = 1.0;

  /// Sets [letterSpacing] to 2.0
  VxRichText get wider => this.._letterSpacing = 2.0;

  /// Sets [letterSpacing] to 3.0
  VxRichText get widest => this.._letterSpacing = 3.0;

  /// Sets custom [letterSpacing] with [val]
  VxRichText letterSpacing(double val) => this.._letterSpacing = val;

  /// Sets [TextDecoration] as [TextDecoration.underline]
  VxRichText get underline => this.._decoration = TextDecoration.underline;

  /// Sets [TextDecoration] as [TextDecoration.lineThrough]
  VxRichText get lineThrough => this.._decoration = TextDecoration.lineThrough;

  /// Sets [TextDecoration] as [TextDecoration.overline]
  VxRichText get overline => this.._decoration = TextDecoration.overline;

  /// Converts the text to fully uppercase.
  VxRichText get uppercase => this.._text = _text!.toUpperCase();

  /// Converts the text to fully lowercase.
  VxRichText get lowercase => this.._text = _text!.toLowerCase();

  /// Converts the text to first letter of very word as uppercase.
  VxRichText get capitalize => this.._text = _text!.allWordsCapitilize();

  /// Converts the text to partially hideen text. Best for sensitive data.
  VxRichText get hidePartial => this.._text = _text!.hidePartial();

  /// Sets [lineHeight] to 0.75
  VxRichText get heightTight => this.._lineHeight = 0.75;

  /// Sets [lineHeight] to 0.875
  VxRichText get heightSnug => this.._lineHeight = 0.875;

  /// Sets [lineHeight] to 1.25
  VxRichText get heightRelaxed => this.._lineHeight = 1.25;

  /// Sets [lineHeight] to 1.5
  VxRichText get heightLoose => this.._lineHeight = 1.5;

  /// Sets custom [lineHeight] with [val]
  VxRichText lineHeight(double val) => this.._lineHeight = val;

  @override
  Widget make({Key? key}) {
    if (!willRender) return const VxNone();
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
    return _isIntrinsic
        ? Text.rich(
            TextSpan(
              text: _text,
              children: _textSpanChildren,
              recognizer: _gestureRecognizer,
              style: _themedStyle?.merge(ts) ?? _textStyle?.merge(ts) ?? ts,
            ),
            key: key,
            textAlign: _textAlign,
            maxLines: _maxLines,
            textScaler:
                _scaleFactor == null ? null : TextScaler.linear(_scaleFactor!),
            softWrap: _softWrap ?? true,
            overflow: _overflow ?? TextOverflow.clip,
            strutStyle: _strutStyle,
          )
        : AutoSizeText.rich(
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
            softWrap: _softWrap ?? true,
            minFontSize: _minFontSize ?? 12,
            maxFontSize: _maxFontSize ?? double.infinity,
            stepGranularity: _stepGranularity ?? 1,
            overflowReplacement: _replacement,
            overflow: _overflow ?? TextOverflow.clip,
            strutStyle: _strutStyle,
            wrapWords: _wrapWords ?? true,
          );
  }
}

class VelocityXTextSpan extends VxTextSpanBuilder
    with VxColorMixin<VelocityXTextSpan> {
  VelocityXTextSpan(String this._text) {
    setChildToColor(this);
  }

  String? _text, _fontFamily;
  GestureRecognizer? _gestureRecognizer;
  TextDecoration? _decoration;
  FontWeight? _fontWeight;
  double? _fontSize, _letterSpacing, _lineHeight, _wordSpacing;
  FontStyle? _fontStyle;
  List<TextSpan>? _textSpanChildren;
  TextStyle? _textStyle, _themedStyle;
  TextBaseline? _textBaseline;

  /// Set tap func
  VelocityXTextSpan tap(Function function) {
    final recognizer = TapGestureRecognizer()
      ..onTap = function as void Function()?;
    return this.._gestureRecognizer = recognizer;
  }

  /// Set doubleTap func
  VelocityXTextSpan doubleTap(Function function) {
    final recognizer = DoubleTapGestureRecognizer()
      ..onDoubleTap = function as void Function()?;
    return this.._gestureRecognizer = recognizer;
  }

  /// Set children with list of text spans
  VelocityXTextSpan withChildren(List<TextSpan> children) {
    return this.._textSpanChildren = children;
  }

  /// Set [color] of the text
  VelocityXTextSpan color(Color color) {
    velocityColor = color;
    return this;
  }

  /// Set [color] of the text using hexvalue
  VelocityXTextSpan hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  /// Set [fontFamily] for the text
  VelocityXTextSpan fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  /// The common baseline that should be aligned between this text span and its
  /// parent text span, or, for the root text spans, with the line box.
  VelocityXTextSpan textBaseLine(TextBaseline baseline) {
    _textBaseline = baseline;
    return this;
  }

  /// The amount of space (in logical pixels) to add at each sequence of
  /// white-space (i.e. between each word). A negative value can be used to
  /// bring the words closer.
  VelocityXTextSpan wordSpacing(double spacing) {
    _wordSpacing = spacing;
    return this;
  }

  /// Use textStyle to provide custom or any theme style.
  ///
  /// If the style's 'inherit' property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  VelocityXTextSpan textStyle(TextStyle style) {
    _themedStyle = style;
    return this;
  }

  /// Sets [TextTheme] display large
  VelocityXTextSpan displayLarge(BuildContext context) {
    _themedStyle = context.textTheme.displayLarge;
    return this;
  }

  /// Sets [TextTheme] display medium
  VelocityXTextSpan displayMedium(BuildContext context) {
    _themedStyle = context.textTheme.displayMedium;
    return this;
  }

  /// Sets [TextTheme] display small
  VelocityXTextSpan displaySmall(BuildContext context) {
    _themedStyle = context.textTheme.displaySmall;
    return this;
  }

  /// Sets [TextTheme] headline large
  VelocityXTextSpan headlineLarge(BuildContext context) {
    _themedStyle = context.textTheme.headlineLarge;
    return this;
  }

  /// Sets [TextTheme] headline medium
  VelocityXTextSpan headlineMedium(BuildContext context) {
    _themedStyle = context.textTheme.headlineMedium;
    return this;
  }

  /// Sets [TextTheme] headline small
  VelocityXTextSpan headlineSmall(BuildContext context) {
    _themedStyle = context.textTheme.headlineSmall;
    return this;
  }

  /// Sets [TextTheme] title large
  VelocityXTextSpan titleLarge(BuildContext context) {
    _themedStyle = context.textTheme.titleLarge;
    return this;
  }

  /// Sets [TextTheme] title medium
  VelocityXTextSpan titleMedium(BuildContext context) {
    _themedStyle = context.textTheme.titleMedium;
    return this;
  }

  /// Sets [TextTheme] title small
  VelocityXTextSpan titleSmall(BuildContext context) {
    _themedStyle = context.textTheme.titleSmall;
    return this;
  }

  /// Sets [TextTheme] body large
  VelocityXTextSpan bodyLarge(BuildContext context) {
    _themedStyle = context.textTheme.bodyLarge;
    return this;
  }

  /// Sets [TextTheme] body medium
  VelocityXTextSpan bodyMedium(BuildContext context) {
    _themedStyle = context.textTheme.bodyMedium;
    return this;
  }

  /// Sets [TextTheme] body small
  VelocityXTextSpan bodySmall(BuildContext context) {
    _themedStyle = context.textTheme.bodySmall;
    return this;
  }

  /// Sets [TextTheme] label large
  VelocityXTextSpan labelLarge(BuildContext context) {
    _themedStyle = context.textTheme.labelLarge;
    return this;
  }

  /// Sets [TextTheme] label medium
  VelocityXTextSpan labelMedium(BuildContext context) {
    _themedStyle = context.textTheme.labelMedium;
    return this;
  }

  /// Sets [TextTheme] label small
  VelocityXTextSpan labelSmall(BuildContext context) {
    _themedStyle = context.textTheme.labelSmall;
    return this;
  }

  /// Sets fontsize of the text
  VelocityXTextSpan size(double size) => this.._fontSize = size;

  /// Sets [FontWeight] to [FontWeight.w100]
  VelocityXTextSpan get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  /// Sets [FontWeight] to [FontWeight.w200]
  VelocityXTextSpan get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  /// Sets [FontWeight] to [FontWeight.w300]
  VelocityXTextSpan get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  /// Sets [FontWeight] to [FontWeight.w400]
  VelocityXTextSpan get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  /// Sets [FontWeight] to [FontWeight.w500]
  VelocityXTextSpan get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  /// Sets [FontWeight] to [FontWeight.w600]
  VelocityXTextSpan get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  /// Sets [FontWeight] to [FontWeight.w700]
  VelocityXTextSpan get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  /// Sets [FontWeight] to [FontWeight.w800]
  VelocityXTextSpan get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  /// Sets [FontWeight] to [FontWeight.w900]
  VelocityXTextSpan get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VelocityXTextSpan _fontWeightedText(
      {required FontWeight weight, required VelocityXTextSpan child}) {
    _fontWeight = weight;
    return this;
  }

  /// Sets [FontStyle] to [FontStyle.italic]
  VelocityXTextSpan get italic => this.._fontStyle = FontStyle.italic;

  /// Sets [letterSpacing] to -3.0
  VelocityXTextSpan get tightest => this.._letterSpacing = -3.0;

  /// Sets [letterSpacing] to -2.0
  VelocityXTextSpan get tighter => this.._letterSpacing = -2.0;

  /// Sets [letterSpacing] to -1.0
  VelocityXTextSpan get tight => this.._letterSpacing = -1.0;

  /// Sets [letterSpacing] to 1.0
  VelocityXTextSpan get wide => this.._letterSpacing = 1.0;

  /// Sets [letterSpacing] to 2.0
  VelocityXTextSpan get wider => this.._letterSpacing = 2.0;

  /// Sets [letterSpacing] to 3.0
  VelocityXTextSpan get widest => this.._letterSpacing = 3.0;

  /// Sets custom [letterSpacing] with [val]
  VelocityXTextSpan letterSpacing(double val) => this.._letterSpacing = val;

  /// Sets [TextDecoration] as [TextDecoration.underline]
  VelocityXTextSpan get underline =>
      this.._decoration = TextDecoration.underline;

  /// Sets [TextDecoration] as [TextDecoration.lineThrough]
  VelocityXTextSpan get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  /// Sets [TextDecoration] as [TextDecoration.overline]
  VelocityXTextSpan get overline => this.._decoration = TextDecoration.overline;

  /// Converts the text to fully uppercase.
  VelocityXTextSpan get uppercase => this.._text = _text!.toUpperCase();

  /// Converts the text to fully lowercase.
  VelocityXTextSpan get lowercase => this.._text = _text!.toLowerCase();

  /// Converts the text to first letter of very word as uppercase.
  VelocityXTextSpan get capitalize => this.._text = _text!.allWordsCapitilize();

  /// Converts the text to partially hideen text. Best for sensitive data.
  VelocityXTextSpan get hidePartial => this.._text = _text!.hidePartial();

  /// Sets [lineHeight] to 0.75
  VelocityXTextSpan get heightTight => this.._lineHeight = 0.75;

  /// Sets [lineHeight] to 0.875
  VelocityXTextSpan get heightSnug => this.._lineHeight = 0.875;

  /// Sets [lineHeight] to 1.25
  VelocityXTextSpan get heightRelaxed => this.._lineHeight = 1.25;

  /// Sets [lineHeight] to 1.5
  VelocityXTextSpan get heightLoose => this.._lineHeight = 1.5;

  /// Sets custom [lineHeight] with [val]
  VelocityXTextSpan lineHeight(double val) => this.._lineHeight = val;

  @override
  TextSpan make({Key? key}) {
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
      VxRichText.existing((text as TextSpan).text!, text.style);
}

extension VelocityXTextSpanExtension on TextSpan {
  /// Get TextSpan for the String
  VelocityXTextSpan get textSpan => VelocityXTextSpan(text!);
}
