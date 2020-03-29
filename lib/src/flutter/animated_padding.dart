import 'package:flutter/material.dart';
//import 'package:velocity_x/src/flutter/builder.dart';
//import 'package:velocity_x/src/flutter/velocityx_mixins/animated_padding_mixin.dart';
//import 'package:velocity_x/src/velocity_xx.dart';
//
//class _VelocityXAnimatedPaddingBuilder extends VelocityXWidgetBuilder<Widget> with VelocityAnimatedPaddingMixin<_VelocityXAnimatedPaddingBuilder>{
//  _VelocityXAnimatedPaddingBuilder(this._child):assert(_child!=null){
//    setChildToAniPad(this);
//  }
//  final Widget _child;
//  @override
//  Widget make({Key key}){
//    return AnimatedPadding(
//      key: key,
//      child: _child,
//      padding: velocityPadding,
//      duration: velocityDuration,
//      curve: Curves.easeInOut,
//
//    );
//  }
//}

extension AnimatedPaddingExtension on Widget{
AnimatedPadding animPadSecCur({Key key,@required EdgeInsetsGeometry padding,@required int seconds,@required Curve curve})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: seconds),
  curve: curve,
  child: this,
);
AnimatedPadding animPadMinCur({Key key,@required EdgeInsetsGeometry padding,@required int minutes,@required Curve curve})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: minutes),
  curve: curve,
  child: this,
);
AnimatedPadding animPadDayCur({Key key,@required EdgeInsetsGeometry padding,@required int days,@required Curve curve})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: days),
  curve: curve,
  child: this,
);
AnimatedPadding animPadHourCur({Key key,@required EdgeInsetsGeometry padding,@required int hours,@required Curve curve})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: hours,),
  curve: curve,
  child: this,
);
AnimatedPadding animPadMilliCur({Key key,@required EdgeInsetsGeometry padding,@required int milliSeconds,@required Curve curve})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: milliSeconds),
  curve: curve,
  child: this,
);
AnimatedPadding animPadMicroCur({Key key,@required EdgeInsetsGeometry padding,@required int microSeconds,@required Curve curve})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: microSeconds),
  curve: curve,
  child: this,
);
AnimatedPadding animPadSec({Key key,@required EdgeInsetsGeometry padding,@required int seconds})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: seconds),
  curve: Curves.easeInOut,
  child: this,
);
AnimatedPadding animPadMin({Key key,@required EdgeInsetsGeometry padding,@required int minutes})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: minutes),
  curve: Curves.easeInOut,
  child: this,
);
AnimatedPadding animPadHour({Key key,@required double padding,@required int hours})=> AnimatedPadding(
  key: key,
  padding:EdgeInsets.all(padding),
  duration:Duration(seconds: hours),
  curve: Curves.easeInOut,
  child: this,
);
AnimatedPadding animPadDay({Key key,@required EdgeInsetsGeometry padding,@required int days})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: days),
  curve: Curves.easeInOut,
  child: this,
);
AnimatedPadding animPadMilli({Key key,@required EdgeInsetsGeometry padding,@required int milliSeconds})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: milliSeconds),
  curve: Curves.easeInOut,
  child: this,
);
AnimatedPadding animPadMicro({Key key,@required EdgeInsetsGeometry padding,@required int microSeconds})=> AnimatedPadding(
  key: key,
  padding:padding,
  duration:Duration(seconds: microSeconds),
  curve: Curves.easeInOut,
  child: this,
);



}