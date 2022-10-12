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

///
/// Extension method to directly access [SingleChildScrollView] with any widget without wrapping or with dot operator.
extension ScrollExtension on Widget {
  ///
  /// Extension method to directly access [SingleChildScrollView] vertically with any widget without wrapping or with dot operator.
  ///
  Widget scrollVertical(
          {Key? key,
          ScrollController? controller,
          ScrollPhysics? physics,
          EdgeInsetsGeometry? padding}) =>
      SingleChildScrollView(
          child: this,
          key: key,
          scrollDirection: Axis.vertical,
          controller: controller,
          physics: physics,
          padding: padding);

  ///
  /// Extension method to directly access [SingleChildScrollView] horizontally with any widget without wrapping or with dot operator.
  ///
  Widget scrollHorizontal(
          {Key? key,
          ScrollController? controller,
          ScrollPhysics? physics,
          EdgeInsetsGeometry? padding}) =>
      SingleChildScrollView(
        key: key,
        child: this,
        scrollDirection: Axis.horizontal,
      );
}

/// Extensions for ScrollController
extension VxScrollControllerExtension on ScrollController {
  void animToTop() {
    animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  void animToBottom() {
    animateTo(position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  void jumpToTop() {
    jumpTo(0);
  }

  void jumpToBottom() {
    jumpTo(position.maxScrollExtent);
  }
}

///
/// Widget to directly access [SingleChildScrollView] vertically.
///
class VxScrollVertical extends StatelessWidget {
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const VxScrollVertical({
    Key? key,
    this.controller,
    this.physics,
    this.padding,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      child: child,
      scrollDirection: Axis.vertical,
      controller: controller,
      physics: physics,
      padding: padding,
    );
  }
}

///
/// Widget to directly access [SingleChildScrollView] horizontally.
///
class VxScrollHorizontal extends StatelessWidget {
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const VxScrollHorizontal({
    Key? key,
    this.controller,
    this.physics,
    this.padding,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      child: child,
      scrollDirection: Axis.horizontal,
      controller: controller,
      physics: physics,
      padding: padding,
    );
  }
}
