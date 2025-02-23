/*
The VxUniversal widget is a versatile widget in Flutter that can be used for 
various purposes. It allows you to combine multiple Flutter widgets and 
apply different properties and behaviors to them using a single widget. 
The VxUniversal widget supports a wide range of properties and options, 
making it highly customizable.

Here is a breakdown of the properties and their functionalities:

Common Properties:

key: A unique identifier for the widget.
visible: Controls the visibility of the widget.
constraints: Specifies the constraints for the widget's size.
borderRadius: Specifies the border radius for clipping the widget.
color: Sets the background color of the widget.
alignment: Aligns the child widget within its parent.
child: The main child widget of the VxUniversal.
padding: Adds padding around the child widget.
margin: Adds margin around the widget.
decoration: Adds decoration to the widget.
width: Specifies the width of the widget.
height: Specifies the height of the widget.
onTap: Callback function triggered when the widget is tapped.
onDoubleTap: Callback function triggered when the widget is double-tapped.
onLongPress: Callback function triggered when the widget is long-pressed.

Layout Properties:

isWrap: Wraps the child widgets in a Wrap widget.
wrapAlignment: Specifies the alignment of wrapped child widgets in a Wrap.
wrapSpacing: Specifies the spacing between wrapped child widgets in a Wrap.
runAlignment: Specifies the alignment of the run of wrapped child widgets in a Wrap.
runSpacing: Specifies the spacing between runs of wrapped child widgets in a Wrap.
wrapCrossAlignment: Specifies the cross-axis alignment of wrapped child widgets in a Wrap.
flex: Specifies the flex value for the widget within a Flex widget.
expanded: Adds an Expanded widget around the child.
mainAxisAlignment: Aligns the child widgets horizontally within a Flex.
crossAxisAlignment: Aligns the child widgets vertically within a Flex.
direction: Specifies the direction of the child widgets within a Flex.
textBaseline: Specifies the text baseline within a Flex.
verticalDirection: Specifies the vertical direction of the child widgets within a Flex.
textDirection: Specifies the text direction within a Flex.
mainAxisSize: Specifies the main axis size within a Flex.

Clip Properties:

clipBehavior: Controls the clipping behavior of the child widget.
isOval: Clips the child widget in an oval shape using ClipOval.
isClipRRect: Clips the child widget with rounded corners using ClipRRect.
isClipRect: Clips the child widget with a rectangular shape using ClipRect.
clipper: Provides a custom clipper for clipping the child widget.
Scrollable Properties:
useSingleChildScrollView: Wraps the child widget with a SingleChildScrollView.
noScrollBehavior: Removes the default scroll shadows of SingleChildScrollView.
physics: Specifies the physics for the scrolling behavior.
scrollController: Specifies a custom scroll controller.
scrollDirection: Specifies the direction of scrolling.
reverse: Reverses the scrolling direction.

Other Properties:

addCard: Wraps the child widget in a Card widget.
elevation: Specifies the elevation of the Card widget.
shadowColor: Specifies the shadow color of the Card widget.
shape: Specifies the shape of the Card widget.
and more....
*/

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [VxUniversal] is an universal super widget which can be used
/// to do almost everything.
class VxUniversal extends StatelessWidget {
  const VxUniversal({
    super.key,
    this.addCard = false,
    this.addInkWell = false,
    this.useSingleChildScrollView = true,
    this.isStack = false,
    this.isWrap = false,
    this.expanded = false,
    this.expand = false,
    this.shrink = false,
    this.intrinsicHeight = false,
    this.intrinsicWidth = false,
    this.isOval = false,
    this.isClipRRect = false,
    this.isClipRect = false,
    this.visible = true,
    this.offstage = false,
    this.enabled = false,
    this.reverse = false,
    this.autoFocus = false,
    this.maintainState = false,
    this.transitionOnUserGestures = false,
    this.isCircleAvatar = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
    this.maintainSemantics = false,
    this.maintainInteractivity = false,
    this.excludeFromSemantics = false,
    this.enableFeedback = true,
    this.canRequestFocus = true,
    this.noScrollBehavior = true,
    this.sized = true,
    this.gaussian = false,
    this.safeLeft = false,
    this.safeTop = false,
    this.safeRight = false,
    this.safeBottom = false,
    this.fuzzyDegree = 4,
    this.wrapSpacing = 0.0,
    this.runSpacing = 0.0,
    this.dragStartBehavior = DragStartBehavior.start,
    this.shadowColor = Colors.transparent,
    this.replacement = const SizedBox.shrink(),
    this.stackFit = StackFit.loose,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.wrapAlignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.wrapCrossAlignment = WrapCrossAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.direction = Axis.vertical,
    this.scrollDirection,
    this.behavior = HitTestBehavior.opaque,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.alignment,
    this.child,
    this.children,
    this.padding,
    this.physics,
    this.scrollController,
    this.primary,
    this.foregroundDecoration,
    this.transform,
    this.origin,
    this.constraints,
    this.width,
    this.height,
    this.margin,
    this.decoration,
    this.textBaseline,
    this.textDirection,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.shape,
    this.onHighlightChanged,
    this.onHover,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.splashFactory,
    this.radius,
    this.customBorder,
    this.focusNode,
    this.onFocusChange,
    this.heroTag,
    this.createRectTween,
    this.flightShuttleBuilder,
    this.placeholderBuilder,
    this.backgroundImage,
    this.onBackgroundImageError,
    this.foregroundColor,
    this.minRadius,
    this.maxRadius,
    this.clipper,
    this.size,
    this.onSecondaryTap,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressUp,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressEnd,
    this.onSecondaryLongPressStart,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.flex,
    this.elevation,
    this.opacity,
    this.clipBehavior,
    this.widthFactor,
    this.heightFactor,
    this.filter,
    this.builder,
    this.fit,
    this.systemOverlayStyle,
  }) : assert(!(addCard && addInkWell), 'One of them must be true');

  /// ****** [AnnotatedRegion]  ****** ///
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool sized;

  /// [GestureDetector]、[SingleChildScrollView]
  final DragStartBehavior dragStartBehavior;

  /// ****** [IntrinsicHeight]、[IntrinsicWidth] ****** ///
  final bool intrinsicHeight;
  final bool intrinsicWidth;

  /// Control the clipping method
  /// [Clip.none] No clip is the fastest
  /// [Clip.hardEdge] is not antialiasing fast
  /// [Clip.antiAlias] Anti-aliasing is slow
  /// [Clip.antiAliasWithSaveLayer] Antialiasing and saveLayer are slow
  /// Components used [Stack] , [ClipRRect] , [ClipPath] , [ClipRect] , [ClipOval] , [Container] , [Material] , [Card] , [Stack] , [SingleChildScrollView]
  final Clip? clipBehavior;

  /// ****** [Align] ****** ///
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  /// [InkWell] splash radius
  /// [Material] Corner radius
  /// [ClipRRect] Clip radius
  final BorderRadius borderRadius;

  /// ****** [child]、[children]、[builder] ****** ///
  /// child < children < builder
  /// Only one of the three is valid
  final Widget? child;
  final List<Widget>? children;

  /// ****** [StatefulBuilder]、[Builder]、[LayoutBuilder] ****** ///
  /// builder types [LayoutWidgetBuilder]、[WidgetBuilder]、[StatefulWidgetBuilder]
  final dynamic builder;

  /// ****** [Wrap] ****** ///
  final bool isWrap;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment wrapCrossAlignment;

  /// ****** [Flexible] ****** ///
  final int? flex;

  /// [expanded] =true [flex] =1 is equivalent to adding the [Expanded] component
  final bool expanded;

  /// ****** [Transform] ****** ///
  final Matrix4? transform;
  final Offset? origin;

  /// ****** [ConstrainedBox] ****** ///
  final BoxConstraints? constraints;

  /// ****** [ColoredBox]||[DecoratedBox] ****** ///
  final Color? color;

  /// ****** [Padding] ****** ///
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  /// ****** [DecoratedBox] ****** ///
  final Decoration? decoration;
  final Decoration? foregroundDecoration;

  /// ****** [Positioned] ****** ///
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  /// ****** [FittedBox] ****** ///
  final BoxFit? fit;

  /// ****** [Card] ****** ///
  final bool addCard;
  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;

  /// ****** [Flex]=[Column]+[Row] ****** ///
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Axis direction;
  final TextBaseline? textBaseline;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final MainAxisSize mainAxisSize;

  /// ****** [ClipRRect]、[ClipPath]、[ClipRect]、[ClipOval] ****** ///
  /// [RRect]、[Path]、[Rect]
  final CustomClipper<dynamic>? clipper;
  final bool isOval;
  final bool isClipRRect;
  final bool isClipRect;

  /// ****** [CircleAvatar] ****** ///
  final bool isCircleAvatar;
  final ImageProvider? backgroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final Color? foregroundColor;
  final double? minRadius;
  final double? maxRadius;

  /// Whether to use [SingleChildScrollView] to create scrolling components
  /// Set to false when the page logic is complex to improve the sliding performance
  final bool useSingleChildScrollView;

  /// Remove the top and bottom blue shadows
  final bool noScrollBehavior;

  /// ****** [SingleChildScrollView] ****** ///
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final Axis? scrollDirection;
  final bool reverse;
  final bool? primary;

  /// ****** [SizedBox] ****** ///
  final bool expand;
  final bool shrink;
  final Size? size;
  final double? width;
  final double? height;

  /// ****** [Visibility] ****** ///
  final Widget replacement;
  final bool visible;
  final bool maintainState;
  final bool maintainAnimation;
  final bool maintainSize;
  final bool maintainSemantics;
  final bool maintainInteractivity;
  final bool offstage;

  /// ****** [Opacity] ****** ///
  final double? opacity;

  /// ****** Click event related ****** ///
  /// ****** [InkWell] ****** ///
  /// Highlight change callback
  /// Called when this part of the material is highlighted or stops being highlighted
  final ValueChanged<bool>? onHighlightChanged;

  /// Called when the pointer enters or exits the ink response area
  final ValueChanged<bool>? onHover;

  /// Get the focus color
  final Color? focusColor;

  /// Color when the pointer hovers
  final Color? hoverColor;

  /// The color of the click
  final Color? highlightColor;

  /// Water ripple color
  final Color? splashColor;

  /// Custom water ripples
  final InteractiveInkFeatureFactory? splashFactory;

  /// Water ripple radius
  final double? radius;

  /// A custom clip border that overrides borderRadius
  final ShapeBorder? customBorder;

  /// Whether the detected gesture should provide sound and/or haptic feedback, default true
  final bool? enableFeedback;

  /// focus management
  final FocusNode? focusNode;
  final bool canRequestFocus;

  /// Focus change callback
  final ValueChanged<bool>? onFocusChange;

  /// Get focus automatically
  final bool autoFocus;

  /// [addInkWell] Add [InkWell] to have water ripple effect
  final bool addInkWell;

  /// [enabled] defaults to false [addInkWell] defaults to false
  /// ( [enabled] =false || [addInkWell] =true ) [GestureDetector] properties are invalid except for [onTap]
  /// ( [enabled] =true && [addInkWell] =false ) [GestureDetector] properties are all valid
  final bool enabled;

  /// Triggered when the screen is briefly touched
  final GestureTapCallback? onTap;

  /// The user touches the screen twice in a short period of time
  final GestureTapCallback? onDoubleTap;

  /// Triggered when the user touches the screen for more than 500ms
  final GestureLongPressCallback? onLongPress;

  /// Called every time the user interacts with the screen
  final GestureTapDownCallback? onTapDown;

  /// Triggers cancel when you touch the screen briefly
  final GestureTapCancelCallback? onTapCancel;

  final bool excludeFromSemantics;

  /// ****** [GestureDetector] ****** ///
  /// Click to lift
  final GestureTapUpCallback? onTapUp;

  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCancelCallback? onSecondaryTapCancel;

  /// Trigger to start when the user touches the screen for more than 500ms
  final GestureLongPressStartCallback? onLongPressStart;

  /// Move the touch when the user touches the screen for more than 500ms
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  /// Triggered when the user touches the screen for more than 500ms
  final GestureLongPressUpCallback? onLongPressUp;

  /// Trigger to end when the user touches the screen for more than 500ms
  final GestureLongPressEndCallback? onLongPressEnd;

  /// Triggered when a touch point starts to interact with the screen while moving vertically
  final GestureDragDownCallback? onVerticalDragDown;

  /// Triggered when the touch point starts to move in the vertical direction
  final GestureDragStartCallback? onVerticalDragStart;

  /// This callback is triggered every time the touch point position on the screen changes
  final GestureDragUpdateCallback? onVerticalDragUpdate;

  /// When the user stops moving, the drag operation is considered complete and this callback is triggered
  final GestureDragEndCallback? onVerticalDragEnd;

  /// Triggered when the user suddenly stops dragging
  final GestureDragCancelCallback? onVerticalDragCancel;

  /// Triggered when a touch point starts to interact with the screen while moving in the horizontal direction
  final GestureDragDownCallback? onHorizontalDragDown;

  /// Triggered when the touch point starts to move in the horizontal direction
  final GestureDragStartCallback? onHorizontalDragStart;

  /// This callback is triggered every time the touch point position on the screen changes
  final GestureDragUpdateCallback? onHorizontalDragUpdate;

  /// Triggered when the horizontal drag ends
  final GestureDragEndCallback? onHorizontalDragEnd;

  /// Triggered when onHorizontalDragDown does not complete successfully
  final GestureDragCancelCallback? onHorizontalDragCancel;

  /// Triggered when the touch point starts interacting with the screen
  final GestureDragDownCallback? onPanDown;

  /// Triggered when the touch point starts to move
  final GestureDragStartCallback? onPanStart;

  /// This callback is triggered every time the touch point position on the screen changes
  final GestureDragUpdateCallback? onPanUpdate;

  /// Triggered when the pan operation completes
  final GestureDragEndCallback? onPanEnd;

  /// Triggered when the user touches the screen but does not complete the tap action
  final GestureDragCancelCallback? onPanCancel;

  /// Triggered when the touch point begins to interact with the screen, and a focus of 1.0 will be established at the same time.
  final GestureScaleStartCallback? onScaleStart;

  /// Triggered when interacting with the screen, and will mark a new focus
  final GestureScaleUpdateCallback? onScaleUpdate;

  /// The touch point no longer has any interaction with the screen, and also indicates that the scale gesture is completed
  final GestureScaleEndCallback? onScaleEnd;
  final GestureForcePressStartCallback? onForcePressStart;
  final GestureForcePressPeakCallback? onForcePressPeak;
  final GestureForcePressUpdateCallback? onForcePressUpdate;
  final GestureForcePressEndCallback? onForcePressEnd;
  final GestureTapCallback? onSecondaryTap;
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;
  final GestureLongPressCallback? onSecondaryLongPressUp;
  final GestureLongPressCallback? onSecondaryLongPress;
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;
  final GestureLongPressStartCallback? onSecondaryLongPressStart;

  /// HitTestBehavior.opaque handles events by itself
  /// HitTestBehavior.deferToChild child handles events
  /// HitTestBehavior.translucent itself and child can receive events
  final HitTestBehavior behavior;

  /// ****** [Hero] ****** ///
  final String? heroTag;
  final CreateRectTween? createRectTween;
  final HeroFlightShuttleBuilder? flightShuttleBuilder;
  final bool transitionOnUserGestures;
  final HeroPlaceholderBuilder? placeholderBuilder;

  /// ****** [Stack] ****** ///
  final bool isStack;
  final StackFit stackFit;

  /// ****** [ImageFilter] ****** ///
  /// [ fuzzyDegree] is invalid when [filter] !=null
  final ImageFilter? filter;

  /// Blur level 0-100
  final double fuzzyDegree;

  /// Whether to start the background blur [ImageFilter]
  final bool gaussian;

  /// ****** [SafeArea] ****** ///
  final bool safeLeft;
  final bool safeTop;
  final bool safeRight;
  final bool safeBottom;

  EdgeInsetsGeometry? get _paddingIncludingDecoration {
    if (decoration == null) {
      return padding;
    }
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final EdgeInsetsGeometry? decorationPadding = decoration!.padding;
    if (padding == null) {
      return decorationPadding;
    }
    return padding!.add(decorationPadding!);
  }

  @override
  Widget build(BuildContext context) {
    Widget current = const SizedBox();
    if (children != null && children!.isNotEmpty) {
      if (child != null) {
        children!.insert(0, child!);
      }
      if (builder != null) {
        children!.insert(1, builderWidget(current));
      }
      current = isStack ? stackWidget(children!) : flexWidget(children!);
      if (isWrap) {
        current = wrapWidget(children!);
      }
    } else {
      if (child != null) {
        current = child!;
      }
      if (builder != null) {
        current = builderWidget(current);
      }
    }

    current = paddingWidget(current);

    if (alignment != null) {
      current = Align(
          alignment: alignment!,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: current);
    }
    if (intrinsicWidth) {
      current = IntrinsicWidth(child: current);
    }
    if (intrinsicHeight) {
      current = IntrinsicHeight(child: current);
    }

    if (color != null && decoration == null && !addInkWell && !addCard) {
      current = ColoredBox(color: color!, child: current);
    }

    if (decoration != null &&
        clipBehavior != null &&
        clipBehavior != Clip.none) {
      current = clipWidget(current,
          clipper: _DecorationClipper(
              textDirection: Directionality.of(context),
              decoration: decoration!));
    }
    if (decoration != null && !addInkWell) {
      current = DecoratedBox(decoration: decoration!, child: current);
    }
    if (foregroundDecoration != null) {
      current = DecoratedBox(
          decoration: foregroundDecoration!,
          position: DecorationPosition.foreground,
          child: current);
    }
    if (transform != null) {
      current =
          Transform(transform: transform!, origin: origin, child: current);
    }
    if (enabled ||
        onTap != null ||
        onDoubleTap != null ||
        onLongPress != null) {
      current =
          addInkWell ? inkWellWidget(current) : gestureDetectorWidget(current);
    }
    if (shrink) {
      current = SizedBox.shrink(child: current);
    }
    if (expand) {
      current = SizedBox.expand(child: current);
    }
    if (width != null || height != null) {
      current = SizedBox(width: width, height: height, child: current);
    }
    if (size != null) {
      current = SizedBox.fromSize(size: size, child: current);
    }

    if (heroTag != null) {
      current = heroWidget(current);
    }
    if (addCard) {
      current = cardWidget(current, context);
    }
    if (isCircleAvatar) {
      current = circleAvatarWidget(current);
    }
    if (clipper != null || isOval || isClipRRect) {
      current = clipWidget(current, clipper: clipper);
    }

    if (constraints != null) {
      current = ConstrainedBox(constraints: constraints!, child: current);
    }

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }
    if (expanded || flex != null) {
      current = flexibleWidget(current);
    }
    if (left != null || top != null || right != null || bottom != null) {
      current = Positioned(
          left: left, top: top, right: right, bottom: bottom, child: current);
    }
    if (gaussian) {
      backdropFilter(current);
    }
    if (fit != null) {
      current = fittedBox(current);
    }
    if (opacity != null) {
      current = Opacity(opacity: opacity!, child: current);
    }
    if (systemOverlayStyle != null) {
      current = annotatedRegionWidget(current);
    }
    if (offstage) {
      current = offstageWidget(current);
    }
    if (!visible) {
      current = visibilityWidget(current);
    }
    if (safeLeft || safeTop || safeRight || safeBottom) {
      current = SafeArea(
          left: safeLeft,
          top: safeTop,
          right: safeRight,
          bottom: safeBottom,
          child: current);
    }
    return current;
  }

  Widget annotatedRegionWidget(Widget current) =>
      AnnotatedRegion<SystemUiOverlayStyle>(
          sized: sized, value: systemOverlayStyle!, child: current);

  Widget fittedBox(Widget current) => FittedBox(
      fit: fit!,
      alignment: alignment ?? Alignment.center,
      clipBehavior: clipBehavior ?? Clip.none,
      child: current);

  Widget builderWidget(Widget current) {
    if (builder is StatefulWidgetBuilder) {
      return StatefulBuilder(builder: builder as StatefulWidgetBuilder);
    } else if (builder is WidgetBuilder) {
      return Builder(builder: builder as WidgetBuilder);
    } else if (builder is LayoutWidgetBuilder) {
      return LayoutBuilder(builder: builder as LayoutWidgetBuilder);
    }
    return current;
  }

  Widget paddingWidget(Widget current) => _paddingIncludingDecoration == null
      ? current
      : Padding(padding: _paddingIncludingDecoration!, child: current);

  Widget backdropFilter(Widget current) => BackdropFilter(
      filter:
          filter ?? ImageFilter.blur(sigmaX: fuzzyDegree, sigmaY: fuzzyDegree),
      child: current);

  Widget offstageWidget(Widget current) =>
      Offstage(offstage: offstage, child: current);

  /// Crop component
  Widget clipWidget(Widget current, {CustomClipper<dynamic>? clipper}) {
    if (isOval) {
      return ClipOval(
          clipBehavior: clipBehavior ?? Clip.antiAlias, child: current);
    } else if (clipper is CustomClipper<Rect> || isClipRect) {
      return ClipRect(
          clipper: clipper is CustomClipper<Rect> ? clipper : null,
          clipBehavior: clipBehavior ?? Clip.hardEdge,
          child: current);
    } else if (clipper is CustomClipper<Path>) {
      return ClipPath(
          clipper: clipper,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          child: current);
    } else if (clipper is CustomClipper<RRect> || isClipRRect) {
      return ClipRRect(
          borderRadius: borderRadius,
          clipper: clipper is CustomClipper<RRect> ? clipper : null,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          child: current);
    }
    return current;
  }

  Widget circleAvatarWidget(Widget current) => CircleAvatar(
      backgroundColor: color,
      backgroundImage: backgroundImage,
      onBackgroundImageError: onBackgroundImageError,
      foregroundColor: foregroundColor,
      radius: radius,
      minRadius: minRadius,
      maxRadius: maxRadius,
      child: current);

  Widget heroWidget(Widget current) => Hero(
      tag: heroTag!,
      createRectTween: createRectTween,
      flightShuttleBuilder: flightShuttleBuilder,
      placeholderBuilder: placeholderBuilder,
      transitionOnUserGestures: transitionOnUserGestures,
      child: current);

  Widget visibilityWidget(Widget current) => Visibility(
      replacement: replacement,
      visible: visible,
      maintainState: maintainState,
      maintainAnimation: maintainAnimation,
      maintainSize: maintainSize,
      maintainSemantics: maintainSemantics,
      maintainInteractivity: maintainInteractivity,
      child: current);

  Widget flexibleWidget(Widget current) => Flexible(
      flex: flex ?? 1,
      fit: expanded ? FlexFit.tight : FlexFit.loose,
      child: current);

  Widget cardWidget(Widget current, BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CardThemeData cardTheme = CardTheme.of(context);
    return material(current,
        mType: MaterialType.card,
        mShadowColor: shadowColor ?? cardTheme.shadowColor ?? theme.shadowColor,
        mColor: color ?? cardTheme.color ?? theme.cardColor,
        mElevation: elevation ?? cardTheme.elevation ?? 10,
        mShape: shape ??
            cardTheme.shape ??
            RoundedRectangleBorder(
                borderRadius: borderRadius == BorderRadius.zero
                    ? BorderRadius.circular(4)
                    : borderRadius),
        mClipBehavior: clipBehavior ?? cardTheme.clipBehavior ?? Clip.none,
        mBorderOnForeground: true);
  }

  Material material(Widget current,
          {required MaterialType mType,
          Color? mShadowColor,
          Color? mColor,
          TextStyle? mTextStyle,
          required double mElevation,
          BorderRadiusGeometry? mBorderRadius,
          ShapeBorder? mShape,
          required bool mBorderOnForeground,
          required Clip mClipBehavior}) =>
      Material(
          color: mColor,
          type: mType,
          elevation: mElevation,
          shadowColor: mShadowColor,
          textStyle: mTextStyle,
          borderRadius: (mShape != null || shape != null) ? null : borderRadius,
          shape: mShape ?? shape,
          borderOnForeground: mBorderOnForeground,
          clipBehavior: mClipBehavior,
          child: current);

  Widget inkWellWidget(Widget current) => Ink(
      decoration: decoration,
      child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          onDoubleTap: onDoubleTap,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          onHighlightChanged: onHighlightChanged,
          onHover: onHover,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          splashFactory: splashFactory,
          radius: radius,
          borderRadius: borderRadius,
          customBorder: customBorder,
          enableFeedback: enableFeedback ?? true,
          excludeFromSemantics: excludeFromSemantics,
          focusNode: focusNode,
          canRequestFocus: canRequestFocus,
          onFocusChange: onFocusChange,
          autofocus: autoFocus,
          child: current));

  Widget singleChildScrollViewWidget(Widget current) => SingleChildScrollView(
      physics: physics,
      reverse: reverse,
      primary: primary,
      dragStartBehavior: dragStartBehavior,
      controller: scrollController,
      scrollDirection: scrollDirection ?? direction,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      child: current);

  Widget flexWidget(List<Widget> children) => Flex(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      direction: direction,
      textBaseline: textBaseline,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      mainAxisSize: mainAxisSize,
      children: children);

  Widget wrapWidget(List<Widget> children) => Wrap(
      direction: direction,
      alignment: wrapAlignment,
      spacing: wrapSpacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      crossAxisAlignment: wrapCrossAlignment,
      clipBehavior: clipBehavior ?? Clip.none,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      children: children);

  Widget stackWidget(List<Widget> children) => Stack(
      alignment: alignment ?? AlignmentDirectional.topStart,
      textDirection: textDirection,
      fit: stackFit,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      children: children);

  Widget gestureDetectorWidget(Widget current) => GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onDoubleTap: onDoubleTap,
      onSecondaryTap: onSecondaryTap,
      onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
      onSecondaryLongPressUp: onSecondaryLongPressUp,
      onSecondaryLongPress: onSecondaryLongPress,
      onSecondaryLongPressEnd: onSecondaryLongPressEnd,
      onSecondaryLongPressStart: onSecondaryLongPressStart,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onForcePressStart: onForcePressStart,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
      child: current);

  Widget universal(Widget current, {GestureTapCallback? onTap}) => VxUniversal(
      heroTag: heroTag,
      visible: visible,
      constraints: constraints,
      addInkWell: onTap != null && addInkWell,
      borderRadius: borderRadius,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      focusColor: focusColor,
      mainAxisSize: MainAxisSize.min,
      onTap: onTap,
      width: width,
      height: height,
      margin: margin,
      color: color,
      decoration: decoration,
      padding: padding,
      alignment: alignment,
      child: current);
}

/// A clipper that uses [Decoration.getClipPath] to clip.
class _DecorationClipper extends CustomClipper<Path> {
  _DecorationClipper({TextDirection? textDirection, required this.decoration})
      : textDirection = textDirection ?? TextDirection.ltr;

  final TextDirection textDirection;
  final Decoration decoration;

  @override
  Path getClip(Size size) =>
      decoration.getClipPath(Offset.zero & size, textDirection);

  @override
  bool shouldReclip(_DecorationClipper oldClipper) =>
      oldClipper.decoration != decoration ||
      oldClipper.textDirection != textDirection;
}
