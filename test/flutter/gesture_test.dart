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
  group("Group all gesture tests", () {
    testWidgets('onTap for GestureDetector is working correctly',
        (WidgetTester tester) async {
      bool didTap = false;
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: 'VelocityX'
              .text
              .make()
              .click(() => didTap = true)
              .make()
              .centered(),
        ),
      ));

      expect(didTap, isFalse);
      await tester.tap(find.text('VelocityX'));
      await tester.pump();
      expect(didTap, isTrue);
    });

    testWidgets('onLongPress for GestureDetector is working correctly',
        (WidgetTester tester) async {
      bool didLongPress = false;
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: 'VelocityX'
              .text
              .make()
              .longClick(() => didLongPress = true)
              .make()
              .centered(),
        ),
      ));

      expect(didLongPress, isFalse);
      await tester.longPress(find.text('VelocityX'));
      await tester.pump();
      expect(didLongPress, isTrue);
    });

    testWidgets('onTap for InkWell is working correctly',
        (WidgetTester tester) async {
      bool didTap = false;
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: 'VelocityX'
              .text
              .make()
              .mdClick(() => didTap = true)
              .make()
              .centered(),
        ),
      ));

      expect(didTap, isFalse);
      await tester.tap(find.text('VelocityX'));
      await tester.pump();
      expect(didTap, isTrue);
    });

    testWidgets('onLongPress for InkWell is working correctly',
        (WidgetTester tester) async {
      bool didLongPress = false;
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: 'VelocityX'
              .text
              .make()
              .mdLongClick(() => didLongPress = true)
              .make()
              .centered(),
        ),
      ));

      expect(didLongPress, isFalse);
      await tester.longPress(find.text('VelocityX'));
      await tester.pump();
      expect(didLongPress, isTrue);
    });
  });
}
