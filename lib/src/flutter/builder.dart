import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

abstract class VelocityXWidgetBuilder<T extends Widget> {
  T build();
}

abstract class VelocityXWidgetContextBuilder<T extends Widget> {
  T build(BuildContext context);
}

mixin ColorMixin<T> {
  T _coloredChild;
  Color _theColor;

  void setColor(Color color) {
    _theColor = color;
  }

  void setColoredChild(Color color) {
    _theColor = color;
  }

  T get red900 => _coloredText(child: _coloredChild, color: VelocityX.red900);

  T _coloredText({@required String color, @required T child}) {
    _theColor = VelocityX.hexToColor(color);
    return child;
  }
}
