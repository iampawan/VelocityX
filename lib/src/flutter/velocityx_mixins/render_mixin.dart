import 'package:flutter/material.dart';

/// Uses [VxRenderMixin] mixin to render the widget only when the condition is true.

mixin VxRenderMixin<T> {
  late T _child;

  @protected
  bool willRender = true;

  @protected
  void setChildForRender(T child) {
    _child = child;
  }

  /// Uses [when] clause to render the widget only when the condition is true.
  T when(bool condition) {
    willRender = condition;
    return _child;
  }
}
