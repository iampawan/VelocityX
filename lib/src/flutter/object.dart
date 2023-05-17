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

/// Extension Methods for Alignment of the objects.
extension VxObjectExtensions on Widget {
  // ObjectFitBuilder  objectCover => ObjectFitBuilder.cover(this);
  // ObjectFitBuilder  objectContain => ObjectFitBuilder.contain(this);
  // ObjectFitBuilder  objectFill => ObjectFitBuilder.fill(this);
  // ObjectFitBuilder  objectScaleDown => ObjectFitBuilder.scaleDown(this);
  // ObjectFitBuilder  objectNone => ObjectFitBuilder.none(this);
  // ObjectAlignBuilder  objectTopLeft => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectTopCenter => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectTopRight => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectCenterLeft => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectCenter => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectCenterRight => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectBottomLeft => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectBottomCenter => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder  objectBottomRight => ObjectAlignBuilder.topLeft(this);
  // ObjectAlignBuilder objectXY({@required double x, @required double y}) =>
  //     ObjectAlignBuilder.xy(this, x, y);
  // ObjectAlignBuilder objectLerp(
  //         {@required Alignment a, @required Alignment b, @required double t}) =>
  //     ObjectAlignBuilder.lerp(this, a, b, t);

  /// Can be used to wrap as cover fit of the FittedBox.
  Widget objectCover({Key? key}) => FittedBox(
        key: key,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        child: this,
      );

  /// Can be used to wrap as a contain fit of the FittedBox.
  Widget objectContain({Key? key}) => FittedBox(
        key: key,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        child: this,
      );

  /// Can be used to wrap as a fill fit of the FittedBox.
  Widget objectFill({Key? key}) => FittedBox(
        key: key,
        fit: BoxFit.fill,
        alignment: Alignment.center,
        child: this,
      );

  /// Can be used to wrap as a scaledown fit of the FittedBox.
  Widget objectScaleDown({Key? key}) => FittedBox(
        key: key,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: this,
      );

  /// Can be used to wrap as a none fit of the FittedBox.
  Widget objectNone({Key? key}) => FittedBox(
        key: key,
        fit: BoxFit.none,
        alignment: Alignment.center,
        child: this,
      );

  /// Can be used to align a widget to topleft.
  Align objectTopLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to topcenter.
  Align objectTopCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to topright.
  Align objectTopRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to bottomleft.
  Align objectBottomLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to bottomcenter.
  Align objectBottomCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to bottomright.
  Align objectBottomRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to centerleft.
  Align objectCenterLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.centerLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to center.
  Align objectCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.center,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to centerright.
  Align objectCenterRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.centerRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to specified alignment.
  Align objectLERP(
    Alignment a,
    Alignment b,
    double t, {
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.lerp(a, b, t)!,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Can be used to align a widget to specified [x] & [y].
  Align objectXY(
    double x,
    double y, {
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment(x, y),
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );
}
