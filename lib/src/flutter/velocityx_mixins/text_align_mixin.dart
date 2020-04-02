import 'package:flutter/cupertino.dart';

mixin VelocityTextAlignMixin<T> {
  T _child;

  @protected
  TextAlign velocityTextAlign;

  @protected
  void setChildForTextAlign(T child) {
    _child = child;
  }

  T get center => _applyTextAlignment(textAlign: TextAlign.center);

  T get start => _applyTextAlignment(textAlign: TextAlign.start);

  T get end => _applyTextAlignment(textAlign: TextAlign.end);

  T get justify => _applyTextAlignment(textAlign: TextAlign.justify);

  T _applyTextAlignment({TextAlign textAlign}) {
    velocityTextAlign = textAlign;
    return _child;
  }
}
