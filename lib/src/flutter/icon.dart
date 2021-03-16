import 'package:flutter/material.dart';

///
/// Extension method to directly access [Icon].
///
extension VxIcon on Icon {
  ///
  /// Extension method to directly access [Icon]'s props without wrapping or with dot operator.
  ///
  Icon copyWith({
    double? size,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) =>
      Icon(
        icon,
        color: color ?? this.color,
        size: size ?? this.size,
        semanticLabel: semanticLabel ?? this.semanticLabel,
        textDirection: textDirection ?? this.textDirection,
      );

  ///
  /// Extension method to directly access [Icon]'s size without wrapping or with dot operator.
  ///
  Icon iconSize(double size) => copyWith(size: size);

  ///
  /// Extension method to directly access [Icon]'s color without wrapping or with dot operator.
  ///
  Icon iconColor(Color color) => copyWith(color: color);
}
