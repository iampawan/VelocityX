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

  const VxDevice({Key? key, required this.mobile, required this.web})
      : super(key: key);
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
      {Key? key,
      this.xsmall,
      this.small,
      this.medium,
      this.large,
      this.xlarge,
      this.fallback})
      : super(key: key);
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
    Key? key,
    required this.builder,
    this.sizeConfig,
  }) : super(key: key);

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
