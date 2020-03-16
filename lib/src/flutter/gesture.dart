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

class GestureBuilder extends VelocityXWidgetBuilder<Widget> {
  GestureBuilder(this._child, this._onClick);
  GestureBuilder.doubleClick(this._child, this._onDoubleClick);
  GestureBuilder.longClick(this._child, this._onLongClick);

  final Widget _child;
  Function _onClick;
  Function _onDoubleClick;
  Function _onLongClick;

  GestureBuilder doubleClick({@required Function onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  GestureBuilder longClick({@required Function onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget build() {
    return GestureDetector(
      onTap: _onClick,
      child: _child,
      onDoubleTap: _onDoubleClick,
      onLongPress: _onLongClick,
    );
  }
}

class InkWellBuilder extends VelocityXWidgetBuilder<Widget> {
  InkWellBuilder(this._child, this._onClick);
  InkWellBuilder.mdDoubleClick(this._child, this._onDoubleClick);
  InkWellBuilder.mdLongClick(this._child, this._onLongClick);

  final Widget _child;
  Function _onClick;
  Function _onDoubleClick;
  Function _onLongClick;
  Color _splashColor;

  InkWellBuilder splashColor(Color color) => this.._splashColor = color;

  InkWellBuilder mdDoubleClick({@required Function onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  InkWellBuilder mdLongClick({@required Function onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget build() {
    return InkWell(
      onTap: _onClick,
      child: _child,
      splashColor: _splashColor,
      onDoubleTap: _onDoubleClick,
      onLongPress: _onLongClick,
    );
  }
}

extension GestureExtensions on Widget {
  GestureBuilder click(Function onClick) => GestureBuilder(this, onClick);
  GestureBuilder doubleClick(Function onClick) =>
      GestureBuilder.doubleClick(this, onClick);
  GestureBuilder longClick(Function onClick) =>
      GestureBuilder.longClick(this, onClick);

  InkWellBuilder mdClick(Function onClick) => InkWellBuilder(this, onClick);
  InkWellBuilder mdDoubleClick(Function onClick) =>
      InkWellBuilder.mdDoubleClick(this, onClick);
  InkWellBuilder mdLongClick(Function onClick) =>
      InkWellBuilder.mdLongClick(this, onClick);
}
