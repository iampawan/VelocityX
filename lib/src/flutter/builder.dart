import 'package:flutter/widgets.dart';

abstract class VelocityXWidgetBuilder<T extends Widget> {
  T build();
}

abstract class VelocityXWidgetContextBuilder<T extends Widget> {
  T build(BuildContext context);
}

class TextBuilder extends VelocityXWidgetBuilder<Text> {
  TextBuilder(this._text);

  String _text;
  Color _color;
  String _fontFamily;

  TextBuilder text(String text) {
    _text = text;
    return this;
  }

  TextBuilder color(Color color) {
    _color = color;
    return this;
  }

  TextBuilder fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  @override
  Text build() {
    return Text(
      _text,
      style: TextStyle(
        color: _color,
        fontFamily: _fontFamily,
      ),
    );
  }
}
