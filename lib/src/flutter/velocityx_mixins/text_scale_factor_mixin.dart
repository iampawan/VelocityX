import 'package:flutter/material.dart';

mixin VelocityTextScaleFactorMixin<T> {
  T _child;

  @protected
  double velocityScaleFactor;

  @protected
  void setChildForTextScaleFactor(T child) {
    _child = child;
  }

  T get xs => _applyScaleFactor(scaleFactor: 0.75);

  T get sm => _applyScaleFactor(scaleFactor: 0.875);

  T get base => _applyScaleFactor(scaleFactor: 1);

  T get lg => _applyScaleFactor(scaleFactor: 1.125);

  T get xl => _applyScaleFactor(scaleFactor: 1.25);

  T get xl2 => _applyScaleFactor(scaleFactor: 1.5);

  T get xl3 => _applyScaleFactor(scaleFactor: 1.875);

  T get xl4 => _applyScaleFactor(scaleFactor: 2.25);

  T get xl5 => _applyScaleFactor(scaleFactor: 3);

  T get xl6 => _applyScaleFactor(scaleFactor: 4);

  T _applyScaleFactor({@required double scaleFactor}) {
    velocityScaleFactor = scaleFactor;
    return _child;
  }
}
