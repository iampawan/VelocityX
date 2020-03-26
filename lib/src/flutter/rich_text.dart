import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/src/flutter/builder.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/color_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

class VelocityXRichTextBuilder extends VelocityXWidgetBuilder<AutoSizeText>
    with VelocityColorMixin<VelocityXRichTextBuilder> {
  VelocityXRichTextBuilder(this._text) : assert(_text != null) {
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

  VelocityXRichTextBuilder fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  VelocityXRichTextBuilder get center => this.._textAlign = TextAlign.center;

  VelocityXRichTextBuilder get start => this.._textAlign = TextAlign.start;

  VelocityXRichTextBuilder get end => this.._textAlign = TextAlign.end;

  VelocityXRichTextBuilder get justify => this.._textAlign = TextAlign.justify;

  VelocityXRichTextBuilder size(double size) => this.._fontSize = size;

  VelocityXRichTextBuilder get xs =>
      _fontSizedText(child: this, scaleFactor: 0.75);

  VelocityXRichTextBuilder get sm =>
      _fontSizedText(child: this, scaleFactor: 0.875);

  VelocityXRichTextBuilder get base =>
      _fontSizedText(child: this, scaleFactor: 1);

  VelocityXRichTextBuilder get lg =>
      _fontSizedText(child: this, scaleFactor: 1.125);

  VelocityXRichTextBuilder get xl =>
      _fontSizedText(child: this, scaleFactor: 1.25);

  VelocityXRichTextBuilder get xl2 =>
      _fontSizedText(child: this, scaleFactor: 1.5);

  VelocityXRichTextBuilder get xl3 =>
      _fontSizedText(child: this, scaleFactor: 1.875);

  VelocityXRichTextBuilder get xl4 =>
      _fontSizedText(child: this, scaleFactor: 2.25);

  VelocityXRichTextBuilder get xl5 =>
      _fontSizedText(child: this, scaleFactor: 3);

  VelocityXRichTextBuilder get xl6 =>
      _fontSizedText(child: this, scaleFactor: 4);

  VelocityXRichTextBuilder _fontSizedText(
      {@required double scaleFactor,
      @required VelocityXRichTextBuilder child}) {
    _scaleFactor = scaleFactor;
    return this;
  }

  VelocityXRichTextBuilder get hairLine =>
      _fontWeightedText(child: this, weight: FontWeight.w100);

  VelocityXRichTextBuilder get thin =>
      _fontWeightedText(child: this, weight: FontWeight.w200);

  VelocityXRichTextBuilder get light =>
      _fontWeightedText(child: this, weight: FontWeight.w300);

  VelocityXRichTextBuilder get normal =>
      _fontWeightedText(child: this, weight: FontWeight.w400);

  VelocityXRichTextBuilder get medium =>
      _fontWeightedText(child: this, weight: FontWeight.w500);

  VelocityXRichTextBuilder get semiBold =>
      _fontWeightedText(child: this, weight: FontWeight.w600);

  VelocityXRichTextBuilder get bold =>
      _fontWeightedText(child: this, weight: FontWeight.w700);

  VelocityXRichTextBuilder get extraBold =>
      _fontWeightedText(child: this, weight: FontWeight.w800);

  VelocityXRichTextBuilder get extraBlack =>
      _fontWeightedText(child: this, weight: FontWeight.w900);

  VelocityXRichTextBuilder _fontWeightedText(
      {@required FontWeight weight, @required VelocityXRichTextBuilder child}) {
    _fontWeight = weight;
    return this;
  }

  VelocityXRichTextBuilder get italic => this.._fontStyle = FontStyle.italic;

  VelocityXRichTextBuilder get tightest => this.._letterSpacing = -3.0;

  VelocityXRichTextBuilder get tighter => this.._letterSpacing = -2.0;

  VelocityXRichTextBuilder get tight => this.._letterSpacing = -1.0;

  VelocityXRichTextBuilder get wide => this.._letterSpacing = 1.0;

  VelocityXRichTextBuilder get wider => this.._letterSpacing = 2.0;

  VelocityXRichTextBuilder get widest => this.._letterSpacing = 3.0;

  VelocityXRichTextBuilder letterSpacing(double val) =>
      this.._letterSpacing = val;

  VelocityXRichTextBuilder get underline =>
      this.._decoration = TextDecoration.underline;

  VelocityXRichTextBuilder get lineThrough =>
      this.._decoration = TextDecoration.lineThrough;

  VelocityXRichTextBuilder get overline =>
      this.._decoration = TextDecoration.overline;

  VelocityXRichTextBuilder get uppercase => this.._text = _text.toUpperCase();

  VelocityXRichTextBuilder get lowercase => this.._text = _text.toLowerCase();

  VelocityXRichTextBuilder get capitalize =>
      this.._text = _text.allWordsCapitilize();

  VelocityXRichTextBuilder get hidePartial => this.._text = _text.hidePartial();

  VelocityXRichTextBuilder get heightTight => this.._lineHeight = 0.75;

  VelocityXRichTextBuilder get heightSnug => this.._lineHeight = 0.875;

  VelocityXRichTextBuilder get heightRelaxed => this.._lineHeight = 1.25;

  VelocityXRichTextBuilder get heightLoose => this.._lineHeight = 1.5;

  VelocityXRichTextBuilder lineHeight(double val) => this.._lineHeight = val;

  @override
  AutoSizeText make({Key key}) {
    return AutoSizeText.rich(
      TextSpan(
          text: _text,
          children: _textSpanChildren,
          recognizer: _gestureRecognizer,
          style: TextStyle(
            color: velocityColor,
            fontSize: _fontSize ?? 14.0,
            fontStyle: _fontStyle ?? FontStyle.normal,
            fontFamily: _fontFamily,
            fontWeight: _fontWeight,
            letterSpacing: _letterSpacing ?? 0.0,
            decoration: _decoration ?? TextDecoration.none,
            height: _lineHeight,
          )),
      key: key,
      textAlign: _textAlign,
      maxLines: _maxLines,
      textScaleFactor: _scaleFactor,
      softWrap: true,
    );
  }
}




class VelocityXTextSpan extends VelocityXTextSpanBuilder
    with VelocityColorMixin<VelocityXTextSpan> {
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

  VelocityXTextSpan fontFamily(String family) {
    _fontFamily = family;
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
    return TextSpan(
      text: _text,
      recognizer: _gestureRecognizer,
      children: _textSpanChildren,
      style: TextStyle(
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
