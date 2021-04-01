import 'package:flutter/widgets.dart';

enum VxEdge { TOP, RIGHT, BOTTOM, LEFT }

enum VxArcType { CONVEY, CONVEX }

class VxArcClipper extends CustomClipper<Path> {
  VxArcClipper(this.height, this.edge, this.arcType);

  ///The height of the arc
  final double height;

  ///The edge of the widget which clipped as arc
  final VxEdge edge;

  ///The type of arc which can be [ArcType.CONVEX] or [ArcType.CONVEY]
  final VxArcType arcType;

  @override
  Path getClip(Size size) {
    switch (edge) {
      case VxEdge.TOP:
        return _getTopPath(size);
      case VxEdge.RIGHT:
        return _getRightPath(size);
      case VxEdge.BOTTOM:
        return _getBottomPath(size);
      case VxEdge.LEFT:
        return _getLeftPath(size);
      default:
        return _getRightPath(size);
    }
  }

  Path _getBottomPath(Size size) {
    final path = Path();
    if (arcType == VxArcType.CONVEX) {
      path.lineTo(0.0, size.height - height);
      //Adds a quadratic bezier segment that curves from the current point
      //to the given point (x2,y2), using the control point (x1,y1).
      path.quadraticBezierTo(
          size.width / 4, size.height, size.width / 2, size.height);
      path.quadraticBezierTo(
          size.width * 3 / 4, size.height, size.width, size.height - height);

      path.lineTo(size.width, 0.0);
    } else {
      path.moveTo(0.0, size.height);
      path.quadraticBezierTo(size.width / 4, size.height - height,
          size.width / 2, size.height - height);
      path.quadraticBezierTo(
          size.width * 3 / 4, size.height - height, size.width, size.height);
      path.lineTo(size.width, 0.0);
      path.lineTo(0.0, 0.0);
    }
    path.close();

    return path;
  }

  Path _getTopPath(Size size) {
    final path = Path();
    if (arcType == VxArcType.CONVEX) {
      path.moveTo(0.0, height);

      path.quadraticBezierTo(size.width / 4, 0.0, size.width / 2, 0.0);
      path.quadraticBezierTo(size.width * 3 / 4, 0.0, size.width, height);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
    } else {
      path.quadraticBezierTo(size.width / 4, height, size.width / 2, height);
      path.quadraticBezierTo(size.width * 3 / 4, height, size.width, 0.0);
      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
    }
    path.close();

    return path;
  }

  Path _getLeftPath(Size size) {
    final path = Path();
    if (arcType == VxArcType.CONVEX) {
      path.moveTo(height, 0.0);

      path.quadraticBezierTo(0.0, size.height / 4, 0.0, size.height / 2);
      path.quadraticBezierTo(0.0, size.height * 3 / 4, height, size.height);

      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
    } else {
      path.quadraticBezierTo(height, size.height / 4, height, size.height / 2);
      path.quadraticBezierTo(height, size.height * 3 / 4, 0.0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
    }
    path.close();

    return path;
  }

  Path _getRightPath(Size size) {
    final path = Path();
    if (arcType == VxArcType.CONVEX) {
      path.moveTo(size.width - height, 0.0);

      path.quadraticBezierTo(
          size.width, size.height / 4, size.width, size.height / 2);
      path.quadraticBezierTo(
          size.width, size.height * 3 / 4, size.width - height, size.height);

      path.lineTo(0.0, size.height);
      path.lineTo(0.0, 0.0);
    } else {
      path.moveTo(size.width, 0.0);
      path.quadraticBezierTo(size.width - height, size.height / 4,
          size.width - height, size.height / 2);
      path.quadraticBezierTo(
          size.width - height, size.height * 3 / 4, size.width, size.height);
      path.lineTo(0.0, size.height);
      path.lineTo(0.0, 0.0);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    final VxArcClipper oldie = oldClipper as VxArcClipper;
    return height != oldie.height ||
        arcType != oldie.arcType ||
        edge != oldie.edge;
  }
}

class VxArc extends StatelessWidget {
  const VxArc(
      {Key? key,
      required this.height,
      required this.child,
      this.edge = VxEdge.BOTTOM,
      this.arcType = VxArcType.CONVEX,
      this.clipShadows = const []})
      : super(key: key);

  /// The widget which one of [edge]s is going to be clippddddded as arc
  final Widget child;

  ///The height of the arc
  final double height;

  ///The edge of the widget which clipped as arc
  final VxEdge edge;

  ///The type of arc which can be [ArcType.CONVEX] or [ArcType.CONVEY]
  final VxArcType arcType;

  ///List of shadows to be cast on the border
  final List<VxClipShadow> clipShadows;

  @override
  Widget build(BuildContext context) {
    final clipper = VxArcClipper(height, edge, arcType);
    return CustomPaint(
      painter: VxClipShadowPainter(clipper, clipShadows),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}

class VxClipShadowPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  final List<VxClipShadow> clipShadows;

  VxClipShadowPainter(this.clipper, this.clipShadows);

  @override
  void paint(Canvas canvas, Size size) {
    // ignore: avoid_function_literals_in_foreach_calls
    clipShadows.forEach((VxClipShadow shadow) {
      canvas.drawShadow(
          clipper.getClip(size), shadow.color, shadow.elevation, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class VxClipShadow {
  final Color color;
  final double elevation;

  VxClipShadow({required this.color, this.elevation = 5});
}
