/*
 * Copyright (c) 2020 Pawan Kumar. All rights reserved.
 *
 *  * Licensed under the Apache License, Version 2.0 (the "License");
 *  * you may not use this file except in compliance with the License.
 *  * You may obtain a copy of the License at
 *  * http://www.apache.org/licenses/LICENSE-2.0
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'builder.dart';

/// A widget that detects gestures.
///
/// Attempts to recognize gestures that correspond to its non-null callbacks.
///
/// If this widget has a child, it defers to that child for its sizing behavior.
/// If it does not have a child, it grows to fit the parent instead.
///
/// By default a GestureDetector with an invisible child ignores touches;
/// this behavior can be controlled with [behavior].
///
/// GestureDetector also listens for accessibility events and maps
/// them to the callbacks. To ignore accessibility events, set
/// [excludeFromSemantics] to true.
///
/// See <http://flutter.dev/gestures/> for additional information.
///
/// Material design applications typically react to touches with ink splash
/// effects. The [InkWell] class implements this effect and can be used in place
/// of a [GestureDetector] for handling taps.
///
/// {@animation 200 150 https://flutter.github.io/assets-for-api-docs/assets/widgets/gesture_detector.mp4}
///
class _VxGestureBuilder extends VxWidgetBuilder<Widget> {
  _VxGestureBuilder(this._child, Function this._onClick);
  _VxGestureBuilder.doubleClick(this._child, Function this._onDoubleClick);
  _VxGestureBuilder.longClick(this._child, Function this._onLongClick);

  final Widget _child;
  Function? _onClick;
  Function? _onDoubleClick;
  Function? _onLongClick;

  /// On clicking two times.
  _VxGestureBuilder doubleClick({required Function onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  /// On long pressing.
  _VxGestureBuilder longClick({required Function onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key? key}) {
    return GestureDetector(
      key: key,
      onTap: _onClick as void Function()?,
      child: _child,
      onDoubleTap: _onDoubleClick as void Function()?,
      onLongPress: _onLongClick as void Function()?,
    );
  }
}

typedef FnBuilderCallback = void Function();

class _VelocityXInkWellBuilder extends VxWidgetBuilder<Widget> {
  _VelocityXInkWellBuilder(this._child, this._onClick);
  _VelocityXInkWellBuilder.mdDoubleClick(this._child, this._onDoubleClick);
  _VelocityXInkWellBuilder.mdLongClick(this._child, this._onLongClick);

  final Widget _child;
  FnBuilderCallback? _onClick;
  FnBuilderCallback? _onDoubleClick;
  FnBuilderCallback? _onLongClick;
  Color? _splashColor;

  /// Use to show a splash color when clicking on the widget.
  _VelocityXInkWellBuilder splashColor(Color color) =>
      this.._splashColor = color;

  /// On clicking two times.
  _VelocityXInkWellBuilder mdDoubleClick(
          {required FnBuilderCallback onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  /// On long pressing.
  _VelocityXInkWellBuilder mdLongClick(
          {required FnBuilderCallback onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key? key}) {
    return InkWell(
      key: key,
      onTap: _onClick,
      child: _child,
      splashColor: _splashColor,
      onDoubleTap: _onDoubleClick,
      onLongPress: _onLongClick,
    );
  }
}

extension GestureExtensions on Widget {
  ///
  /// Note - For single prop use [onTap]. Extension method to directly access [_VxGestureBuilder] single click with any widget without wrapping or with dot operator.
  ///
  _VxGestureBuilder click(FnBuilderCallback onClick) =>
      _VxGestureBuilder(this, onClick);

  ///
  /// Note - For single prop use [onDoubleTap]. Extension method to directly access [_VxGestureBuilder] double click with any widget without wrapping or with dot operator.
  ///
  _VxGestureBuilder doubleClick(FnBuilderCallback onClick) =>
      _VxGestureBuilder.doubleClick(this, onClick);

  /// Note - For single prop use [onLongPress].
  /// Extension method to directly access [_VxGestureBuilder] long click with any widget without wrapping or with dot operator.
  ///
  _VxGestureBuilder longClick(FnBuilderCallback onClick) =>
      _VxGestureBuilder.longClick(this, onClick);

  /// Note - For single prop use [onInkTap].
  /// Extension method to directly access material [_VelocityXInkWellBuilder] single click with any widget without wrapping or with dot operator.
  ///
  _VelocityXInkWellBuilder mdClick(FnBuilderCallback onClick) =>
      _VelocityXInkWellBuilder(this, onClick);

  /// Note - For single prop use [onInkDoubleTap].
  /// Extension method to directly access material [_VelocityXInkWellBuilder] double click with any widget without wrapping or with dot operator.
  ///
  _VelocityXInkWellBuilder mdDoubleClick(FnBuilderCallback onClick) =>
      _VelocityXInkWellBuilder.mdDoubleClick(this, onClick);

  /// Note - For single prop use [onInkLongPress].
  /// Extension method to directly access material [_VelocityXInkWellBuilder] long click with any widget without wrapping or with dot operator.
  ///
  _VelocityXInkWellBuilder mdLongClick(FnBuilderCallback onClick) =>
      _VelocityXInkWellBuilder.mdLongClick(this, onClick);

  GestureDetector onTap(VoidCallback? onTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return GestureDetector(
      behavior: hitTestBehavior,
      onTap: onTap,
      child: this,
    );
  }

  InkWell onInkTap(
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  GestureDetector onDoubleTap(VoidCallback? onDoubleTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return GestureDetector(
      behavior: hitTestBehavior,
      onDoubleTap: onDoubleTap,
      child: this,
    );
  }

  InkWell onInkDoubleTap(
    VoidCallback? onDoubleTap,
  ) {
    return InkWell(
      onDoubleTap: onDoubleTap,
      child: this,
    );
  }

  GestureDetector onLongPress(VoidCallback? onLongPress,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return GestureDetector(
      behavior: hitTestBehavior,
      onLongPress: onLongPress,
      child: this,
    );
  }

  InkWell onInkLongPress(
    VoidCallback? onLongPress,
  ) {
    return InkWell(
      onLongPress: onLongPress,
      child: this,
    );
  }

  ///it is very much like onTap extension but when you put your finger on it, its color will change,
  ///and you can decide that whether it will have a touchFeedBack (vibration on your phone)
  ///

  Widget onFeedBackTap(VoidCallback? onTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild,
      bool touchFeedBack = false}) {
    return _CallbackButton(
      child: this,
      onTap: onTap,
      needHaptic: touchFeedBack,
      hitTestBehavior: hitTestBehavior,
      normalColor: Colors.transparent,
      pressedColor: Colors.black12,
    );
  }

  /// Mouse Region Hover
  MouseRegion onMouseHover(
    PointerHoverEventListener? onHover,
  ) {
    return MouseRegion(
      onHover: onHover,
      child: this,
    );
  }

  /// Mouse Region Enter
  MouseRegion onMouseEnter(
    PointerEnterEventListener? onEnter,
  ) {
    return MouseRegion(
      onEnter: onEnter,
      child: this,
    );
  }

  /// Mouse Region Exit
  MouseRegion onMouseExit(
    PointerExitEventListener? onExit,
  ) {
    return MouseRegion(
      onExit: onExit,
      child: this,
    );
  }

  /// Mouse Region Enter & Exit
  MouseRegion onMouseEnterExit({
    PointerEnterEventListener? onEnter,
    PointerExitEventListener? onExit,
  }) {
    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: this,
    );
  }

  /// [MouseRegion] Full Widget
  MouseRegion mouseRegion(
      {Key? key,
      PointerHoverEventListener? onHover,
      PointerEnterEventListener? onEnter,
      PointerExitEventListener? onExit,
      MouseCursor mouseCursor = MouseCursor.defer,
      bool opaque = true}) {
    return MouseRegion(
      key: key,
      onHover: onHover,
      cursor: mouseCursor,
      opaque: opaque,
      onEnter: onEnter,
      onExit: onExit,
      child: this,
    );
  }
}

class _CallbackButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Color? normalColor;
  final Color? pressedColor;
  final bool needHaptic;
  final HitTestBehavior? hitTestBehavior;

  const _CallbackButton(
      {Key? key,
      this.onTap,
      this.child,
      this.normalColor = Colors.transparent,
      this.pressedColor = Colors.black12,
      this.needHaptic = false,
      this.hitTestBehavior})
      : super(key: key);

  @override
  _CallbackButtonState createState() => _CallbackButtonState();
}

class _CallbackButtonState extends State<_CallbackButton> {
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.hitTestBehavior,
      onTap: widget.onTap,
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      onTapCancel: handleCancel,
      child: Container(
        color: bgColor,
        child: widget.child,
      ),
    );
  }

  void handleTapDown(TapDownDetails tapDownDetails) {
    setState(() {
      bgColor = widget.pressedColor;
    });
  }

  void handleCancel() {
    setState(() {
      bgColor = widget.normalColor;
    });
  }

  void handleTapUp(TapUpDetails tapDownDetails) {
    if (widget.needHaptic) {
      HapticFeedback.heavyImpact();
    }
    setState(() {
      bgColor = widget.normalColor;
    });
  }
}
