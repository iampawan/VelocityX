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
import 'package:vector_math/vector_math_64.dart' as v3;

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
class VxGestureBuilder extends VxWidgetBuilder<Widget> {
  VxGestureBuilder(this._child, Function this._onClick);
  VxGestureBuilder.doubleClick(this._child, Function this._onDoubleClick);
  VxGestureBuilder.longClick(this._child, Function this._onLongClick);

  final Widget _child;
  Function? _onClick;
  Function? _onDoubleClick;
  Function? _onLongClick;

  /// On clicking two times.
  VxGestureBuilder doubleClick({required Function onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  /// On long pressing.
  VxGestureBuilder longClick({required Function onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key? key}) {
    return GestureDetector(
      key: key,
      onTap: _onClick as void Function()?,
      onDoubleTap: _onDoubleClick as void Function()?,
      onLongPress: _onLongClick as void Function()?,
      child: _child,
    );
  }
}

typedef FnBuilderCallback = void Function();

class VelocityXInkWellBuilder extends VxWidgetBuilder<Widget> {
  VelocityXInkWellBuilder(this._child, this._onClick);
  VelocityXInkWellBuilder.mdDoubleClick(this._child, this._onDoubleClick);
  VelocityXInkWellBuilder.mdLongClick(this._child, this._onLongClick);

  final Widget _child;
  FnBuilderCallback? _onClick;
  FnBuilderCallback? _onDoubleClick;
  FnBuilderCallback? _onLongClick;
  Color? _splashColor;

  /// Use to show a splash color when clicking on the widget.
  VelocityXInkWellBuilder splashColor(Color color) =>
      this.._splashColor = color;

  /// On clicking two times.
  VelocityXInkWellBuilder mdDoubleClick(
          {required FnBuilderCallback onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  /// On long pressing.
  VelocityXInkWellBuilder mdLongClick(
          {required FnBuilderCallback onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key? key}) {
    return InkWell(
      key: key,
      onTap: _onClick,
      splashColor: _splashColor,
      onDoubleTap: _onDoubleClick,
      onLongPress: _onLongClick,
      child: _child,
    );
  }
}

extension VxGestureExtensions on Widget {
  ///
  /// Note - For single prop use [onTap]. Extension method to directly access [VxGestureBuilder] single click with any widget without wrapping or with dot operator.
  ///
  VxGestureBuilder click(FnBuilderCallback onClick) =>
      VxGestureBuilder(this, onClick);

  ///
  /// Note - For single prop use [onDoubleTap]. Extension method to directly access [VxGestureBuilder] double click with any widget without wrapping or with dot operator.
  ///
  VxGestureBuilder doubleClick(FnBuilderCallback onClick) =>
      VxGestureBuilder.doubleClick(this, onClick);

  /// Note - For single prop use [onLongPress].
  /// Extension method to directly access [VxGestureBuilder] long click with any widget without wrapping or with dot operator.
  ///
  VxGestureBuilder longClick(FnBuilderCallback onClick) =>
      VxGestureBuilder.longClick(this, onClick);

  /// Note - For single prop use [onInkTap].
  /// Extension method to directly access material [VelocityXInkWellBuilder] single click with any widget without wrapping or with dot operator.
  ///
  VelocityXInkWellBuilder mdClick(FnBuilderCallback onClick) =>
      VelocityXInkWellBuilder(this, onClick);

  /// Note - For single prop use [onInkDoubleTap].
  /// Extension method to directly access material [VelocityXInkWellBuilder] double click with any widget without wrapping or with dot operator.
  ///
  VelocityXInkWellBuilder mdDoubleClick(FnBuilderCallback onClick) =>
      VelocityXInkWellBuilder.mdDoubleClick(this, onClick);

  /// Note - For single prop use [onInkLongPress].
  /// Extension method to directly access material [VelocityXInkWellBuilder] long click with any widget without wrapping or with dot operator.
  ///
  VelocityXInkWellBuilder mdLongClick(FnBuilderCallback onClick) =>
      VelocityXInkWellBuilder.mdLongClick(this, onClick);

  Widget onTap(VoidCallback? onTap,
      {Key? key,
      HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return MouseRegion(
      key: key,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: hitTestBehavior,
        onTap: onTap,
        child: this,
      ),
    );
  }

  InkWell onInkTap(VoidCallback? onTap, {Key? key}) {
    return InkWell(
      key: key,
      onTap: onTap,
      child: this,
    );
  }

  Widget onDoubleTap(VoidCallback? onDoubleTap,
      {Key? key,
      HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return MouseRegion(
      key: key,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: hitTestBehavior,
        onDoubleTap: onDoubleTap,
        child: this,
      ),
    );
  }

  InkWell onInkDoubleTap(VoidCallback? onDoubleTap, {Key? key}) {
    return InkWell(
      key: key,
      onDoubleTap: onDoubleTap,
      child: this,
    );
  }

  Widget onLongPress(VoidCallback? onLongPress, Key? key,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return MouseRegion(
      key: key,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: hitTestBehavior,
        onLongPress: onLongPress,
        child: this,
      ),
    );
  }

  InkWell onInkLongPress(VoidCallback? onLongPress, {Key? key}) {
    return InkWell(
      key: key,
      onLongPress: onLongPress,
      child: this,
    );
  }

  ///it is very much like onTap extension but when you put your finger on it, its color will change,
  ///and you can decide that whether it will have a touchFeedBack (vibration on your phone)
  ///

  Widget onFeedBackTap(VoidCallback? onTap,
      {Key? key,
      HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild,
      bool touchFeedBack = false}) {
    return _CallbackButton(
      key: key,
      onTap: onTap,
      needHaptic: touchFeedBack,
      hitTestBehavior: hitTestBehavior,
      normalColor: Colors.transparent,
      pressedColor: Colors.black12,
      child: this,
    );
  }

  /// Mouse Region Hover
  MouseRegion onMouseHover(PointerHoverEventListener? onHover, {Key? key}) {
    return MouseRegion(
      key: key,
      onHover: onHover,
      child: this,
    );
  }

  /// Mouse Region Enter
  MouseRegion onMouseEnter(PointerEnterEventListener? onEnter, {Key? key}) {
    return MouseRegion(
      key: key,
      onEnter: onEnter,
      child: this,
    );
  }

  /// Mouse Region Exit
  MouseRegion onMouseExit(PointerExitEventListener? onExit, {Key? key}) {
    return MouseRegion(
      key: key,
      onExit: onExit,
      child: this,
    );
  }

  /// Mouse Region Enter & Exit
  MouseRegion onMouseEnterExit({
    Key? key,
    PointerEnterEventListener? onEnter,
    PointerExitEventListener? onExit,
  }) {
    return MouseRegion(
      key: key,
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
      {super.key,
      this.onTap,
      this.child,
      this.normalColor = Colors.transparent,
      this.pressedColor = Colors.black12,
      this.needHaptic = false,
      this.hitTestBehavior});

  @override
  _CallbackButtonState createState() => _CallbackButtonState();
}

class _CallbackButtonState extends State<_CallbackButton> {
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: widget.hitTestBehavior,
        onTap: widget.onTap,
        onTapDown: handleTapDown,
        onTapUp: handleTapUp,
        onTapCancel: handleCancel,
        child: Container(
          color: bgColor,
          child: widget.child,
        ),
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

//
// Transform widget enables the overlay to be updated dynamically
//
class _VxTransformWidget extends StatefulWidget {
  const _VxTransformWidget({
    super.key,
    required this.child,
    required this.matrix,
  });

  final Widget child;
  final Matrix4 matrix;

  @override
  _VxTransformWidgetState createState() => _VxTransformWidgetState();
}

class _VxTransformWidgetState extends State<_VxTransformWidget> {
  Matrix4? _matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: widget.matrix * _matrix,
      child: widget.child,
    );
  }

  void setMatrix(Matrix4? matrix) {
    setState(() {
      _matrix = matrix;
    });
  }
}

///
/// VxZoom widget allows a widget to pinch and zoom on top of current context
/// by inserting a [OverlayEntry].
///
class VxZoom extends StatefulWidget {
  const VxZoom({
    super.key,
    this.twoTouchOnly = false,
    required this.child,
    this.minScale,
    this.maxScale,
    this.animationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.fastOutSlowIn,
    this.modalBarrierColor,
  });

  /// A widget to make zoomable.
  final Widget child;

  ///  Specifies the minimum multiplier it can scale outwards.
  final double? minScale;

  ///  Specifies the maximum multiplier the user can zoom inwards.
  final double? maxScale;

  /// Specifies wither the zoom is enabled only with two fingers on the screen.
  ///  Defaults to false.
  final bool twoTouchOnly;

  /// Specifies the animation duartion when the widget zoom has ended and is
  /// animating back to the original place.
  final Duration animationDuration;

  /// Specifies the animation curve when the widget zoom has ended and is
  /// animating back to the original place.
  final Curve animationCurve;

  /// Specifies the color of the modal barrier that shows in the background.
  final Color? modalBarrierColor;

  @override
  VxZoomState createState() => VxZoomState();
}

class VxZoomState extends State<VxZoom> with TickerProviderStateMixin {
  Matrix4? _matrix = Matrix4.identity();
  late Offset _startFocalPoint;
  late Animation<Matrix4> _animationReset;
  late AnimationController _controllerReset;
  OverlayEntry? _overlayEntry;
  bool _isZooming = false;
  int _touchCount = 0;
  Matrix4 _transformMatrix = Matrix4.identity();

  final _transformWidget = GlobalKey<_VxTransformWidgetState>();

  @override
  void initState() {
    super.initState();

    _controllerReset = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _controllerReset
      ..addListener(() {
        _transformWidget.currentState!.setMatrix(_animationReset.value);
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          hide();
        }
      });
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _incrementEnter,
      onPointerUp: _incrementExit,
      onPointerCancel: _incrementExit,
      child: GestureDetector(
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        onScaleEnd: onScaleEnd,
        child: Opacity(opacity: _isZooming ? 0 : 1, child: widget.child),
      ),
    );
  }

  void onScaleStart(ScaleStartDetails details) {
    //Dont start the effect if the image havent reset complete.
    if (_controllerReset.isAnimating) {
      return;
    }
    if (widget.twoTouchOnly && _touchCount < 2) {
      return;
    }
    _startFocalPoint = details.focalPoint;

    _matrix = Matrix4.identity();

    // create an matrix of where the image is on the screen for the overlay
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _transformMatrix = Matrix4.translation(
      v3.Vector3(position.dx, position.dy, 0),
    );

    show();

    setState(() {
      _isZooming = true;
    });
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    if (!_isZooming || _controllerReset.isAnimating) {
      return;
    }

    final translationDelta = details.focalPoint - _startFocalPoint;

    final translate = Matrix4.translation(
      v3.Vector3(translationDelta.dx, translationDelta.dy, 0),
    );

    final renderBox = context.findRenderObject() as RenderBox;
    final focalPoint = renderBox.globalToLocal(
      details.focalPoint - translationDelta,
    );

    var scaleby = details.scale;
    if (widget.minScale != null && scaleby < widget.minScale!) {
      scaleby = widget.minScale ?? 0;
    }

    if (widget.maxScale != null && scaleby > widget.maxScale!) {
      scaleby = widget.maxScale ?? 0;
    }

    final dx = (1 - scaleby) * focalPoint.dx;
    final dy = (1 - scaleby) * focalPoint.dy;

    final scale =
        Matrix4(scaleby, 0, 0, 0, 0, scaleby, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);

    _matrix = translate * scale;

    if (_transformWidget.currentState != null) {
      _transformWidget.currentState!.setMatrix(_matrix);
    }
  }

  void onScaleEnd(ScaleEndDetails details) {
    if (!_isZooming || _controllerReset.isAnimating) {
      return;
    }
    _animationReset = Matrix4Tween(
      begin: _matrix,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(
        parent: _controllerReset,
        curve: widget.animationCurve,
      ),
    );
    _controllerReset
      ..reset()
      ..forward();
  }

  Widget _build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          ModalBarrier(
            color: widget.modalBarrierColor,
          ),
          _VxTransformWidget(
            key: _transformWidget,
            matrix: _transformMatrix,
            child: widget.child,
          )
        ],
      ),
    );
  }

  Future<void> show() async {
    if (!_isZooming) {
      final overlayState = Overlay.of(context);
      _overlayEntry = OverlayEntry(builder: _build);
      overlayState.insert(_overlayEntry!);
    }
  }

  Future<void> hide() async {
    setState(() {
      _isZooming = false;
    });

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _incrementEnter(PointerEvent details) => _touchCount++;

  void _incrementExit(PointerEvent details) => _touchCount--;
}

extension VxZoomExtensions on Widget {
  Widget zoom({
    Key? key,
    double? minScale,
    double? maxScale,
    bool twoTouchOnly = false,
    Duration animationDuration = const Duration(milliseconds: 200),
    Curve animationCurve = Curves.easeOut,
    Color? modalBarrierColor,
  }) =>
      VxZoom(
        key: key,
        minScale: minScale,
        maxScale: maxScale,
        twoTouchOnly: twoTouchOnly,
        animationDuration: animationDuration,
        animationCurve: animationCurve,
        modalBarrierColor: modalBarrierColor,
        child: this,
      );
}
