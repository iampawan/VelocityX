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

extension ObjectExtensions on Widget {
  Widget objectCover({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.cover,
        child: this,
        alignment: Alignment.center,
      );

  Widget objectContain({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.contain,
        child: this,
        alignment: Alignment.center,
      );

  Widget objectFill({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.fill,
        child: this,
        alignment: Alignment.center,
      );

  Widget objectScaleDown({Key key}) => FittedBox(
        key: key,
        fit: BoxFit.scaleDown,
        child: this,
        alignment: Alignment.center,
      );

  Widget objectNone({Key key}) => FittedBox(
        key: key,
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
