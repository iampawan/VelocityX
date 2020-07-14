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
  group("Group all card tests", () {
    testWidgets("Card creates card widget", (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: const Text('VelocityX').card.make(key: key),
      ));

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Card widget responds to padding', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: const Text('Velocity').card.p16.make(),
      ));

      expect(tester.getTopLeft(find.byType(Card)), const Offset(0.0, 0.0));
      expect(tester.getTopLeft(find.byType(Text)), const Offset(16.0, 16.0));
    });

    testWidgets('Card Widget responds to color', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: const Text('Velocity').card.blue600.make(),
      ));

      expect(tester.widget<Card>(find.byType(Card)).color, Vx.blue600);
    });

    testWidgets('Card widget responds to zero Elevation',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: const Text('Velocity').card.zero.make(),
      ));

      expect(tester.widget<Card>(find.byType(Card)).elevation, 0);
    });

    testWidgets('Card widget responds to custom Elevation',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: const Text('Velocity').card.elevation(20).make(),
      ));

      expect(tester.widget<Card>(find.byType(Card)).elevation, 20);
    });

    testWidgets('Card Widget responds to custom shape',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: const Text('Velocity').card.withRounded(value: 15).make(),
      ));

      final roundedRectangleBorder = tester
          .widget<Card>(find.byType(Card))
          .shape as RoundedRectangleBorder;
      expect(roundedRectangleBorder.borderRadius, BorderRadius.circular(15));
    });
  });
}
