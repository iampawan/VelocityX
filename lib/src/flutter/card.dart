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
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/render_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';
import 'velocityx_mixins/padding_mixin.dart';
import 'velocityx_mixins/round_mixin.dart';

/// A material design card: a panel with slightly rounded corners and an
/// elevation shadow.
///
/// A card is a sheet of [Material] used to represent some related information,
/// for example an album, a geographical location, a meal, contact details, etc.
///
/// This is what it looks like when run:
///
/// ![A card with a slight shadow, consisting of two rows, one with an icon and
/// some text describing a musical, and the other with buttons for buying
/// tickets or listening to the show.](https://flutter.github.io/assets-for-api-docs/assets/material/card.png)
///
class VxCard extends VxWidgetBuilder<Widget>
    with
        VxColorMixin<VxCard>,
        VxPaddingMixin<VxCard>,
        VxRoundMixin<VxCard>,
        VxRenderMixin<VxCard> {
  /// Creates a material design card.
  ///
  VxCard(
    this._child,
  ) {
    setChildToColor(this);
    setChildToPad(this);
    setChildToRound(this);
    setChildForRender(this);
  }
  final Widget _child;

  Color? _shadowColor;
  double _elevation = 1.0;
  ShapeBorder? _shape;
  Clip? _clip;
  bool? _borderOnForeground;

  /// The card's background color.
  ///
  /// Defines the card's [Material.color].
  ///
  /// If this property is null then [CardTheme.color] of [ThemeData.cardTheme]
  /// is used. If that's null then [ThemeData.cardColor] is used.
  VxCard color(Color val) => this..velocityColor = val;

  /// The color to paint the shadow below the card.
  ///
  /// If null then the ambient [CardTheme]'s shadowColor is used.
  /// If that's null too, then the overall theme's [ThemeData.shadowColor]
  /// (default black) is used.
  VxCard shadowColor(Color val) => this.._shadowColor = val;

  /// The card's background color by hex value.
  ///
  /// Defines the card's [Material.color].
  ///
  /// If this property is null then [CardTheme.color] of [ThemeData.cardTheme]
  /// is used. If that's null then [ThemeData.cardColor] is used.
  VxCard hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  ///
  /// Defines the card's [Material.elevation].
  ///
  /// If this property is null then [CardTheme.elevation] of
  /// [ThemeData.cardTheme] is used. If that's null, the default value is 1.0.
  VxCard elevation(double val) => this.._elevation = val;

  /// {@macro flutter.widgets.Clip}
  ///
  /// If this property is null then [CardTheme.clipBehavior] of
  /// [ThemeData.cardTheme] is used. If that's null then the behavior will be [Clip.none].
  VxCard clip(Clip clip) => this.._clip = clip;

  ///
  /// If the card is a circular border card.
  ///
  VxCard get circular => this.._shape = const CircleBorder();

  ///
  /// If the card is a circular border card with zero elevation.
  ///
  VxCard get zeroCircular => this
    .._shape = const CircleBorder()
    .._elevation = 0.0;

  ///
  /// If the card having zero elevation.
  ///
  VxCard get zero => this.._elevation = 0.0;

  /// The shape of the card's [Material].
  ///
  /// Defines the card's [Material.shape].
  ///
  /// If this property is null then [CardTheme.shape] of [ThemeData.cardTheme]
  /// is used. If that's null then the shape will be a [RoundedRectangleBorder]
  /// with a circular corner radius of 4.0.
  VxCard shape(ShapeBorder shape) => this.._shape = shape;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// Use this to make it false, the border will be painted behind the [child].
  VxCard get disableBorderOnForeground => this.._borderOnForeground = false;

  @override
  Widget make({Key? key}) {
    if (!willRender) return const VxNone();
    return Card(
      key: key,
      margin: velocityPadding,
      color: velocityColor,
      clipBehavior: _clip ?? Clip.antiAlias,
      borderOnForeground: _borderOnForeground ?? true,
      elevation: _elevation,
      shape: (roundedValue != null)
          ? RoundedRectangleBorder(
              borderRadius:
                  radiusGeometry ?? BorderRadius.circular(roundedValue!))
          : _shape,
      shadowColor: _shadowColor,
      child: _child,
    );
  }
}

extension VxCardExtension on Widget {
  ///
  /// Extension method to directly access [VxCard] with any widget without wrapping or with dot operator.
  ///
  VxCard get card => VxCard(this);
}

/*

The VxFlip widget is a stateful widget that represents a flip card. It has several properties:

initialFront: Determines whether the card initially shows the front or back side.
front: Widget to be displayed on the front side of the card.
back: Widget to be displayed on the back side of the card.
duration: Duration of the flip animation.
direction: Direction of the flip animation (horizontal or vertical).
touchFlip: Enables or disables flipping the card on touch.
fill: Specifies the filling behavior of the card (none, front, back).
onFlip: Callback function that is called when the flip animation starts.
onFlipDone: Callback function that is called when the flip animation completes.
onVxFlipState: Callback function that is called to get the VxFlipState object representing the state of the VxFlip.
The VxFlip widget is built using the VxFlipState class, which extends State and implements SingleTickerProviderStateMixin. It manages the animation and state of the flip card.

The VxFlipState class provides methods to control the flip animation and interact with the card:

animateToggle(): Flips the card with an animation. It calls the onFlip callback and updates the state of the card when the animation completes.
toggle(): Flips the card without playing an animation. It immediately updates the state of the card.
skew(double amount, {Duration? duration, Curve? curve}): Skews the card by the specified amount percentage. This can be used to indicate that the card can be flipped.
hint({Duration duration = const Duration(milliseconds: 150), Duration? total}): Triggers a flip animation that reverses after the specified duration. It can be used to provide a hint or visual feedback to the user.
The VxFlip widget builds the card using the _buildContent method, which creates a stack with the front and back sides of the card. The animation for flipping the card is handled by the _animationCard method, which applies a rotation transformation to the card based on the animation values.

The VxFlip widget also provides touch interaction support for flipping the card when touchFlip is set to true. It wraps the card with a GestureDetector that triggers the animateToggle method when the card is tapped.

Overall, the VxFlip widget allows you to create a visually appealing flip card UI element in your Flutter application, which can be used for various purposes such as displaying information on both sides of the card or creating interactive interfaces.

*/

enum VxFill { none, front, back }

typedef VxFlipOnFlipCallback = void Function(bool isFront);
typedef VxFlipCallback = void Function(VxFlipState vxFlip);

class VxFlip extends StatefulWidget {
  const VxFlip({
    super.key,
    required this.front,
    required this.back,
    this.duration = const Duration(milliseconds: 300),
    this.onFlip,
    this.onFlipDone,
    this.direction = Axis.horizontal,
    this.onVxFlipState,
    this.touchFlip = true,
    this.initialFront = true,
    this.alignment = Alignment.center,
    this.fill = VxFill.front,
  });

  /// Initial side of the card (front or back)
  final bool initialFront;

  /// Widget to be displayed on the front side of the card
  final Widget front;

  /// Widget to be displayed on the back side of the card
  final Widget back;

  /// Duration of the flip animation
  final Duration duration;

  /// Direction of the flip animation (horizontal or vertical)
  final Axis direction;

  /// Enables or disables flip on touch
  final bool touchFlip;

  /// Filling behavior of the card (none, front, back)
  final VxFill fill;

  /// Callback function called when the flip animation starts
  final VoidCallback? onFlip;

  /// Callback function called when the flip animation completes
  final VxFlipOnFlipCallback? onFlipDone;

  /// Callback function called to get the VxFlipState
  final VxFlipCallback? onVxFlipState;

  /// Alignment of the card
  final Alignment? alignment;

  @override
  State<StatefulWidget> createState() => VxFlipState();
}

class VxFlipState extends State<VxFlip> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;

  late bool isFront;

  @override
  void initState() {
    isFront = widget.initialFront;
    super.initState();
    widget.onVxFlipState?.call(this);
    _initController();
  }

  void _initController() {
    controller = AnimationController(
        value: isFront ? 0.0 : 1.0, duration: widget.duration, vsync: this);
    _frontRotation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50.0),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2), weight: 50.0)
    ]).animate(controller);
    _backRotation = TweenSequence([
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2), weight: 50.0),
      TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50.0)
    ]).animate(controller);
  }

  @override
  void didUpdateWidget(VxFlip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      controller.duration = widget.duration;
    }
    isFront = widget.initialFront;
    widget.onVxFlipState?.call(this);
  }

  /// Flip the card
  /// If awaited, returns after animation completes.
  void animateToggle() {
    if (!mounted) return;
    widget.onFlip?.call();
    controller.duration = widget.duration;
    final animation = isFront ? controller.forward() : controller.reverse();
    animation.whenComplete(() {
      setState(() => isFront = !isFront);
      widget.onFlipDone?.call(isFront);
    });
  }

  /// Flip the card without playing an animation.
  /// This cancels any ongoing animation.
  void toggle() {
    controller.stop();
    widget.onFlip?.call();
    isFront = !isFront;
    controller.value = isFront ? 0.0 : 1.0;
    setState(() {});
    widget.onFlipDone?.call(isFront);
  }

  @override
  Widget build(BuildContext context) {
    final child = Stack(
        alignment: widget.alignment!,
        fit: StackFit.passthrough,
        children: [
          _buildContent(true, widget.fill == VxFill.front),
          _buildContent(false, widget.fill == VxFill.back),
        ]);
    if (widget.touchFlip) {
      return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: animateToggle,
          child: child);
    }
    return child;
  }

  Widget _buildContent(bool front, bool isFill) {
    final card = IgnorePointer(
        ignoring: front ? !isFront : isFront,
        child: _animationCard(front ? widget.front : widget.back,
            front ? _frontRotation : _backRotation));
    if (isFill) return Positioned.fill(child: card);
    return card;
  }

  Widget _animationCard(Widget child, Animation<double> animation) =>
      AnimatedBuilder(
          animation: animation,
          builder: (_, Widget? child) {
            var transform = Matrix4.identity();
            transform.setEntry(3, 2, 0.001);
            if (widget.direction == Axis.vertical) {
              transform.rotateX(animation.value);
            } else {
              transform.rotateY(animation.value);
            }
            return Transform(
                transform: transform,
                filterQuality: FilterQuality.none,
                alignment: FractionalOffset.center,
                child: child);
          },
          child: child);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Skew by amount percentage (0 - 1.0)
  /// This can be used with a MouseRegion to indicate that the card can
  /// be flipped. skew(0) to go back to original.
  /// If awaited, returns after animation completes.
  Future<void> skew(double amount, {Duration? duration, Curve? curve}) async {
    assert(0 <= amount && amount <= 1);
    final target = isFront ? amount : 1 - amount;
    await controller
        .animateTo(target, duration: duration, curve: curve ?? Curves.linear)
        .asStream()
        .first;
  }

  /// Triggers a flip animation that reverses after the duration
  /// and will run for `total`
  /// If awaited, returns after animation completes.
  Future<void> hint(
      {Duration duration = const Duration(milliseconds: 150),
      Duration? total}) async {
    if (controller.isAnimating || controller.value != 0) return;
    final durationTotal = total ?? controller.duration;
    final completer = Completer();
    Duration? original = controller.duration;
    controller.duration = durationTotal;
    await controller.forward();
    Timer(duration, () {
      controller.reverse().whenComplete(() {
        completer.complete();
      });
      controller.duration = original;
    });
    await completer.future;
  }
}
