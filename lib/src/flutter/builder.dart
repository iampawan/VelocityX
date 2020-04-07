import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class VxWidgetBuilder<T extends Widget> {
  T make({Key key});
}

abstract class VxWidgetContextBuilder<T extends Widget> {
  T make(BuildContext context, {Key key});
}

abstract class VxTextSpanBuilder<TextSpan> {
  TextSpan make({Key key});
}
