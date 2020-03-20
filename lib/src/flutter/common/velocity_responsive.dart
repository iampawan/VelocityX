import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'velocity_conditional.dart';

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
        MobileWindowSize.xsmall: (context) => xsmall,
        MobileWindowSize.small: (context) => small,
        MobileWindowSize.medium: (context) => medium,
        MobileWindowSize.large: (context) => large,
        MobileWindowSize.xlarge: (context) => xlarge,
      },
      fallbackBuilder: (context) => fallback,
    );
  }
}
