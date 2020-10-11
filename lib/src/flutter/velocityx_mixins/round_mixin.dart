import 'package:flutter/material.dart';

mixin VxRoundMixin<T> {
  T _childToRound;

  @protected
  double roundedValue;

  T get roundedNone {
    roundedValue = 0.0;
    return _childToRound;
  }

  T get roundedSM {
    roundedValue = 7.5;
    return _childToRound;
  }

  T get rounded {
    roundedValue = 15.0;
    return _childToRound;
  }

  T withRounded({double value = 15.0}) {
    roundedValue = value;
    return _childToRound;
  }

  T get roundedLg {
    roundedValue = 30.0;
    return _childToRound;
  }

  @protected
  void setChildToRound(T child) {
    _childToRound = child;
  }
}
