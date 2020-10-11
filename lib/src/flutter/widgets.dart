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

extension WidgetsExtension on Widget {
  ///Tooltip as accessibility
  Widget tooltip(String message,
          {Key key,
          Decoration decoration,
          double height,
          bool preferBelow,
          EdgeInsetsGeometry padding,
          TextStyle textStyle,
          Duration waitDuration,
          EdgeInsetsGeometry margin}) =>
      Tooltip(
        key: key,
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );

  ///Hides a widget
  Widget hide({Key key, bool isVisible = false, bool maintainSize = false}) =>
      Visibility(
        key: key,
        child: this,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
      );

  /// Widget to show exception
  Widget errorWidget(Object ex) => ErrorWidget(ex);
}

extension StringWidgetsExtension on String {
  Widget circularAssetImage(
          {double radius = 35.0,
          Color bgColor = Colors.white,
          Color fgColor,
          Widget child}) =>
      CircleAvatar(
        radius: radius,
        backgroundColor: bgColor,
        child: child,
        foregroundColor: fgColor,
        backgroundImage: AssetImage(this),
      );

  Widget circlularNetworkImage(
          {double radius = 65.0,
          Color bgColor = Colors.white,
          Color fgColor,
          Widget child}) =>
      CircleAvatar(
        radius: radius,
        backgroundColor: bgColor,
        child: child,
        foregroundColor: fgColor,
        backgroundImage: NetworkImage(
          this,
        ),
      );

  Widget circularAssetShadowImage({
    EdgeInsets margin = const EdgeInsets.all(0.0),
    EdgeInsets padding = const EdgeInsets.all(0.0),
    double width = 40.0,
    double height = 40.0,
    double blurRadius = 3.0,
    double borderRadius = 50.0,
  }) =>
      Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          image: DecorationImage(image: AssetImage(this)),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: blurRadius,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
          ],
        ),
      );
}
