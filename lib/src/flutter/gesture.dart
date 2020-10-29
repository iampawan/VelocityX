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
  _VxGestureBuilder(this._child, this._onClick) : assert(_onClick != null);
  _VxGestureBuilder.doubleClick(this._child, this._onDoubleClick)
      : assert(_child != null),
        assert(_onDoubleClick != null);
  _VxGestureBuilder.longClick(this._child, this._onLongClick)
      : assert(_child != null),
        assert(_onLongClick != null);

  final Widget _child;
  Function _onClick;
  Function _onDoubleClick;
  Function _onLongClick;

  /// On clicking two times.
  _VxGestureBuilder doubleClick({@required Function onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  /// On long pressing.
  _VxGestureBuilder longClick({@required Function onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key key}) {
    return GestureDetector(
      key: key,
      onTap: _onClick,
      child: _child,
      onDoubleTap: _onDoubleClick,
      onLongPress: _onLongClick,
    );
  }
}

typedef FnBuilderCallback = void Function();

class _VelocityXInkWellBuilder extends VxWidgetBuilder<Widget> {
  _VelocityXInkWellBuilder(this._child, this._onClick);
  _VelocityXInkWellBuilder.mdDoubleClick(this._child, this._onDoubleClick);
  _VelocityXInkWellBuilder.mdLongClick(this._child, this._onLongClick);

  final Widget _child;
  FnBuilderCallback _onClick;
  FnBuilderCallback _onDoubleClick;
  FnBuilderCallback _onLongClick;
  Color _splashColor;

  /// Use to show a splash color when clicking on the widget.
  _VelocityXInkWellBuilder splashColor(Color color) =>
      this.._splashColor = color;

  /// On clicking two times.
  _VelocityXInkWellBuilder mdDoubleClick(
          {@required FnBuilderCallback onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  /// On long pressing.
  _VelocityXInkWellBuilder mdLongClick(
          {@required FnBuilderCallback onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key key}) {
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
  /// Extension method to directly access [_VxGestureBuilder] single click with any widget without wrapping or with dot operator.
  ///
  _VxGestureBuilder click(FnBuilderCallback onClick) =>
      _VxGestureBuilder(this, onClick);

  ///
  /// Extension method to directly access [_VxGestureBuilder] double click with any widget without wrapping or with dot operator.
  ///
  _VxGestureBuilder doubleClick(FnBuilderCallback onClick) =>
      _VxGestureBuilder.doubleClick(this, onClick);

  ///
  /// Extension method to directly access [_VxGestureBuilder] long click with any widget without wrapping or with dot operator.
  ///
  _VxGestureBuilder longClick(FnBuilderCallback onClick) =>
      _VxGestureBuilder.longClick(this, onClick);

  ///
  /// Extension method to directly access material [_VelocityXInkWellBuilder] single click with any widget without wrapping or with dot operator.
  ///
  _VelocityXInkWellBuilder mdClick(FnBuilderCallback onClick) =>
      _VelocityXInkWellBuilder(this, onClick);

  ///
  /// Extension method to directly access material [_VelocityXInkWellBuilder] double click with any widget without wrapping or with dot operator.
  ///
  _VelocityXInkWellBuilder mdDoubleClick(FnBuilderCallback onClick) =>
      _VelocityXInkWellBuilder.mdDoubleClick(this, onClick);

  ///
  /// Extension method to directly access material [_VelocityXInkWellBuilder] long click with any widget without wrapping or with dot operator.
  ///
  _VelocityXInkWellBuilder mdLongClick(FnBuilderCallback onClick) =>
      _VelocityXInkWellBuilder.mdLongClick(this, onClick);
}
