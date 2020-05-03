/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/src/responsive_ui.dart';
import 'package:velocity_x/velocity_x.dart';

extension ContextExtensions on BuildContext {
  MaterialResponsiveUiData get _mdResponsive =>
      MaterialResponsiveUiData.of(this);

  /// Screen Sizes Extensions for responsive UI
  int get mdColumns => _mdResponsive.columns;
  double get mdGutter => _mdResponsive.gutter;
  MobileDeviceType get mdDeviceType => _mdResponsive.deviceInfo.deviceType;
  MobileDeviceSize get mdDeviceSize => _mdResponsive.deviceInfo.deviceSize;
  MobileWindowSize get mdWindowSize => _mdResponsive.windowSize;
  bool get isMobile => mdWindowSize == MobileWindowSize.xsmall;

  /// It measures landscape positions too
  bool get isMobileTypeHandset => mdDeviceType == MobileDeviceType.handset;
  bool get isMobileTypeTablet => mdDeviceType == MobileDeviceType.tablet;

  MediaQueryData get mq => MediaQuery.of(this);
  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;
  double get percentWidth => screenWidth / 100;
  double get percentHeight => screenHeight / 100;
  double get _safeAreaHorizontal => mq.padding.left + mq.padding.right;
  double get _safeAreaVertical => mq.padding.top + mq.padding.bottom;
  double get safePercentWidth => (screenWidth - _safeAreaHorizontal) / 100;
  double get safePercentHeight => (screenHeight - _safeAreaVertical) / 100;

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Extension for getting NavigatorState
  NavigatorState get nav => Navigator.of(this);

  /// Extension for getting Theme
  ThemeData get theme => Theme.of(this);

  /// Extension for getting textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for getting textTheme
  TextStyle get captionStyle => Theme.of(this).textTheme.caption;
}
