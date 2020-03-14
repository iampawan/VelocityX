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

extension AlignExtensions on Widget {
  Align alignAtTopLeft({
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
  Align alignAtTopCenter({
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

  Align alignAtTopRight({
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

  Align alignAtBottomLeft({
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

  Align alignAtBottomCenter({
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

  Align alignAtBottomRight({
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

  Align alignAtCenterLeft({
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

  Align alignAtCenter({
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

  Align alignAtCenterRight({
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

  Align alignAtLERP(
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

  Align alignXY(
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
