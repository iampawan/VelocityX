import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class VelocityXWidgetBuilder<T extends Widget> {
  T make({Key key});
}

abstract class VelocityXWidgetContextBuilder<T extends Widget> {
  T make(BuildContext context, {Key key});
}
