import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

extension VxMaterialColor on Color {
  MaterialColor materialColor() => Vx.getMaterialColor(this);
}
