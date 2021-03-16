import 'package:flutter/widgets.dart';

import 'vx_arc.dart';

/// Defines the corners of the child widget
enum VxDiagonalPosition { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT }

/// A widget that clips its child diagonally.

///Diagonal clipping starts from the [position] in the [axis]
///ends up [clipHeight] distance from the opposite [position]
class VxDiagonalClipper extends CustomClipper<Path> {
  VxDiagonalClipper(this.clipHeight, this.position, this.axis);

  ///The height that the diagonal angle sees
  final double clipHeight;

  ///The corner of the child which is represented with [DiagonalPosition]
  final VxDiagonalPosition position;

  ///The direction of the diagonal
  final Axis axis;

  @override
  Path getClip(Size size) {
    switch (position) {
      case VxDiagonalPosition.TOP_LEFT:
        return _getTopLeftPath(size);
      case VxDiagonalPosition.TOP_RIGHT:
        return _getTopRightPath(size);
      case VxDiagonalPosition.BOTTOM_LEFT:
        return _getBottomLeftPath(size);
      case VxDiagonalPosition.BOTTOM_RIGHT:
        return _getBottomRightPath(size);
      default:
        return _getBottomLeftPath(size);
    }
  }

  Path _getTopLeftPath(Size size) {
    final path = Path();
    if (axis == Axis.horizontal) {
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, clipHeight);
    } else {
      path.lineTo(clipHeight, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
    }
    path.close();
    return path;
  }

  Path _getTopRightPath(Size size) {
    final path = Path();
    if (axis == Axis.horizontal) {
      path.moveTo(0.0, clipHeight);
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
    } else {
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width - clipHeight, size.height);
      path.lineTo(0.0, size.height);
    }
    path.close();
    return path;
  }

  Path _getBottomLeftPath(Size size) {
    final path = Path();
    if (axis == Axis.horizontal) {
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height - clipHeight);
      path.lineTo(size.width, 0.0);
    } else {
      path.moveTo(0.0, size.height);
      path.lineTo(clipHeight, 0.0);
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width, size.height);
    }
    path.close();
    return path;
  }

  Path _getBottomRightPath(Size size) {
    final path = Path();
    if (axis == Axis.horizontal) {
      path.lineTo(0.0, size.height - clipHeight);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
    } else {
      path.lineTo(size.width - clipHeight, 0.0);
      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    final VxDiagonalClipper oldie = oldClipper as VxDiagonalClipper;
    return position != oldie.position ||
        clipHeight != oldie.clipHeight ||
        axis != oldie.axis;
  }
}

class VxDiagonal extends StatelessWidget {
  const VxDiagonal(
      {Key? key,
      required this.child,
      required this.clipHeight,
      this.position = VxDiagonalPosition.BOTTOM_LEFT,
      this.axis = Axis.horizontal,
      this.clipShadows = const []})
      : super(key: key);

  final Widget child;

  ///The height that the diagonal angle sees
  final double clipHeight;

  ///The corner of the child which is represented with [DiagonalPosition]
  final VxDiagonalPosition position;

  ///The direction of the diagonal
  final Axis axis;

  ///List of shadows to be cast on the border
  final List<VxClipShadow> clipShadows;

  @override
  Widget build(BuildContext context) {
    final clipper = VxDiagonalClipper(clipHeight, position, axis);
    return CustomPaint(
      painter: VxClipShadowPainter(clipper, clipShadows),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
