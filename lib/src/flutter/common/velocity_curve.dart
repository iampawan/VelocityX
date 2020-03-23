import 'package:flutter/material.dart';

enum VelocityCurve {
  concave,
  convex,
  emboss,
  flat,
}

class VelocityNeumorph {
  final List<BoxShadow> shadows;
  final Gradient gradient;

  VelocityNeumorph(this.shadows, this.gradient);
}
