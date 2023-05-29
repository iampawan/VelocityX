import 'dart:ui' as ui;

import 'package:flutter/material.dart';

enum VxPinBorderType {
  underline,
  round,
}

/// VxPinView to give a widget where OTP or Pin screen can be created easily
class VxPinView extends StatefulWidget {
  /// Size of the box
  final double size;

  /// Color of the text
  final Color? contentColor;

  /// Color of the box
  final Color? color;

  /// Radius of the box
  final double radius;

  // Pin border type - Underline or Round
  final VxPinBorderType type;

  /// No. of boxes
  final int count;

  /// Space between boxes. Default is 8
  final double space;

  /// Pin code needs to be secured, by default true
  final bool obscureText;

  /// Boxes are filled, default - true
  final bool fill;

  /// Keyboard type for the boxes
  final TextInputType? keyboardType;

  /// Input action for the boxes
  final TextInputAction? textInputAction;

  /// Get the value on changed of textfield
  final ValueChanged<String>? onChanged;

  /// Get the value on submission of textfield
  final ValueChanged<String>? onSubmitted;

  /// Get the value on editing completion of textfield
  final VoidCallback? onEditingComplete;

  /// Focus node for the boxes
  final FocusNode? focusNode;

  const VxPinView({
    super.key,
    this.size = 40,
    this.contentColor,
    this.color,
    this.radius = 3,
    this.count = 6,
    this.type = VxPinBorderType.round,
    this.space = 8,
    this.obscureText = true,
    this.fill = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.focusNode,
  }) : assert(count > 0);

  @override
  VxPinViewState createState() => VxPinViewState();
}

class VxPinViewState extends State<VxPinView> {
  String? textValue;

  @override
  Widget build(BuildContext context) {
    final double tempWidth =
        widget.size * widget.count + widget.space * (widget.count - 1);
    final double tempHeight = widget.size;
    return CustomPaint(
      foregroundPainter: VxPasswordPainter(
        color: widget.color ?? Theme.of(context).textTheme.titleLarge?.color,
        contentColor: widget.contentColor ??
            Theme.of(context).textTheme.titleLarge?.color,
        radius: widget.radius,
        type: widget.type,
        count: widget.count,
        mSize: widget.size,
        space: widget.space,
        value: textValue,
        obscureText: widget.obscureText,
        fill: widget.fill,
      ),
      child: SizedBox(
        width: tempWidth,
        height: tempHeight,
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          style: const TextStyle(
            color: Colors.transparent,
            fontSize: 1,
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          cursorColor: Colors.transparent,
          cursorWidth: 0.0,
          autocorrect: false,
          textAlign: TextAlign.center,
          enableInteractiveSelection: false,
          maxLines: 1,
          maxLength: widget.count,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
          onChanged: (value) {
            textValue = value;
            setState(() {});
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
      ),
    );
  }
}

class VxPasswordPainter extends CustomPainter {
  final Color? contentColor;
  final Color? color;
  final double radius;
  final VxPinBorderType? type;
  final double space;
  final int count;
  final double mSize;
  final String? value;
  final bool obscureText;
  final bool fill;

  VxPasswordPainter({
    this.contentColor,
    this.color,
    this.radius = 3,
    this.type,
    this.space = 8,
    this.count = 6,
    this.mSize = 40,
    this.value,
    this.obscureText = true,
    this.fill = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;

    List.generate(count, (index) {
      drawRect(canvas, index, paint);

      drawValue(canvas, index, paint);
    });
  }

  void drawRect(Canvas canvas, int index, Paint paint) {
    paint.style = PaintingStyle.stroke;
    paint.color = color!;
    if (type == VxPinBorderType.round) {
      if (fill) {
        paint.style = PaintingStyle.fill;
      }
      final Offset offset = Offset(
        (2 * index + 1) * mSize / 2 + index * space,
        mSize / 2,
      );
      final Rect rect = Rect.fromCircle(
        center: offset,
        radius: mSize / 2,
      );
      final RRect rRect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(radius),
      );
      canvas.drawRRect(
        rRect,
        paint,
      );
    } else {
      final Offset offset1 = Offset(
        index * mSize + index * space,
        mSize,
      );
      final Offset offset2 = Offset(
        (index + 1) * mSize + index * space,
        mSize,
      );
      canvas.drawLine(
        offset1,
        offset2,
        paint,
      );
    }
  }

  void drawValue(Canvas canvas, int index, Paint paint) {
    if (value == null || value!.isEmpty || value!.length <= index) {
      return;
    }
    if (obscureText) {
      paint.style = PaintingStyle.fill;
      paint.color = contentColor!;
      final Offset offset = Offset(
        (2 * index + 1) * mSize / 2 + index * space,
        mSize / 2,
      );
      final Rect rect = Rect.fromCircle(
        center: offset,
        radius: mSize / 8,
      );
      final RRect rRect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(mSize / 8),
      );
      canvas.drawRRect(rRect, paint);
    } else {
      final String tempValue = value!.split('')[index];
      final ui.ParagraphBuilder pb = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          fontSize: 15.0,
        ),
      );
      pb.pushStyle(ui.TextStyle(color: contentColor));
      pb.addText(tempValue);

      final ui.ParagraphConstraints pc =
          ui.ParagraphConstraints(width: mSize / 2);
      final ui.Paragraph paragraph = pb.build()..layout(pc);
      final Offset offset = Offset(
        (2 * index + 1) * mSize / 2 + index * space - paragraph.width / 2,
        mSize / 2 - paragraph.height / 2,
      );
      canvas.drawParagraph(
        paragraph,
        offset,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
