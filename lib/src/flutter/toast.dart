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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

/// Toast position
enum VxToastPosition {
  top,
  center,
  bottom,
}

enum VxToastType {
  text,
  loading,
}

mixin VxToast {
  static void show(
    BuildContext context, {
    required String msg,

    /// show duration in ms
    int showTime = 2000,
    Color? bgColor,
    Color? textColor,
    double textSize = 14,
    VxToastPosition position = VxToastPosition.bottom,
    double pdHorizontal = 20,
    double pdVertical = 10,
  }) {
    _showToast(
      context,
      msg: msg,
      showTime: showTime,
      bgColor: bgColor,
      textColor: textColor,
      textSize: textSize,
      position: position,
      pdHorizontal: pdHorizontal,
      pdVertical: pdVertical,
      type: VxToastType.text,
    );
  }

  static Function showLoading(
    BuildContext context, {
    String? msg,
    Color? bgColor,
    Color? textColor,
    double pdHorizontal = 20,
    double pdVertical = 10,
    double textSize = 14,
  }) {
    return _showToast(
      context,
      msg: msg,
      bgColor: bgColor,
      textColor: textColor,
      textSize: textSize,
      pdHorizontal: pdHorizontal,
      pdVertical: pdVertical,
      type: VxToastType.loading,
    );
  }
}

Function _showToast(
  BuildContext context, {
  String? msg,
  int showTime = 1000,
  Color? bgColor,
  Color? textColor,
  double? textSize,
  VxToastPosition position = VxToastPosition.center,
  double? pdHorizontal,
  double? pdVertical,
  VxToastType type = VxToastType.text,
}) {
  /// Overlay state for showing toast as overlay
  final OverlayState overlayState = Overlay.of(context);

  final GlobalKey<_VxToastViewState> key = GlobalKey();

  final OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _VxToastView(
            msg,
            key: key,
            bgColor: bgColor,
            textColor: textColor,
            textSize: textSize,
            toastPosition: position,
            pdHorizontal: pdHorizontal,
            pdVertical: pdVertical,
            type: type,
          ));

  /// Inserting the overlay entry to the state
  overlayState.insert(overlayEntry);

  if (type == VxToastType.text) {
    Future.delayed(Duration(milliseconds: showTime), () {
      key.currentState?._hide();
      overlayEntry.remove();
    });
  }

  return () {
    key.currentState?._hide();
    overlayEntry.remove();
  };
}

class _VxToastView extends StatefulWidget {
  /// Message to show for the toast
  final String? msg;

  /// Background color of the toast
  final Color? bgColor;

  /// Text color of the toast
  final Color? textColor;

  /// Font size of the text
  final double? textSize;

  /// Position of the toast. It can be [VxToastPosition.top] or [VxToastPosition.center] or [VxToastPosition.bottom]
  final VxToastPosition? toastPosition;

  /// Horizontal Padding
  final double? pdHorizontal;

  /// Vertical padding
  final double? pdVertical;

  /// Toast type. It can be [VxToastType.text] or [VxToastType.loading]
  final VxToastType? type;

  const _VxToastView(
    this.msg, {
    super.key,
    this.bgColor,
    this.textColor,
    this.textSize,
    this.toastPosition,
    this.pdHorizontal,
    this.pdVertical,
    this.type,
  });

  @override
  _VxToastViewState createState() => _VxToastViewState();
}

class _VxToastViewState extends State<_VxToastView>
    with SingleTickerProviderStateMixin {
  static const Duration _fadeInDuration = Duration(milliseconds: 150);
  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _fadeInDuration,
      reverseDuration: _fadeOutDuration,
      vsync: this,
    );
    _show();
  }

  @override
  Widget build(BuildContext context) {
    final Widget toastView = FadeTransition(
      opacity: _controller!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: MediaQuery.sizeOf(context).width,
        alignment: Alignment.center,
        child: _buildToastWidget(),
      ),
    );
    if (widget.toastPosition == VxToastPosition.center ||
        widget.type == VxToastType.loading) {
      return toastView;
    }
    return Positioned(
      top: buildToastPosition(context),
      child: toastView,
    );
  }

  /// Building the toast widget
  Widget _buildToastWidget() {
    if (widget.type == VxToastType.text) {
      return Center(
        child: Card(
          color: widget.bgColor ?? Theme.of(context).cardColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.pdHorizontal!,
              vertical: widget.pdVertical!,
            ),
            child: Text(
              widget.msg!,
              style: TextStyle(
                fontSize: widget.textSize,
                color: widget.textColor ?? context.textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ),
      );
    } else if (widget.type == VxToastType.loading) {
      return Center(
        child: Card(
          color: widget.bgColor ?? context.textTheme.titleLarge!.color,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.pdHorizontal!,
              vertical: widget.pdVertical!,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.background,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.msg!,
                  style: TextStyle(
                    fontSize: widget.textSize,
                    color:
                        widget.textColor ?? context.textTheme.bodyLarge!.color,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return const Offstage();
  }

  /// Set the toast position
  dynamic buildToastPosition(context) {
    dynamic backResult;
    if (widget.toastPosition == VxToastPosition.top) {
      backResult = MediaQuery.sizeOf(context).height * 1 / 6;
    } else if (widget.toastPosition == VxToastPosition.center) {
      backResult = MediaQuery.sizeOf(context).height * 1 / 2;
    } else {
      backResult = MediaQuery.sizeOf(context).height * 0.9;
    }
    return backResult;
  }

  /// Show the toast
  void _show() {
    _controller?.forward();
  }

  /// Hide the toast
  void _hide() {
    _controller?.reverse();
  }

  @override
  void dispose() {
    _hide();
    _controller!.dispose();
    super.dispose();
  }
}

extension VxToastExtension on BuildContext {
  ///
  /// Extension method to directly access [VxToast] with context.
  ///
  ///Show toast
  void showToast({
    required String msg,

    /// show duration in ms
    int showTime = 2000,
    Color? bgColor,
    Color? textColor,
    double textSize = 14,
    VxToastPosition position = VxToastPosition.bottom,
    double pdHorizontal = 20,
    double pdVertical = 10,
  }) =>
      VxToast.show(this,
          msg: msg,
          bgColor: bgColor,
          pdHorizontal: pdHorizontal,
          pdVertical: pdVertical,
          position: position,
          showTime: showTime,
          textColor: textColor,
          textSize: textSize);

  /// Show loading dialog
  Function showLoading({
    required String msg,
    Color? bgColor,
    Color? textColor,
    double textSize = 14,
    double pdHorizontal = 20,
    double pdVertical = 10,
  }) =>
      VxToast.showLoading(this,
          msg: msg,
          bgColor: bgColor,
          pdHorizontal: pdHorizontal,
          pdVertical: pdVertical,
          textColor: textColor,
          textSize: textSize);
}
