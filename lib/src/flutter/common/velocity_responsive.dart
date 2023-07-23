import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/// VxDevice widget can be used for making responsive apps based on if it's mobile or web.
/// In case, if you want more options based on window size, use [VxResponsive].
/// You can specify two widgets depends on the screen size  [mobile] and [web].
/// They must not be null.
class VxDevice extends StatelessWidget {
  ///
  /// For mobile size window
  ///
  final Widget mobile;

  ///
  /// For non - mobile size window
  ///
  final Widget web;

  const VxDevice({super.key, required this.mobile, required this.web});
  @override
  Widget build(BuildContext context) {
    return VxConditionalSwitch.single(
      context: context,
      valueBuilder: (context) => context.mdWindowSize,
      caseBuilders: {VxWindowSize.xsmall: (context) => mobile},
      fallbackBuilder: (context) => web,
    )!;
  }
}

/// VelocityResponsive widget can be used for making responsive apps based on different window sizes.
/// You can specify multiple widgets depends on the screen size like [xsmall], [small], [medium],[large],
/// and [xlarge]. The [fallback] must not be null. It will be replaced if you don't specity any above widget.
class VxResponsive extends StatelessWidget {
  ///
  /// For window size as extra small
  ///
  final Widget? xsmall;

  ///
  /// For window size as small
  ///
  final Widget? small;

  ///
  /// For window size as medium
  ///
  final Widget? medium;

  ///
  /// For window size as large
  ///
  final Widget? large;

  ///
  /// For window size as extra large
  ///
  final Widget? xlarge;

  ///
  /// if none of the above props are specified then [fallback] is used
  ///
  final Widget? fallback;

  const VxResponsive(
      {super.key,
      this.xsmall,
      this.small,
      this.medium,
      this.large,
      this.xlarge,
      this.fallback});
  @override
  Widget build(BuildContext context) {
    return VxConditionalSwitch.single(
      context: context,
      valueBuilder: (context) => context.mdWindowSize,
      caseBuilders: {
        VxWindowSize.xsmall: (context) =>
            xsmall ?? fallback ?? small ?? medium ?? large ?? xlarge,
        VxWindowSize.small: (context) =>
            small ?? xsmall ?? fallback ?? medium ?? large ?? xlarge,
        VxWindowSize.medium: (context) =>
            medium ?? small ?? xsmall ?? fallback ?? large ?? xlarge,
        VxWindowSize.large: (context) =>
            large ?? medium ?? small ?? xsmall ?? fallback ?? xlarge,
        VxWindowSize.xlarge: (context) =>
            xlarge ?? large ?? medium ?? small ?? xsmall ?? fallback,
      },
      fallbackBuilder: (context) => fallback,
    )!;
  }
}

/// [VxLayout] is a type of [LayoutBuilder] with some additional power
///
class VxLayout extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    VxWindowSize window,
    BoxConstraints constraints,
  ) builder;

  final VxSizeConfig? sizeConfig;

  const VxLayout({
    super.key,
    required this.builder,
    this.sizeConfig,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      VxWindowSize windowSize = VxWindowSize.small;
      if (boxConstraints.maxWidth < (sizeConfig?.xsmall ?? 600)) {
        windowSize = VxWindowSize.xsmall;
      } else if (boxConstraints.maxWidth < (sizeConfig?.small ?? 1024)) {
        windowSize = VxWindowSize.small;
      } else if (boxConstraints.maxWidth < (sizeConfig?.medium ?? 1440)) {
        windowSize = VxWindowSize.medium;
      } else if (boxConstraints.maxWidth < (sizeConfig?.large ?? 1920)) {
        windowSize = VxWindowSize.large;
      } else if (boxConstraints.maxWidth < (sizeConfig?.xlarge ?? 4096)) {
        windowSize = VxWindowSize.xlarge;
      } else {
        windowSize = VxWindowSize.xlarge;
      }
      return builder(context, windowSize, boxConstraints);
    });
  }
}

class VxSizeConfig {
  final double? xsmall;
  final double? small;
  final double? medium;
  final double? large;
  final double? xlarge;

  VxSizeConfig({this.xsmall, this.small, this.medium, this.large, this.xlarge});
}

/// A typedef representing a callback function used to build the UI based on the current screen adaptation settings.
typedef VxAdaptiveChildBuilder = Widget Function(
    BuildContext context, bool scaled);

/// Defines the different scaling options for screen adaptation.
enum VxAdaptiveScaleType {
  none, // No scaling
  auto, // Scale based on the screen's orientation and aspect ratio
  width, // Scale based on the screen width
}

/// A widget that enables screen adaptation and scaling in Flutter applications.
class VxAdaptive extends StatefulWidget {
  /// Creates a `VxAdaptive` widget.
  const VxAdaptive({
    super.key,
    required this.designWidth,
    required this.builder,
    this.scaleType = VxAdaptiveScaleType.auto,
  });

  /// The width (in pixels) used as the reference for screen adaptation.
  final double designWidth;

  /// The callback function used to build the UI based on the current screen adaptation settings.
  final VxAdaptiveChildBuilder builder;

  /// The scaling type to be used for screen adaptation. Defaults to `VxAdaptiveScaleType.auto`.
  final VxAdaptiveScaleType scaleType;

  @override
  State<VxAdaptive> createState() => _VxAdaptiveState();
}

class _VxAdaptiveState extends State<VxAdaptive> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (context.view.physicalSize.isEmpty) {
      // Fallback case when the view's size is not available
      return VxAdaptiveScope._(
        designWidth: widget.designWidth,
        scaleType: widget.scaleType,
        scaleRatio: 1,
        child: const SizedBox(),
      );
    }

    final Size sceneSize =
        context.view.physicalSize / context.view.devicePixelRatio;
    if (widget.scaleType == VxAdaptiveScaleType.none ||
        (widget.scaleType == VxAdaptiveScaleType.auto &&
            sceneSize.width >= sceneSize.height * 1.1)) {
      // No scaling or scaling based on aspect ratio
      return VxAdaptiveScope._(
        designWidth: widget.designWidth,
        scaleType: widget.scaleType,
        scaleRatio: 1,
        child: Builder(
          builder: (BuildContext context) => widget.builder(context, false),
        ),
      );
    }

    final double scale = sceneSize.width / widget.designWidth;

    // Apply scaling to the UI based on the scale factor
    return FractionallySizedBox(
      widthFactor: 1 / scale,
      heightFactor: 1 / scale,
      child: Transform.scale(
        scale: scale,
        child: VxAdaptiveScope._(
          designWidth: widget.designWidth,
          scaleType: widget.scaleType,
          scaleRatio: scale,
          child: widget.builder(context, true),
        ),
      ),
    );
  }
}

class VxAdaptiveScope extends InheritedWidget {
  VxAdaptiveScope._({
    required this.designWidth,
    required this.scaleType,
    required this.scaleRatio,
    required Widget child,
  }) : super(child: _MediaQueryDataProvider(child: child));

  final double designWidth;
  final VxAdaptiveScaleType scaleType;
  final double scaleRatio;

  static VxAdaptiveScope of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<VxAdaptiveScope>()!;

  static VxAdaptiveScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<VxAdaptiveScope>();

  @override
  bool updateShouldNotify(covariant VxAdaptiveScope oldWidget) =>
      oldWidget.designWidth != designWidth ||
      oldWidget.scaleType != scaleType ||
      oldWidget.scaleRatio != scaleRatio;
}

class _MediaQueryDataProvider extends StatelessWidget {
  const _MediaQueryDataProvider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final VxAdaptiveScope data = VxAdaptiveScope.of(context);
    final MediaQueryData parent = context.mq;
    return MediaQuery(
      data: parent.copyWith(
        size: parent.size / data.scaleRatio,
        devicePixelRatio: parent.devicePixelRatio * data.scaleRatio,
        padding: parent.padding / data.scaleRatio,
        viewPadding: parent.viewPadding / data.scaleRatio,
        viewInsets: parent.viewInsets / data.scaleRatio,
        systemGestureInsets: parent.systemGestureInsets / data.scaleRatio,
      ),
      child: child,
    );
  }
}
