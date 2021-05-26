import 'package:flutter/material.dart';

mixin VxRoundMixin<T> {
  late T _childToRound;

  @protected
  double? roundedValue;

  @protected
  BorderRadiusGeometry? radiusGeometry;

  T customRounded(BorderRadiusGeometry geometry) {
    roundedValue = 0.0;
    radiusGeometry = geometry;
    return _childToRound;
  }

  T topLeftRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry = BorderRadius.only(topLeft: Radius.circular(roundedValue!));
    return _childToRound;
  }

  T topRightRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry =
        BorderRadius.only(topRight: Radius.circular(roundedValue!));
    return _childToRound;
  }

  T bottomLeftRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry =
        BorderRadius.only(bottomLeft: Radius.circular(roundedValue!));
    return _childToRound;
  }

  T bottomRightRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry =
        BorderRadius.only(bottomRight: Radius.circular(roundedValue!));
    return _childToRound;
  }

  T leftRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry =
        BorderRadius.horizontal(left: Radius.circular(roundedValue!));
    return _childToRound;
  }

  T rightRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry =
        BorderRadius.horizontal(right: Radius.circular(roundedValue!));
    return _childToRound;
  }

  T topRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry = BorderRadius.vertical(top: Radius.circular(roundedValue!));
    return _childToRound;
  }

  T bottomRounded({double? value}) {
    roundedValue = value ?? 15.0;
    radiusGeometry =
        BorderRadius.vertical(bottom: Radius.circular(roundedValue!));
    return _childToRound;
  }

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
