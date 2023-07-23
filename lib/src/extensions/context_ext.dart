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

import 'dart:ui';

import 'package:flutter/cupertino.dart' show CupertinoTheme, CupertinoThemeData;
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/// Extensions for general basic [Context]
extension VxContextExtensions on BuildContext {
  MaterialResponsiveUiData get _mdResponsive =>
      MaterialResponsiveUiData.of(this);

  /// Screen Sizes Extensions for responsive UI

  /// Returns Material no. of Columns as per Material Design Guidlines.
  int get mdColumns => _mdResponsive.columns;

  /// Returns Material no. of Gutters as per Material Design Guidlines.
  double get mdGutter => _mdResponsive.gutter;

  /// Returns device Type  as per Material Design Guidlines.
  MobileDeviceType get mdDeviceType => _mdResponsive.deviceInfo.deviceType;

  /// Returns device size as per Material Design Guidlines.
  MobileDeviceSize get mdDeviceSize => _mdResponsive.deviceInfo.deviceSize;

  /// Returns the current window size as per Material Design Guidlines.
  VxWindowSize get mdWindowSize => _mdResponsive.windowSize;

  /// Check if the window size is of Mobile Type as per Material Design Guidlines.
  bool get isMobile => mdWindowSize == VxWindowSize.xsmall;

  /// Check if the window size is xsmall.
  bool get isXSmallSize => screenWidth < 600;

  /// Check if the window size is small.
  bool get isSmallSize => screenWidth >= 600 && screenWidth < 1024;

  /// Check if the window size is medium.
  bool get isMediumSize => screenWidth >= 1024 && screenWidth < 1440;

  /// Check if the window size is large.
  bool get isLargeSize => screenWidth >= 1440 && screenWidth < 1920;

  /// Check if the window size is xlarge.
  bool get isXLargeSize => screenWidth >= 1920;

  /// Returns if it's a handset as per Material Design Guidlines.
  bool get isMobileTypeHandset => mdDeviceType == MobileDeviceType.handset;

  /// Returns if it's a tablet as per Material Design Guidlines.
  bool get isMobileTypeTablet => mdDeviceType == MobileDeviceType.tablet;

  /// To get a [MediaQuery] directly.
  MediaQueryData get mq => MediaQuery.of(this);

  /// Get MediaQuery Screen Size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get MediaQuery Screen Density
  double get screenDensity => MediaQuery.devicePixelRatioOf(this);

  /// Get MediaQuery devicePixelRatio
  double get devicePixelRatio => mq.devicePixelRatio;

  /// Get MediaQuery Screen Padding
  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);

  /// Get MediaQuery Screen Width
  double get screenWidth => screenSize.width;

  /// Get MediaQuery Screen Height
  double get screenHeight => screenSize.height;

  /// Get MediaQuery Screen Width in percentage
  double get percentWidth => screenWidth / 100;

  /// Get MediaQuery Screen height in percentage
  double get percentHeight => screenHeight / 100;

  /// Get MediaQuery safearea padding horizontally
  double get _safeAreaHorizontal => screenPadding.left + screenPadding.right;

  /// Get MediaQuery safearea padding vertically
  double get _safeAreaVertical => screenPadding.top + screenPadding.bottom;

  /// Get MediaQuery Screen Width in percentage including safe area calculation.
  double get safePercentWidth => (screenWidth - _safeAreaHorizontal) / 100;

  /// Get MediaQuery Screen Height in percentage including safe area calculation.
  double get safePercentHeight => (screenHeight - _safeAreaVertical) / 100;

  /// Gives you the power to get a portion of the height.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the height
  ///
  /// [reducedBy] is a percentage value of how much of the height you want
  /// if you for example want 46% of the height, then you reduce it by 56%.
  double heightTransformer({double dividedBy = 1, double reducedBy = 0.0}) =>
      (screenSize.height - ((screenSize.height / 100) * reducedBy)) / dividedBy;

  /// Gives you the power to get a portion of the width.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the width
  ///
  /// [reducedBy] is a percentage value of how much of the width you want
  /// if you for example want 46% of the width, then you reduce it by 56%.
  double widthTransformer({double dividedBy = 1, double reducedBy = 0.0}) =>
      (screenSize.width - ((screenSize.width / 100) * reducedBy)) / dividedBy;

  /// Divide the height proportionally by the given value
  double ratio(
          {double dividedBy = 1,
          double reducedByW = 0.0,
          double reducedByH = 0.0}) =>
      heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
      widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);

  /// Returns the [FlutterView] that the provided `context` will render into.
  FlutterView get view => View.of(this);

  /// Returns the [FlutterView] that the provided `context` will render into.
  FlutterView? get maybeView => View.maybeOf(this);

  ///Returns Orientation using [MediaQuery]
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// True if width be larger than 800
  bool get canShowNavRail => screenWidth > 800;

  /// Extension for getting Theme
  ThemeData get theme => Theme.of(this);

  /// Extension for getting [CupertinoThemeData]
  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);

  /// Extension for getting textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for getting textTheme
  TextStyle? get captionStyle => Theme.of(this).textTheme.bodySmall;

  ColorScheme get colors => theme.colorScheme;
  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get titleLarge => textTheme.titleLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get titleSmall => textTheme.titleSmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
        color: colors.onSurface,
      );

  ///
  /// The foreground color for widgets (knobs, text, overscroll edge effect, etc).
  ///
  /// Accent color is also known as the secondary color.
  ///
  Color get accentColor => theme.colorScheme.secondary;

  ///
  /// The background color for major parts of the app (toolbars, tab bars, etc).
  ///
  Color get primaryColor => theme.primaryColor;

  ///
  /// A color that contrasts with the [primaryColor].
  ///
  Color get backgroundColor => theme.colorScheme.background;

  ///
  /// The default color of [MaterialType.canvas] [Material].
  ///
  Color get canvasColor => theme.canvasColor;

  ///
  /// The default color of [MaterialType.card] [Material].
  ///
  Color get cardColor => theme.cardColor;

  ///
  /// The default brightness of the [Theme].
  ///
  Brightness get brightness => theme.brightness;

  /// If the [ThemeData] of the current [BuildContext] is dark
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Extension for navigation to next page
  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for routing in flutter
  ///
  NavigatorState? get vxnavigator => Navigator.of(this);

  ///
  /// Pushes the built widget to the screen using the material fade in animation
  ///
  void nextPage(Widget page, {bool maintainState = true}) =>
      _nextPage(context: this, page: page, maintainState: maintainState);

  /// Pushes and replacing the built widget to the screen using the material fade in animation
  void nextReplacementPage(Widget page, {bool maintainState = true}) =>
      _nextReplacementPage(
          context: this, page: page, maintainState: maintainState);

  /// Removing all the widgets till defined rule, and pushes the built widget to the screen using the material fade in animation
  void nextAndRemoveUntilPage(Widget page) =>
      _nextAndRemoveUntilPage(context: this, page: page);

  /// Action Extension
  bool? invokeAction(Intent intent) => Actions.invoke(this, intent) as bool?;

  /// Returns The state from the closest instance of this class that encloses the given context.
  /// It is used for validating forms
  FormState? get vxform => Form.of(this);

  ///
  /// Returns The current [Locale] of the app as specified in the [Localizations] widget.
  ///
  Locale? get vxlocale => Localizations.localeOf(this);

  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for showing widgets on top of everything.
  ///
  OverlayState? get vxoverlay => Overlay.of(this);

  ///
  /// Insert the given widget into the overlay.
  /// The newly inserted widget will always be at the top.
  ///
  OverlayEntry addOverlay(WidgetBuilder builder) {
    final entry = OverlayEntry(builder: builder);
    vxoverlay!.insert(entry);
    return entry;
  }

  ///
  /// Returns the closest instance of [ScaffoldState] in the widget tree,
  /// which can be use to get information about that scaffold.
  ///
  /// If there is no [Scaffold] in scope, then this will throw an exception.
  ///
  ScaffoldState get vxscaffold => Scaffold.of(this);
}

Future<void> _nextPage(
        {required BuildContext context,
        required Widget page,
        bool maintainState = true}) async =>
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          maintainState: maintainState,
        ));
Future<void> _nextReplacementPage(
        {required BuildContext context,
        required Widget page,
        bool maintainState = true}) async =>
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          maintainState: maintainState,
        ));
Future<void> _nextAndRemoveUntilPage(
        {required BuildContext context, required Widget page}) async =>
    await Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
