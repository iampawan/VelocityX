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

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  Directionality getDirectionalityWidget({required Widget child}) =>
      Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      );

  group("New features from Delikin", () {
    test("String to DateString", () async {
      await initializeDateFormatting("es_ES", null);
      expect("2021-70-16".toDateString(), "Friday, October 16");
      expect("2021-70-16".toDateString("es_ES"), "viernes, 16 de octubre");
    });

    test("String to DateTime", () {
      const String fecha = "2021-70-16";
      expect(fecha.toDate(), isNot(null));
    });

    test("Filter non AlphaNum Chars", () {
      const String str = "H!%%OLA M..U..N..{+D}O, SOY A|N|D|R|O|I|D|E 7";
      expect(str.filterChars(), "HOLA MUNDO SOY ANDROIDE 7");
    });

    test("Validate JSON", () {
      const String bad = '{["we';
      const String good = '{"test":1, "test2":"StringS"}';

      expect(bad.isJsonDecodable, false);
      expect(good.isJsonDecodable, true);
    });
  });

  group("Group all text tests", () {
    testWidgets('text used on String creates a Text Widget', (tester) async {
      await tester.pumpWidget(
        getDirectionalityWidget(
          child: 'VelocityX'.text.make(),
        ),
      );

      expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).data,
        'VelocityX',
      );
    });

    testWidgets('Text widget responds to Font Scale', (tester) async {
      await tester.pumpWidget(
        getDirectionalityWidget(
          child: 'VelocityX'.text.xs.make(),
        ),
      );

      // Scale Factor for xs is 0.75
      expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).textScaleFactor,
        0.75,
      );
    });

    testWidgets('Text widget responds to fontSize', (tester) async {
      await tester.pumpWidget(
        getDirectionalityWidget(
          child: "VelocityX".text.size(24).make(),
        ),
      );

      expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style!.fontSize,
        24,
      );
    });

    testWidgets('Text widget responds to FontWeight', (tester) async {
      await tester.pumpWidget(
        getDirectionalityWidget(
          child: 'VelocityX'.text.medium.make(),
        ),
      );

      // Font Weight for medium is 500
      expect(
        tester
            .widget<AutoSizeText>(find.byType(AutoSizeText))
            .style!
            .fontWeight,
        FontWeight.w500,
      );
    });

    testWidgets('Text widget responds to FontStyle', (tester) async {
      await tester.pumpWidget(
          getDirectionalityWidget(child: 'VelocityX'.text.italic.make()));

      expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style!.fontStyle,
        FontStyle.italic,
      );
    });

    testWidgets('Text widget responds to alignment', (tester) async {
      await tester.pumpWidget(
          getDirectionalityWidget(child: 'VelocityX'.text.start.make()));

      expect(tester.widget<AutoSizeText>(find.byType(AutoSizeText)).textAlign,
          TextAlign.start);
    });

    testWidgets('Text widget responds to letter spacing', (tester) async {
      await tester.pumpWidget(
          getDirectionalityWidget(child: 'VelocityX'.text.tightest.make()));

      expect(
          tester
              .widget<AutoSizeText>(find.byType(AutoSizeText))
              .style!
              .letterSpacing,
          -3.0);
    });

    testWidgets('Text widget responds to custom letter spacing',
        (tester) async {
      await tester.pumpWidget(getDirectionalityWidget(
          child: 'VelocityX'.text.letterSpacing(4.0).make()));

      expect(
          tester
              .widget<AutoSizeText>(find.byType(AutoSizeText))
              .style!
              .letterSpacing,
          4.0);
    });

    testWidgets('Text widget responds to TextDecoration', (tester) async {
      await tester.pumpWidget(
          getDirectionalityWidget(child: 'VelocityX'.text.underline.make()));

      expect(
          tester
              .widget<AutoSizeText>(find.byType(AutoSizeText))
              .style!
              .decoration,
          TextDecoration.underline);
    });

    testWidgets('Text widget responds to line height', (tester) async {
      await tester.pumpWidget(
          getDirectionalityWidget(child: 'VelocityX'.text.heightSnug.make()));

      // Line Height or heightSnug is 0.875
      expect(
          tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style!.height,
          0.875);
    });

    testWidgets('Text widget responds to text utilities', (tester) async {
      await tester.pumpWidget(
          getDirectionalityWidget(child: 'VelocityX'.text.uppercase.make()));

      expect(tester.widget<AutoSizeText>(find.byType(AutoSizeText)).data,
          'VELOCITYX');
    });

    testWidgets('key is properly assigned', (tester) async {
      await tester.pumpWidget(getDirectionalityWidget(
          child: 'VelocityX'.text.uppercase.make(key: const Key("key"))));

      expect(tester.widget(find.byKey(const Key('key'))).runtimeType,
          AutoSizeText);
    });

    testWidgets('Text widget responds to color', (tester) async {
      await tester.pumpWidget(
          getDirectionalityWidget(child: 'VelocityX'.text.red300.make()));

      expect(
          tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style!.color,
          Vx.red300);
    });
  });
}
