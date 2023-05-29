import 'package:flutter/material.dart';

enum VxDividerType {
  horizontal,
  vertical,
}

class VxDivider extends StatelessWidget {
  final VxDividerType type;
  final Color? color;
  final double width;
  final double? indent;
  final double? endIndent;

  const VxDivider({
    super.key,
    this.type = VxDividerType.horizontal,
    this.color,
    this.width = 1,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    final DividerThemeData dividerTheme = DividerTheme.of(context);
    final double indent = this.indent ?? dividerTheme.indent ?? 0.0;
    final double endIndent = this.endIndent ?? dividerTheme.endIndent ?? 0.0;

    final Color effectiveColor =
        color ?? dividerTheme.color ?? Theme.of(context).dividerColor;

    if (type == VxDividerType.horizontal) {
      return Container(
        height: width,
        margin: EdgeInsetsDirectional.only(
          start: indent,
          end: endIndent,
        ),
        color: effectiveColor,
      );
    } else {
      return Container(
        width: width,
        margin: EdgeInsetsDirectional.only(
          top: indent,
          bottom: endIndent,
        ),
        color: effectiveColor,
      );
    }
  }
}
