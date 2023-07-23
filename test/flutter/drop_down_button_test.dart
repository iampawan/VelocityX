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
  testWidgets('user is able to select value from drop down',
      (WidgetTester tester) async {
    String? value = 'HEY';
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        home: Material(
          child: ['HELLO', 'HEY', 'HOLA']
              .textDropDown(
                selectedValue: value,
                onChanged: (cvalue) {
                  value = cvalue;
                },
              )
              .make()
              .centered(),
        ),
      ),
    ));

    // Expects one widget with Text HEY
    expect(find.text('HEY'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    // Tap at the HEY to open drop down
    await tester.tap(find.text('HEY'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Expects one widget with Text HEY
    expect(find.text('HELLO'), findsOneWidget);
    // Select the value by tapping HELLO
    await tester.tap(find.text('HELLO').last);
    await tester.pumpAndSettle();

    // The value of _value should be changed to HELLO
    expect(value, 'HELLO');
  });
}
