import 'package:flutter/material.dart';

///
/// [VxCurve] to provide different types of curves to the neumorphic design. [concave] is default.
///
enum VxCurve {
  concave,
  convex,
  emboss,
  flat,
}

///
/// [VxNeumorph] class to accept list of shadows and a [Gradient]
///
class VxNeumorph {
  final List<BoxShadow> shadows;
  final Gradient? gradient;

  VxNeumorph(this.shadows, this.gradient);
}
