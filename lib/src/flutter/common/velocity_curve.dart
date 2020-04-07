import 'package:flutter/material.dart';

enum VxCurve {
  concave,
  convex,
  emboss,
  flat,
}

class VxNeumorph {
  final List<BoxShadow> shadows;
  final Gradient gradient;

  VxNeumorph(this.shadows, this.gradient);
}
