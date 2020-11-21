import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

import 'velocity_conditional.dart';

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
      caseBuilders: {MobileWindowSize.xsmall: (context) => mobile},
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
        MobileWindowSize.xsmall: (context) => xsmall ?? fallback,
        MobileWindowSize.small: (context) => small ?? fallback,
        MobileWindowSize.medium: (context) => medium ?? fallback,
        MobileWindowSize.large: (context) => large ?? fallback,
        MobileWindowSize.xlarge: (context) => xlarge ?? fallback,
      },
      fallbackBuilder: (context) => fallback,
    )!;
  }
}
