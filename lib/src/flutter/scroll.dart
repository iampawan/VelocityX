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

extension ScrollExtension on Widget {
  Widget scrollVertical(
          {ScrollController controller,
          ScrollPhysics physics,
          EdgeInsetsGeometry padding}) =>
      SingleChildScrollView(
          child: this,
          scrollDirection: Axis.vertical,
          controller: controller,
          physics: physics,
          padding: padding);
  Widget scrollHorizontal(
          {ScrollController controller,
          ScrollPhysics physics,
          EdgeInsetsGeometry padding}) =>
      SingleChildScrollView(
        child: this,
        scrollDirection: Axis.horizontal,
      );
}

class ScrollVertical extends StatelessWidget {
  final ScrollController controller;
  final ScrollPhysics physics;
  final EdgeInsetsGeometry padding;

  const ScrollVertical({Key key, this.controller, this.physics, this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: this,
        scrollDirection: Axis.vertical,
        controller: controller,
        physics: physics,
        padding: padding);
  }
}

class ScrollHorizontal extends StatelessWidget {
  final ScrollController controller;
  final ScrollPhysics physics;
  final EdgeInsetsGeometry padding;

  const ScrollHorizontal({Key key, this.controller, this.physics, this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: this,
        scrollDirection: Axis.horizontal,
        controller: controller,
        physics: physics,
        padding: padding);
  }
}
