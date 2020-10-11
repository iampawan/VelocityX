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
  group("Group all Scroll tests", () {
    testWidgets(
        'scollVertical extension create vertical SingleChildScrollView ',
        (WidgetTester tester) async {
      await tester.pumpWidget(Container(
        height: 1000,
      ).scrollVertical());

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(
        tester
            .widget<SingleChildScrollView>(find.byType(SingleChildScrollView))
            .scrollDirection,
        Axis.vertical,
      );
    });

    testWidgets(
        'scrollHorizontal extension create horizontal SingleChildScrollView ',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: 1000,
          ).scrollHorizontal(),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(
        tester
            .widget<SingleChildScrollView>(find.byType(SingleChildScrollView))
            .scrollDirection,
        Axis.horizontal,
      );
    });

    testWidgets('scollVertical is working correctly ',
        (WidgetTester tester) async {
      await tester.pumpWidget(Container(
        height: 1000,
      ).scrollVertical());

      final RenderBox box = tester.renderObject(find.byType(Container));
      // convert the Offset(0,0) of Container to Global coordinates
      // initially, the starting point of Container will be Offset(0,0)
      expect(box.localToGlobal(Offset.zero), equals(Offset.zero));
      // perform the scroll up action
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(-200.0, -300.0));
      // once the scroll up is performed, the starting point of Container
      // will Offset(0,-300)
      expect(box.localToGlobal(Offset.zero), equals(const Offset(0.0, -300.0)));
    });

    testWidgets('scrollHorizontal is working correctly ',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: 1600,
          ).scrollHorizontal(),
        ),
      );

      final RenderBox box = tester.renderObject(find.byType(Container));
      // convert the Offset(0,0) of Container to Global coordinates
      // initially, the starting point of Container will be Offset(0,0)
      expect(box.localToGlobal(Offset.zero), equals(Offset.zero));
      // perform the scroll left action
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(-300.0, 0.0));
      // once the scroll left is performed, the starting point of Container
      // will Offset(-300,0)
      expect(box.localToGlobal(Offset.zero), equals(const Offset(-300.0, 0.0)));
    });
  });
}
