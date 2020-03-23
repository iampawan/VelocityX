import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'velocity_conditional.dart';

/// VelocityDevice widget can be used for making responsive apps based on if it's mobile or web.
/// In case, if you want more options based on window size, use [VelocityResponsive].
/// You can specify two widgets depends on the screen size  [mobile] and [web].
/// They must not be null.
class VelocityDevice extends StatelessWidget {
  final Widget mobile;
  final Widget web;

  const VelocityDevice({Key key, @required this.mobile, @required this.web})
      : assert(mobile != null),
        assert(web != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VelocityConditionalSwitch.single(
      context: context,
      valueBuilder: (context) => context.mdWindowSize,
      caseBuilders: {MobileWindowSize.xsmall: (context) => mobile},
      fallbackBuilder: (context) => web,
    );
  }
}

/// VelocityResponsive widget can be used for making responsive apps based on different window sizes.
/// You can specify multiple widgets depends on the screen size like [xsmall], [small], [medium],[large],
/// and [xlarge]. The [fallback] must not be null. It will be replaced if you don't specity any above widget.
class VelocityResponsive extends StatelessWidget {
  final Widget xsmall;
  final Widget small;
  final Widget medium;
  final Widget large;
  final Widget xlarge;
  final Widget fallback;

  const VelocityResponsive({Key key, this.xsmall, this.small, this.medium, this.large, this.xlarge, this.fallback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VelocityConditionalSwitch.single(
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
    );
  }
}
