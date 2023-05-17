import 'package:flutter/material.dart';

/// [VxNone] is a widget that takes no space and returns nothing
///
/// Example: VxNone()

class VxNone extends StatelessWidget {
  const VxNone({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
