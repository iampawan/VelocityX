import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

abstract class VelocityXWidgetBuilder<T extends Widget> {
  T make();
}

abstract class VelocityXWidgetContextBuilder<T extends Widget> {
  T make(BuildContext context);
}

/// Runs a [WidgetBuilder]'s result if the [condition] is true.
///
/// When [condition] is true the [builder] is run. If false
/// and [fallback] is not null, [fallback] is run. If [fallback] is null and
/// [condition] is false, an empty [Container] is rendered.
///
/// Example:
///
/// ```dart
/// VelocityXConditional(
///  condition: true,
/// builder: (context) {
///    return Text('This gets rendered');
///  },
/// )
///
/// VelocityXConditional(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, an empty offstage will be rendered');
///  },
/// )
///
/// VelocityXConditional(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, as fallback is not null, it is used to render the fallback widget.');
///  },
///  fallback: (context) {
///    return Text('This gets rendered');
///  }
/// )
/// ```

class VelocityXConditional extends StatelessWidget {
  /// Condition to control what gets rendered.
  final bool condition;

  /// Run if [condition] is true.
  final WidgetBuilder builder;

  /// Run if [condition] is false and it is not null.
  final WidgetBuilder fallback;

  const VelocityXConditional({
    Key key,
    @required this.condition,
    @required this.builder,
    this.fallback,
  })  : assert(condition != null),
        assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => condition
      ? builder(context)
      : fallback != null ? fallback(context) : const Offstage();
}

mixin VelocityColorMixin<T> {
  T _childToColor;

  @protected
  Color velocityColor;

  @protected
  void setChildToColor(T child) {
    _childToColor = child;
  }

  T get white => _colorIt(child: _childToColor, color: VelocityX.white);
  T get black => _colorIt(child: _childToColor, color: VelocityX.black);

  T get gray100 => _colorIt(child: _childToColor, color: VelocityX.gray100);
  T get gray200 => _colorIt(child: _childToColor, color: VelocityX.gray200);
  T get gray300 => _colorIt(child: _childToColor, color: VelocityX.gray300);
  T get gray400 => _colorIt(child: _childToColor, color: VelocityX.gray400);
  T get gray500 => _colorIt(child: _childToColor, color: VelocityX.gray500);
  T get gray600 => _colorIt(child: _childToColor, color: VelocityX.gray600);
  T get gray700 => _colorIt(child: _childToColor, color: VelocityX.gray700);
  T get gray800 => _colorIt(child: _childToColor, color: VelocityX.gray800);
  T get gray900 => _colorIt(child: _childToColor, color: VelocityX.gray900);

  T get red100 => _colorIt(child: _childToColor, color: VelocityX.red100);
  T get red200 => _colorIt(child: _childToColor, color: VelocityX.red200);
  T get red300 => _colorIt(child: _childToColor, color: VelocityX.red300);
  T get red400 => _colorIt(child: _childToColor, color: VelocityX.red400);
  T get red500 => _colorIt(child: _childToColor, color: VelocityX.red500);
  T get red600 => _colorIt(child: _childToColor, color: VelocityX.red600);
  T get red700 => _colorIt(child: _childToColor, color: VelocityX.red700);
  T get red800 => _colorIt(child: _childToColor, color: VelocityX.red800);
  T get red900 => _colorIt(child: _childToColor, color: VelocityX.red900);

  T get orange100 => _colorIt(child: _childToColor, color: VelocityX.orange100);
  T get orange200 => _colorIt(child: _childToColor, color: VelocityX.orange200);
  T get orange300 => _colorIt(child: _childToColor, color: VelocityX.orange300);
  T get orange400 => _colorIt(child: _childToColor, color: VelocityX.orange400);
  T get orange500 => _colorIt(child: _childToColor, color: VelocityX.orange500);
  T get orange600 => _colorIt(child: _childToColor, color: VelocityX.orange600);
  T get orange700 => _colorIt(child: _childToColor, color: VelocityX.orange700);
  T get orange800 => _colorIt(child: _childToColor, color: VelocityX.orange800);
  T get orange900 => _colorIt(child: _childToColor, color: VelocityX.orange900);

  T get yellow100 => _colorIt(child: _childToColor, color: VelocityX.yellow100);
  T get yellow200 => _colorIt(child: _childToColor, color: VelocityX.yellow200);
  T get yellow300 => _colorIt(child: _childToColor, color: VelocityX.yellow300);
  T get yellow400 => _colorIt(child: _childToColor, color: VelocityX.yellow400);
  T get yellow500 => _colorIt(child: _childToColor, color: VelocityX.yellow500);
  T get yellow600 => _colorIt(child: _childToColor, color: VelocityX.yellow600);
  T get yellow700 => _colorIt(child: _childToColor, color: VelocityX.yellow700);
  T get yellow800 => _colorIt(child: _childToColor, color: VelocityX.yellow800);
  T get yellow900 => _colorIt(child: _childToColor, color: VelocityX.yellow900);

  T get green100 => _colorIt(child: _childToColor, color: VelocityX.green100);
  T get green200 => _colorIt(child: _childToColor, color: VelocityX.green200);
  T get green300 => _colorIt(child: _childToColor, color: VelocityX.green300);
  T get green400 => _colorIt(child: _childToColor, color: VelocityX.green400);
  T get green500 => _colorIt(child: _childToColor, color: VelocityX.green500);
  T get green600 => _colorIt(child: _childToColor, color: VelocityX.green600);
  T get green700 => _colorIt(child: _childToColor, color: VelocityX.green700);
  T get green800 => _colorIt(child: _childToColor, color: VelocityX.green800);
  T get green900 => _colorIt(child: _childToColor, color: VelocityX.green900);

  T get teal100 => _colorIt(child: _childToColor, color: VelocityX.teal100);
  T get teal200 => _colorIt(child: _childToColor, color: VelocityX.teal200);
  T get teal300 => _colorIt(child: _childToColor, color: VelocityX.teal300);
  T get teal400 => _colorIt(child: _childToColor, color: VelocityX.teal400);
  T get teal500 => _colorIt(child: _childToColor, color: VelocityX.teal500);
  T get teal600 => _colorIt(child: _childToColor, color: VelocityX.teal600);
  T get teal700 => _colorIt(child: _childToColor, color: VelocityX.teal700);
  T get teal800 => _colorIt(child: _childToColor, color: VelocityX.teal800);
  T get teal900 => _colorIt(child: _childToColor, color: VelocityX.teal900);

  T get blue100 => _colorIt(child: _childToColor, color: VelocityX.blue100);
  T get blue200 => _colorIt(child: _childToColor, color: VelocityX.blue200);
  T get blue300 => _colorIt(child: _childToColor, color: VelocityX.blue300);
  T get blue400 => _colorIt(child: _childToColor, color: VelocityX.blue400);
  T get blue500 => _colorIt(child: _childToColor, color: VelocityX.blue500);
  T get blue600 => _colorIt(child: _childToColor, color: VelocityX.blue600);
  T get blue700 => _colorIt(child: _childToColor, color: VelocityX.blue700);
  T get blue800 => _colorIt(child: _childToColor, color: VelocityX.blue800);
  T get blue900 => _colorIt(child: _childToColor, color: VelocityX.blue900);

  T get indigo100 => _colorIt(child: _childToColor, color: VelocityX.indigo100);
  T get indigo200 => _colorIt(child: _childToColor, color: VelocityX.indigo200);
  T get indigo300 => _colorIt(child: _childToColor, color: VelocityX.indigo300);
  T get indigo400 => _colorIt(child: _childToColor, color: VelocityX.indigo400);
  T get indigo500 => _colorIt(child: _childToColor, color: VelocityX.indigo500);
  T get indigo600 => _colorIt(child: _childToColor, color: VelocityX.indigo600);
  T get indigo700 => _colorIt(child: _childToColor, color: VelocityX.indigo700);
  T get indigo800 => _colorIt(child: _childToColor, color: VelocityX.indigo800);
  T get indigo900 => _colorIt(child: _childToColor, color: VelocityX.indigo900);

  T get purple100 => _colorIt(child: _childToColor, color: VelocityX.purple100);
  T get purple200 => _colorIt(child: _childToColor, color: VelocityX.purple200);
  T get purple300 => _colorIt(child: _childToColor, color: VelocityX.purple300);
  T get purple400 => _colorIt(child: _childToColor, color: VelocityX.purple400);
  T get purple500 => _colorIt(child: _childToColor, color: VelocityX.purple500);
  T get purple600 => _colorIt(child: _childToColor, color: VelocityX.purple600);
  T get purple700 => _colorIt(child: _childToColor, color: VelocityX.purple700);
  T get purple800 => _colorIt(child: _childToColor, color: VelocityX.purple800);
  T get purple900 => _colorIt(child: _childToColor, color: VelocityX.purple900);

  T get pink100 => _colorIt(child: _childToColor, color: VelocityX.pink100);
  T get pink200 => _colorIt(child: _childToColor, color: VelocityX.pink200);
  T get pink300 => _colorIt(child: _childToColor, color: VelocityX.pink300);
  T get pink400 => _colorIt(child: _childToColor, color: VelocityX.pink400);
  T get pink500 => _colorIt(child: _childToColor, color: VelocityX.pink500);
  T get pink600 => _colorIt(child: _childToColor, color: VelocityX.pink600);
  T get pink700 => _colorIt(child: _childToColor, color: VelocityX.pink700);
  T get pink800 => _colorIt(child: _childToColor, color: VelocityX.pink800);
  T get pink900 => _colorIt(child: _childToColor, color: VelocityX.pink900);

  T get transparent {
    velocityColor = Colors.transparent;
    return _childToColor;
  }

  T _colorIt({@required String color, @required T child}) {
    velocityColor = VelocityX.hexToColor(color);
    return child;
  }
}

mixin VelocityPaddingMixin<T> {
  T _childToPad;

  @protected
  EdgeInsetsGeometry velocityPadding;

  @protected
  void setChildToPad(T child) {
    _childToPad = child;
  }

  T get p0 => _padIt(child: _childToPad, padding: VelocityX.m0);
  T get p1 => _padIt(child: _childToPad, padding: VelocityX.m1);
  T get p3 => _padIt(child: _childToPad, padding: VelocityX.m2);
  T get p4 => _padIt(child: _childToPad, padding: VelocityX.m4);
  T get p8 => _padIt(child: _childToPad, padding: VelocityX.m8);
  T get p12 => _padIt(child: _childToPad, padding: VelocityX.m12);
  T get p16 => _padIt(child: _childToPad, padding: VelocityX.m16);
  T get p20 => _padIt(child: _childToPad, padding: VelocityX.m20);
  T get p24 => _padIt(child: _childToPad, padding: VelocityX.m24);
  T get p32 => _padIt(child: _childToPad, padding: VelocityX.m32);
  T get p64 => _padIt(child: _childToPad, padding: VelocityX.m64);

  T get px0 => _padIt(child: _childToPad, padding: VelocityX.mH0);
  T get px1 => _padIt(child: _childToPad, padding: VelocityX.mH1);
  T get px3 => _padIt(child: _childToPad, padding: VelocityX.mH2);
  T get px4 => _padIt(child: _childToPad, padding: VelocityX.mH4);
  T get px8 => _padIt(child: _childToPad, padding: VelocityX.mH8);
  T get px12 => _padIt(child: _childToPad, padding: VelocityX.mH12);
  T get px16 => _padIt(child: _childToPad, padding: VelocityX.mH16);
  T get px20 => _padIt(child: _childToPad, padding: VelocityX.mH20);
  T get px24 => _padIt(child: _childToPad, padding: VelocityX.mH24);
  T get px32 => _padIt(child: _childToPad, padding: VelocityX.mH32);
  T get px64 => _padIt(child: _childToPad, padding: VelocityX.mH64);

  T get py0 => _padIt(child: _childToPad, padding: VelocityX.mV0);
  T get py1 => _padIt(child: _childToPad, padding: VelocityX.mV1);
  T get py3 => _padIt(child: _childToPad, padding: VelocityX.mV2);
  T get py4 => _padIt(child: _childToPad, padding: VelocityX.mV4);
  T get py8 => _padIt(child: _childToPad, padding: VelocityX.mV8);
  T get py12 => _padIt(child: _childToPad, padding: VelocityX.mV12);
  T get py16 => _padIt(child: _childToPad, padding: VelocityX.mV16);
  T get py20 => _padIt(child: _childToPad, padding: VelocityX.mV20);
  T get py24 => _padIt(child: _childToPad, padding: VelocityX.mV24);
  T get py32 => _padIt(child: _childToPad, padding: VelocityX.mV32);
  T get py64 => _padIt(child: _childToPad, padding: VelocityX.mV64);

  T _padIt({@required EdgeInsetsGeometry padding, @required T child}) {
    velocityPadding = padding;
    return child;
  }
}
