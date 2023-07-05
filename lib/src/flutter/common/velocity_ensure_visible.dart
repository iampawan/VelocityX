import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
/// Helper class that ensures a Widget is visible when it has the focus
/// For example, for a TextFormField when the keyboard is displayed
///
/// How to use it:
///
/// In the class that implements the Form,
///   Instantiate a FocusNode
///   FocusNode _focusNode = new FocusNode();
///
/// In the build(BuildContext context), wrap the TextFormField as follows:
///
///   new VxEnsureVisibleWhenFocused(
///     focusNode: _focusNode,
///     child: new TextFormField(
///       ...
///       focusNode: _focusNode,
///     ),
///   ),
///
/// Initial source code written by Collin Jackson & taken from one of his repo.
/// Extended (see highlighting) to cover the case when the keyboard is dismissed and the
/// user clicks the TextFormField/TextField which still has the focus.
///
class VxEnsureVisibleWhenFocused extends StatefulWidget {
  const VxEnsureVisibleWhenFocused({
    super.key,
    required this.child,
    required this.focusNode,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 100),
  });

  /// The node we will monitor to determine if the child is focused
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  @override
  VxEnsureVisibleWhenFocusedState createState() =>
      VxEnsureVisibleWhenFocusedState();
}

///
/// We implement the WidgetsBindingObserver to be notified of any change to the window metrics
///
class VxEnsureVisibleWhenFocusedState extends State<VxEnsureVisibleWhenFocused>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_ensureVisible);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.focusNode.removeListener(_ensureVisible);
    super.dispose();
  }

  ///
  /// This routine is invoked when the window metrics have changed.
  /// This happens when the keyboard is open or dismissed, among others.
  /// It is the opportunity to check if the field has the focus
  /// and to ensure it is fully visible in the viewport when
  /// the keyboard is displayed
  ///
  @override
  void didChangeMetrics() {
    if (widget.focusNode.hasFocus) {
      _ensureVisible();
    }
  }

  ///
  /// This routine waits for the keyboard to come into view.
  /// In order to prevent some issues if the Widget is dismissed in the
  /// middle of the loop, we need to check the "mounted" property
  ///
  /// This method was suggested by Peter Yuen (see discussion).
  ///
  Future<void> _keyboardToggled() async {
    if (mounted) {
      final EdgeInsets edgeInsets = MediaQuery.viewInsetsOf(context);
      while (mounted && MediaQuery.viewInsetsOf(context) == edgeInsets) {
        await Future.delayed(const Duration(milliseconds: 10));
      }
    }

    return;
  }

  Future<void> _ensureVisible() async {
    // Wait for the keyboard to come into view
    await Future.any([
      Future.delayed(const Duration(milliseconds: 300)),
      _keyboardToggled()
    ]);

    // No need to go any further if the node has not the focus
    if (!widget.focusNode.hasFocus) {
      return;
    }

    // Find the object which has the focus
    // ignore: use_build_context_synchronously
    final RenderObject? object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);

    // If we are not working in a Scrollable, skip this routine
    // ignore: unnecessary_null_comparison
    if (viewport == null) {
      return;
    }

    // Get the Scrollable state (in order to retrieve its offset)
    // ignore: use_build_context_synchronously
    final ScrollableState scrollableState = Scrollable.of(context);

    // Get its offset
    final ScrollPosition position = scrollableState.position;
    double alignment;

    if (position.pixels > viewport.getOffsetToReveal(object!, 0.0).offset) {
      // Move down to the top of the viewport
      alignment = 0.0;
    } else if (position.pixels <
        viewport.getOffsetToReveal(object, 1.0).offset) {
      // Move up to the bottom of the viewport
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }

    await position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
