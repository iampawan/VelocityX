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
  Size get screenSize => mq.size;
  EdgeInsets get screenPadding => mq.padding;
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

  ///Returns Orientation
  Orientation get orientation => mq.orientation;

  /// Extension for getting NavigatorState. Use [navigator] now.
  @Deprecated('Use [navigator] instead. It will be removed soon.')
  NavigatorState get nav => Navigator.of(this);

  /// Extension for getting Theme
  ThemeData get theme => Theme.of(this);

  /// Extension for getting textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for getting textTheme
  TextStyle get captionStyle => Theme.of(this).textTheme.caption;

  ///
  /// The foreground color for widgets (knobs, text, overscroll edge effect, etc).
  ///
  /// Accent color is also known as the secondary color.
  ///
  Color get accentColor => theme.accentColor;

  ///
  /// The background color for major parts of the app (toolbars, tab bars, etc).
  ///
  Color get primaryColor => theme.primaryColor;

  ///
  /// A color that contrasts with the [primaryColor].
  ///
  Color get backgroundColor => theme.backgroundColor;

  ///
  /// The default color of [MaterialType.canvas] [Material].
  ///
  Color get canvasColor => theme.canvasColor;

  ///
  /// The default color of [MaterialType.card] [Material].
  ///
  Color get cardColor => theme.cardColor;

  ///
  /// The default color of textSelectionColor.
  ///
  Color get selectionColor => theme.textSelectionColor;

  ///
  /// The default brightness of the [Theme].
  ///
  Brightness get brightness => theme.brightness;

  /// Extension for navigation to next page
  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for routing in flutter
  ///
  NavigatorState get navigator => Navigator.of(this);

  ///
  /// Pushes the built widget to the screen using the material fade in animation
  ///
  /// Will return a value when the built widget calls [pop]
  ///
  Future<T> push<T>(WidgetBuilder builder) async {
    return await navigator.push<T>(MaterialPageRoute(builder: builder));
  }

  ///
  /// Removes the top most Widget in the navigator's stack
  ///
  /// Will return the [result] to the caller of [push]
  ///
  void pop<T>([T result]) => navigator.pop<T>(result);
  void nextPage(Widget page, {bool maintainState = true}) =>
      _nextPage(context: this, page: page, maintainState: maintainState);
  void nextReplacementPage(Widget page, {bool maintainState = true}) =>
      _nextReplacementPage(
          context: this, page: page, maintainState: maintainState);

  void nextAndRemoveUntilPage(Widget page) =>
      _nextAndRemoveUntilPage(context: this, page: page);

  /// Action Extension
  bool invokeAction(Intent intent, {bool nullOk}) =>
      Actions.invoke(this, intent, nullOk: nullOk);

  /// Returns The state from the closest instance of this class that encloses the given context.
  /// It is used for validating forms
  FormState get form => Form.of(this);

  ///
  /// Returns The current [Locale] of the app as specified in the [Localizations] widget.
  ///
  Locale get locale => Localizations.localeOf(this);

  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for showing widgets on top of everything.
  ///
  OverlayState get overlay => Overlay.of(this);

  ///
  /// Insert the given widget into the overlay.
  /// The newly inserted widget will always be at the top.
  ///
  OverlayEntry addOverlay(WidgetBuilder builder) {
    final entry = OverlayEntry(builder: builder);
    overlay.insert(entry);
    return entry;
  }

  ///
  /// Returns the closest instance of [ScaffoldState] in the widget tree,
  /// which can be use to get information about that scaffold.
  ///
  /// If there is no [Scaffold] in scope, then this will throw an exception.
  ///
  ScaffoldState get scaffold => Scaffold.of(this);

  ///
  /// Shows a [SnackBar] at the bottom of the scaffold.
  ///
  /// If you call this function too quickly, the new snackbar is added to a
  /// queue and displayed when the current one disappears.
  ///
  void showSnackBar(SnackBar snackbar) => scaffold.showSnackBar(snackbar);
}

Future<void> _nextPage(
        {@required BuildContext context,
        @required Widget page,
        bool maintainState = true}) async =>
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          maintainState: maintainState,
        ));
Future<void> _nextReplacementPage(
        {@required BuildContext context,
        @required Widget page,
        bool maintainState = true}) async =>
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          maintainState: maintainState,
        ));
Future<void> _nextAndRemoveUntilPage(
        {@required BuildContext context, @required Widget page}) async =>
    await Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
