import 'package:flutter/material.dart';

mixin VelocityAnimatedPaddingMixin<T>{
  T _childToAniPad;

  @protected
  EdgeInsetsGeometry velocityPadding;
  @protected
  Duration velocityDuration;

  @protected
  void setChildToAniPad(T child){
    _childToAniPad=child;
  }

  T _aniPadIt({@required EdgeInsetsGeometry padding,@required Duration duration, @required T child}){

    return child;

  }



}