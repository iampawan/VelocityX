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

const int _kDefaultMS = 1000;

enum VxSkeletonAnimationType {
  shimmer,
  stretch,
}

/// To show skeleton with any widget.
class VxSkeleton extends StatefulWidget {
  final BoxShape? shape;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? shimmerColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Duration? duration;
  final Gradient? gradient;
  final bool active;

  /// [stretchWidth] required for using stretch
  final VxSkeletonAnimationType type;

  /// Required for stretch
  final double? stretchWidth;

  const VxSkeleton(
      {super.key,
      this.shape,
      this.padding,
      this.color,
      this.shimmerColor,
      this.gradient,
      this.width,
      this.height,
      this.margin,
      this.borderRadius,
      this.duration,
      this.active = true,
      this.type = VxSkeletonAnimationType.shimmer,
      this.stretchWidth});

  @override
  VxSkeletonState createState() => VxSkeletonState();
}

class VxSkeletonState extends State<VxSkeleton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final Duration duration =
        widget.duration ?? const Duration(milliseconds: _kDefaultMS);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _setupAnimationAndStart();
  }

  @override
  void didUpdateWidget(VxSkeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setupAnimationAndStart();
  }

  void _setupAnimationAndStart() {
    _animation = _genTween().animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _controller,
      ),
    );

    if (widget.type == VxSkeletonAnimationType.shimmer) {
      _animation.addStatusListener(_handleShimmerAnimationStatus);
    } else {
      _animation.addStatusListener(_handleStretchAnimationStatus);
    }

    _controllerForward();
  }

  Tween<double> _genTween() {
    return (widget.type == VxSkeletonAnimationType.shimmer)
        ? Tween<double>(begin: -1.0, end: 2.0)
        : Tween<double>(
            begin: widget.width,
            end: widget.stretchWidth,
          );
  }

  void _handleShimmerAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      _controllerRepeat();
    }
  }

  void _handleStretchAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controllerReverse();
    } else if (status == AnimationStatus.dismissed) {
      _controllerForward();
    }
  }

  void _controllerReverse() {
    if (widget.active) {
      _controller.reverse();
    }
  }

  void _controllerRepeat() {
    if (widget.active) {
      _controller.repeat();
    }
  }

  void _controllerForward() {
    if (widget.active) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final BoxShape shape = widget.shape ?? BoxShape.rectangle;
          final Color color = widget.color ?? const Color(0xFFE8E8E8);
          final Color shimmerColor =
              widget.shimmerColor ?? const Color(0xFFEDEDED);
          final Gradient? gradient = widget.gradient ??
              (widget.type == VxSkeletonAnimationType.shimmer
                  ? LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                          color,
                          shimmerColor.withAlpha(200),
                          color
                        ],
                      stops: [
                          _animation.value - 0.4,
                          _animation.value,
                          _animation.value + 0.4
                        ])
                  : null);

          final double? width = widget.type == VxSkeletonAnimationType.shimmer
              ? widget.width
              : _animation.value;
          final decColor =
              widget.type == VxSkeletonAnimationType.stretch ? color : null;

          return Container(
            decoration: BoxDecoration(
              shape: shape,
              borderRadius: widget.borderRadius,
              color: decColor,
              gradient: gradient,
            ),
            padding: widget.padding,
            width: width,
            height: widget.height,
            margin: widget.margin,
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

extension VxSkeletonExtension on Widget {
  ///
  /// Extension method to directly access [VxSkeleton] with any widget without wrapping or with dot operator.
  ///
  /// show skeleton extension
  Widget skeleton(
          {Key? key,
          BoxShape? shape,
          EdgeInsetsGeometry? padding,
          Color? color,
          Color? shimmerColor,
          Gradient? gradient,
          double? width,
          double? height,
          EdgeInsetsGeometry? margin,
          BorderRadiusGeometry? borderRadius,
          Duration? duration,
          bool active = true,
          VxSkeletonAnimationType type = VxSkeletonAnimationType.shimmer,
          double? stretchWidth}) =>
      VxSkeleton(
        key: key,
        active: active,
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
        duration: duration,
        height: height,
        margin: margin,
        padding: padding,
        shape: shape,
        shimmerColor: shimmerColor,
        stretchWidth: stretchWidth,
        type: type,
        width: width,
      );
}
