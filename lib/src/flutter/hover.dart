import 'package:flutter/material.dart';

/// VxHoverToggle widget can help you for Desktop/Web apps to toggle between
/// two widgets on hover.
///
class VxHoverToggle extends StatefulWidget {
  const VxHoverToggle({
    super.key,
    required this.child,
    required this.hoverChild,
    required this.size,
    this.mode = VxHoverMode.replace,
  });

  final Widget child;
  final Widget hoverChild;
  final VxHoverMode mode;
  final Size size;

  @override
  State<VxHoverToggle> createState() => _HoverToggleState();
}

class _HoverToggleState extends State<VxHoverToggle> with MaterialStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: widget.size,
      child: MouseRegion(
        cursor: isHovered ? SystemMouseCursors.click : MouseCursor.defer,
        onEnter: (_) => setMaterialState(MaterialState.hovered, true),
        onExit: (_) => setMaterialState(MaterialState.hovered, false),
        child: widget.mode == VxHoverMode.replace
            ? _buildReplaceableChildren()
            : _buildChildrenStack(),
      ),
    );
  }

  Widget _buildChildrenStack() {
    final Widget child =
        isHovered ? Opacity(opacity: 0.2, child: widget.child) : widget.child;
    return Stack(
      children: <Widget>[
        child,
        if (isHovered) widget.hoverChild,
      ],
    );
  }

  Widget _buildReplaceableChildren() =>
      isHovered ? widget.hoverChild : widget.child;
}

enum VxHoverMode { replace, overlay }
