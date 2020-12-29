// /*
//  * Copyright 2020 Pawan Kumar. All rights reserved.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  * http://www.apache.org/licenses/LICENSE-2.0
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
// import 'package:animator/animator.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/src/flutter/velocityx_mixins/curves_mixin.dart';
// import 'package:velocity_x/src/flutter/velocityx_mixins/duration_mixin.dart';
//
// import '../builder.dart';
//
// typedef AnimatorCallBack<T> = Function(
//     BuildContext context, AnimatorState<T> animState, Widget child);
//
// class VxAnimator<T> extends VxWidgetBuilder<Widget>
//     with VxCurvesMixin<VxAnimator>, VxDurationMixin<VxAnimator> {
//   VxAnimator({
//     required this.builder,
//     this.animatorKey,
//     this.child,
//     this.key,
//     this.tween,
//     this.tweenMap,
//     this.cycles,
//     this.repeats,
//     this.resetAnimationOnRebuild = false,
//     this.triggerOnInit,
//     this.customListener,
//     this.endAnimationListener,
//     this.statusListener,
//     this.tickerMixin,
//     this.curve,
//     this.duration,
//   }) {
//     setChildForCurve(this);
//     setChildForDuration(this);
//   }
//
//   final Key? key;
//
//   ///A linear interpolation between a beginning and ending value.
//   ///
//   ///`tween` argument is used for one Tween animation.
//   final Tween<T>? tween;
//
//   ///The number of forward and backward periods the animation
//   ///performs before stopping
//   final int? cycles;
//
//   ///The number of forward periods the animation performs before stopping
//   final int? repeats;
//
//   ///Whether the animation settings are reset when Animator widget
//   ///is rebuilt. The default value is false.
//   ///
//   ///Animation settings are defined by the tween, duration and curve argument.
//   final bool? resetAnimationOnRebuild;
//
//   ///Whether to start the animation when the Animator widget
//   ///is inserted into the tree.
//   final bool? triggerOnInit;
//
//   ///Function to be called every time the animation value changes.
//   ///
//   ///The customListener is provided with an [Animation] object.
//   final Function(AnimatorState<T>)? customListener;
//
//   ///VoidCallback to be called when animation is finished.
//   final Function(AnimatorState<T>)? endAnimationListener;
//
//   ///Function to be called every time the status of the animation changes.
//   ///
//   ///The customListener is provided with an [AnimationStatus, AnimationSetup]
//   ///object.
//   final Function(AnimationStatus, AnimatorState<T>)? statusListener;
//
//   ///The build strategy currently used for one Tween. Animator widget rebuilds
//   ///itself every time the animation changes value.
//   ///
//   ///The builder is provided with an [Animation] object.
//   final Widget Function(
//     BuildContext context,
//     AnimatorState<T> animatorState,
//     Widget child,
//   ) builder;
//
//   ///Widget that you do not want to animate.
//   ///It is the static part of the animated Widget.
//   final Widget? child;
//
//   ///A linear interpolation between a beginning and ending value.
//   ///
//   ///`tweenMap` argument is used for multi-Tween animation.
//   final Map<String, Tween<dynamic>>? tweenMap;
//
//   ///The name of your Animator widget.
//   ///Many widgets can have the same name.
//   ///
//   ///It is used to rebuild this widget from your logic classes
//   // final dynamic name;
//
//   /// The list of your logic classes you want to rebuild this widget from.
//   // final List<StatesRebuilder> blocs;
//
//   final AnimatorKey? animatorKey;
//
//   ///For performance reason the default tickerProvider is of type
//   ///`singleTickerProviderStateMixin`.
//   ///
//   ///use `tickerProviderStateMixin` if many controllers use the same ticker.
//   final TickerMixin? tickerMixin;
//
//   ///A span of time, such as 27 days, 4 hours, 12 minutes, and 3 seconds
//   final Duration? duration;
//
//   ///An easing curve, i.e. a mapping of the unit interval to the unit interval.
//   final Curve? curve;
//
//   Tween<int>? _intTween;
//   Tween<double>? _doubleTween;
//   ColorTween? _colorTween;
//
//   int? _infiniteCycles;
//
//   VxAnimator<T> intTween(int begin, int end) {
//     _intTween = IntTween(begin: begin, end: end);
//     return this;
//   }
//
//   VxAnimator<T> doubleTween(double begin, double end) {
//     _doubleTween = Tween(begin: begin, end: end);
//     return this;
//   }
//
//   VxAnimator<T> colorTween(Color begin, Color end) {
//     _colorTween = ColorTween(begin: begin, end: end);
//     return this;
//   }
//
//   VxAnimator<T> get infinite {
//     _infiniteCycles = 0;
//     return this;
//   }
//
//   @override
//   Widget make({Key? key}) {
//     return Animator<T>(
//       key: key,
//       animatorKey: animatorKey,
//       builder: builder,
//       child: child,
//       tween: _doubleTween as Tween<T>? ??
//           _intTween as Tween<T>? ??
//           _colorTween as Tween<T>? ??
//           tween as Tween<T>,
//       triggerOnInit: triggerOnInit,
//       repeats: repeats,
//       customListener: customListener,
//       curve: velocityCurve ?? curve ?? Curves.linear,
//       cycles: _infiniteCycles ?? cycles,
//       duration:
//           velocityDuration ?? duration ?? const Duration(milliseconds: 500),
//       resetAnimationOnRebuild: resetAnimationOnRebuild ?? false,
//       endAnimationListener: endAnimationListener,
//       statusListener: statusListener,
//       tickerMixin: tickerMixin,
//       tweenMap: tweenMap,
//     );
//   }
// }
