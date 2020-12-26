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

// mixin VxAnimatorMixing<T> {
//   T _child;

//   @protected
//   // AnimatorCallBack builder;

//   @protected
//   void setChildForAnimator(T child) {
//     _child = child;
//   }

//   T animate(AnimatorCallBack val) {
//     builder = val;
//     return _child;
//   }

//   T get alignTopCenter => _addAlignment(alignment: Alignment.topCenter);

//   T get alignTopLeft => _addAlignment(alignment: Alignment.topLeft);

//   T _addAlignment({@required Alignment alignment}) {
//     // velocityAlignment = alignment;
//     return _child;
//   }
// }

// Widget animate<T>({
//   @required AnimatorCallBack<T> builder,
//   Key key,
//   AnimatorKey animatorKey,
//   Widget child,
//   Curve curve,
//   Tween<T> tween,
//   Duration duration,
//   int cycles,
//   int repeats,
//   bool resetAnimationOnRebuild,
//   bool triggerOnInit,
//   Function(AnimatorState<T>) customListener,
//   Function(AnimatorState<T>) endAnimationListener,
//   Function(AnimationStatus, AnimatorState<T>) statusListener,
//   TickerMixin tickerMixin,
//   Map<String, Tween<dynamic>> tweenMap,
// }) {
//   return Animator<T>(
//     key: key,
//     animatorKey: animatorKey,
//     builder: (context, state, child) => builder(context, state, child),
//     child: child,
//     tween: tween,
//     triggerOnInit: triggerOnInit,
//     repeats: repeats,
//     customListener: customListener,
//     curve: curve ?? Curves.linear,
//     cycles: cycles,
//     duration: const Duration(milliseconds: 500),
//     resetAnimationOnRebuild: resetAnimationOnRebuild ?? false,
//     endAnimationListener: endAnimationListener,
//     statusListener: statusListener,
//     tickerMixin: tickerMixin,
//     tweenMap: tweenMap,
//   );
// }
