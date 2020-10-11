import 'package:flutter/material.dart';

extension VxIcon on Icon {
  Icon copyWith({
    double size,
    Color color,
    String semanticLabel,
    TextDirection textDirection,
  }) =>
      Icon(
        icon,
        color: color ?? this.color,
        size: size ?? this.size,
        semanticLabel: semanticLabel ?? this.semanticLabel,
        textDirection: textDirection ?? this.textDirection,
      );

  Icon iconSize(double size) => copyWith(size: size);

  Icon iconColor(Color color) => copyWith(color: color);
}
