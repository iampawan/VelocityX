/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  group("Group all container tests", () {
    testWidgets('box creates a Container', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: const Text('Velocity').box.make(),
      ));

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('VelocityBox creates a container', (WidgetTester tester) async {
      await tester.pumpWidget(VxBox().make());

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('key is properly assigned', (WidgetTester tester) async {
      const Key key = Key("key");
      await tester.pumpWidget(VxBox().make(key: key));

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('VelocityBox reponds to height and width',
        (WidgetTester tester) async {
      const Key key = Key('Key');
      await tester.pumpWidget(Material(
        child: Center(child: VxBox().height(100).width(500).make(key: key)),
      ));

      final size = tester.getRect(find.byKey(key));
      expect(size.height, 100);
      expect(size.width, 500);
    });

    testWidgets('VelocityBox reponds to padding', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: VxBox(child: const Text('VelocityX')).p16.make(),
          ),
        ),
      ));

      final containerRect = tester.getRect(find.byType(Container));
      final textRect = tester.getRect(find.byType(Text));
      // value of p16 is EdgeInsets.all(16), hence container.top = textSize.top - 16
      expect(containerRect.top, textRect.top - 16);
      expect(containerRect.left, textRect.left - 16);
      expect(containerRect.right, textRect.right + 16);
      expect(containerRect.bottom, textRect.bottom + 16);
    });

    testWidgets('VelocityBox reponds to custom padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: VxBox(child: const Text('VelocityX'))
                .padding(const EdgeInsets.fromLTRB(16, 10, 5, 18))
                .make(),
          ),
        ),
      ));

      final containerRect = tester.getRect(find.byType(Container));
      final textRect = tester.getRect(find.byType(Text));
      expect(containerRect.top, textRect.top - 10);
      expect(containerRect.left, textRect.left - 16);
      expect(containerRect.right, textRect.right + 5);
      expect(containerRect.bottom, textRect.bottom + 18);
    });

    testWidgets('VelocityBox responds to color', (WidgetTester tester) async {
      await tester.pumpWidget(VxBox().height(50).width(50).red200.make());

      final decoration = tester
          .widget<Container>(find.byType(Container))
          .decoration as BoxDecoration;
      expect(decoration.color, Vx.red200);
    });

    testWidgets('VelocityBox reponds to alignment',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: VxBox(child: const Text('VelocityX')).alignCenter.make(),
          ),
        ),
      ));

      final containerRect = tester.getRect(find.byType(Container));
      final textRect = tester.getRect(find.byType(Text));
      // since Text is aligned to the center of VelocityBox, center Offset
      // for both VelocityBox and Text should be same.
      expect(containerRect.center, textRect.center);
    });

    testWidgets('VelocityBox responds to shadow', (WidgetTester tester) async {
      await tester.pumpWidget(VxBox().height(50).width(50).shadowLg.make());

      // box shadow defined for shadowLg
      final shadow = [
        const BoxShadow(
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
            blurRadius: 4.0,
            spreadRadius: -1.0,
            blurStyle: BlurStyle.normal),
        const BoxShadow(
            color: Color(0x24000000),
            offset: Offset(0.0, 4.0),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            blurStyle: BlurStyle.normal),
        const BoxShadow(
            color: Color(0x1f000000),
            offset: Offset(0.0, 1.0),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            blurStyle: BlurStyle.normal)
      ];

      final decoration = tester
          .widget<Container>(find.byType(Container))
          .decoration as BoxDecoration;
      expect(decoration.boxShadow, shadow);
    });

    testWidgets('VelocityBox responds to border radius',
        (WidgetTester tester) async {
      await tester.pumpWidget(VxBox().height(40).width(40).roundedFull.make());

      final decoration = tester
          .widget<Container>(find.byType(Container))
          .decoration as BoxDecoration;
      // when borderRadius is roundedFull, the shape is BoxShape.circle
      expect(decoration.shape, BoxShape.circle);
    });

    testWidgets('VelocityBox responds to custom border radius',
        (WidgetTester tester) async {
      await tester.pumpWidget(
          VxBox().height(40).width(40).withRounded(value: 19).make());

      final decoration = tester
          .widget<Container>(find.byType(Container))
          .decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(19));
    });

    testWidgets('VelocityBox responds to gradient',
        (WidgetTester tester) async {
      await tester.pumpWidget(VxBox()
          .height(40)
          .width(40)
          .linearGradient([Vx.red300, Vx.blue600]).make());

      final decoration = tester
          .widget<Container>(find.byType(Container))
          .decoration as BoxDecoration;
      expect(decoration.gradient,
          const LinearGradient(colors: [Vx.red300, Vx.blue600]));
    });

    testWidgets('VelocityBox responds to border', (WidgetTester tester) async {
      await tester.pumpWidget(VxBox()
          .width(100)
          .height(100)
          .border(color: Vx.green100, width: 3)
          .make());

      final decoration = tester
          .widget<Container>(find.byType(Container))
          .decoration as BoxDecoration;
      expect(decoration.border!.isUniform, true);
      expect(decoration.border!.top.width, 3);
      expect(decoration.border!.top.color, Vx.green100);
    });
  });
}
