import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/// About page.
class AboutPage extends StatelessWidget {
  /// Create about page.
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'About'.text.make()),
      body: [
        'VelocityX Example App'.text.xl2.bold.makeCentered().py16(),
      ].vStack(alignment: MainAxisAlignment.center),
    );
  }
}
