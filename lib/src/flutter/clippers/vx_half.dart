import 'package:flutter/rendering.dart';

class VxHalfClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
