import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vx_example/pages/pages.dart';
import 'package:vx_example/stores/base_store.dart';
import 'package:vxstate/vxstate.dart';

const screenWidth = 390.0;
const screenHeight = 844.0;

const scenarioConstraints = BoxConstraints(
  maxWidth: screenWidth,
  maxHeight: screenHeight,
  minWidth: screenWidth,
  minHeight: screenHeight,
);

Future<void> main() async {
  Widget buildPage(Widget page) => VxState(store: BaseStore(), child: page);

  await goldenTest(
    'Golden',
    fileName: 'goldens',
    builder: () => GoldenTestGroup(
      scenarioConstraints: scenarioConstraints,
      children: [
        GoldenTestScenario(
          name: 'HomePage',
          child: buildPage(const HomePage()),
        ),
        GoldenTestScenario(
          name: 'ProfilePage',
          child: buildPage(const ProfilePage()),
        ),
        GoldenTestScenario(
          name: 'AboutPage',
          child: buildPage(const AboutPage()),
        ),
        GoldenTestScenario(
          name: 'UpdateNamePage',
          child: buildPage(const UpdateNamePage()),
        ),
      ],
    ),
  );
}
