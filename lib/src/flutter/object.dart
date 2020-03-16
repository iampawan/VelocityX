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

// class _VelocityXObjectFitBuilder extends VelocityXWidgetBuilder<Widget> {
//   _VelocityXObjectFitBuilder.cover(this._child) : _boxFit = BoxFit.cover;
//   _VelocityXObjectFitBuilder.contain(this._child) : _boxFit = BoxFit.contain;
//   _VelocityXObjectFitBuilder.fill(this._child) : _boxFit = BoxFit.fill;
//   _VelocityXObjectFitBuilder.scaleDown(this._child)
//       : _boxFit = BoxFit.scaleDown;
//   _VelocityXObjectFitBuilder.none(this._child) : _boxFit = BoxFit.none;

//   final Widget _child;
//   final BoxFit _boxFit;
//   Alignment _alignment;

//   _VelocityXObjectFitBuilder alignment({@required alignment}) =>
//       this.._alignment = alignment;

//   @override
//   Widget build() {
//     return FittedBox(
//       child: _child,
//       alignment: _alignment ?? Alignment.center,
//       fit: _boxFit,
//     );
//   }
// }

// class _VelocityXObjectAlignBuilder extends VelocityXWidgetBuilder<Widget> {
//   _VelocityXObjectAlignBuilder.topLeft(this._child) : _alignment = Alignment.topLeft;
//   _VelocityXObjectAlignBuilder.topCenter(this._child) : _alignment = Alignment.topCenter;
//   _VelocityXObjectAlignBuilder.topRight(this._child) : _alignment = Alignment.topRight;
//   _VelocityXObjectAlignBuilder.centerLeft(this._child)
//       : _alignment = Alignment.centerLeft;
//   _VelocityXObjectAlignBuilder.center(this._child) : _alignment = Alignment.center;
//   _VelocityXObjectAlignBuilder.centerRight(this._child)
//       : _alignment = Alignment.centerRight;
//   _VelocityXObjectAlignBuilder.bottomLeft(this._child)
//       : _alignment = Alignment.bottomLeft;
//   _VelocityXObjectAlignBuilder.bottomCenter(this._child)
//       : _alignment = Alignment.bottomCenter;
//   _VelocityXObjectAlignBuilder.bottomRight(this._child)
//       : _alignment = Alignment.bottomRight;

//   _VelocityXObjectAlignBuilder.xy(this._child, double x, double y)
//       : _alignment = Alignment(x, y);

//   _VelocityXObjectAlignBuilder.lerp(this._child, Alignment a, Alignment b, double t)
//       : _alignment = Alignment.lerp(a, b, t);

//   final Widget _child;
//   final Alignment _alignment;
//   double _heightfactor;
//   double _widthfactor;

//   _VelocityXObjectAlignBuilder heightFactor(double heightFactor) =>
//       this.._heightfactor = heightFactor;
//   _VelocityXObjectAlignBuilder widthFactor(double widthFactor) =>
//       this.._widthfactor = widthFactor;

//   @override
//   Widget build() {
//     return Align(
//       child: _child,
//       alignment: _alignment ?? Alignment.center,
//       heightFactor: _heightfactor,
//       widthFactor: _widthfactor,
//     );
//   }
// }

extension ObjectExtensions on Widget {
  // ObjectFitBuilder get objectCover => ObjectFitBuilder.cover(this);
  // ObjectFitBuilder get objectContain => ObjectFitBuilder.contain(this);
  // ObjectFitBuilder get objectFill => ObjectFitBuilder.fill(this);
  // ObjectFitBuilder get objectScaleDown => ObjectFitBuilder.scaleDown(this);
  // ObjectFitBuilder get objectNone => ObjectFitBuilder.none(this);
  // ObjectAlignBuilder get objectTopLeft => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectTopCenter => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectTopRight => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectCenterLeft => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectCenter => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectCenterRight => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectBottomLeft => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectBottomCenter => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder get objectBottomRight => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder objectXY({@required double x, @required double y}) =>
  //     ObjectAlignBuilder.xy(this, x, y);
  // ObjectAlignBuilder objectLerp(
  //         {@required Alignment a, @required Alignment b, @required double t}) =>
  //     ObjectAlignBuilder.lerp(this, a, b, t);
  Widget get objectCover => FittedBox(
        fit: BoxFit.cover,
        child: this,
        alignment: Alignment.center,
      );

  Widget get objectContain => FittedBox(
        fit: BoxFit.contain,
        child: this,
        alignment: Alignment.center,
      );

  Widget get objectFill => FittedBox(
        fit: BoxFit.fill,
        child: this,
        alignment: Alignment.center,
      );

  Widget get objectScaleDown => FittedBox(
        fit: BoxFit.scaleDown,
        child: this,
        alignment: Alignment.center,
      );

  Widget get objectNone => FittedBox(
        fit: BoxFit.none,
        child: this,
        alignment: Alignment.center,
      );

  Align objectTopLeft({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.topLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );
  Align objectTopCenter({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.topCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectTopRight({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.topRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectBottomLeft({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.bottomLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectBottomCenter({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.bottomCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectBottomRight({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.bottomRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectCenterLeft({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.centerLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectCenter({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.center,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectCenterRight({
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.centerRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectLERP(
    Alignment a,
    Alignment b,
    double t, {
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment.lerp(a, b, t),
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );

  Align objectXY(
    double x,
    double y, {
    Key key,
    double heightFactor,
    double widthFactor,
  }) =>
      Align(
        key: key,
        child: this,
        alignment: Alignment(x, y),
        heightFactor: heightFactor,
        widthFactor: widthFactor,
      );
}
