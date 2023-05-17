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
import 'package:velocity_x/velocity_x.dart';

void main() {
  Directionality directionalityWidget({required Widget child}) =>
      Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      );
  group("Group all rich text tests", () {
    testWidgets('richText creates RichText Widget',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(
          directionalityWidget(child: 'VelocityX'.richText.make(key: key)));

      expect(find.byKey(key), findsOneWidget);
      // The rich text is type of AutoSizeText const
      expect(tester.widget(find.byKey(key)).runtimeType, AutoSizeText);
      expect(tester.widget<AutoSizeText>(find.byKey(key)).textSpan!.text,
          'VelocityX');
    });

    testWidgets('VelocityXRichTextBuilder responds to children',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(directionalityWidget(
          child: 'VelocityX'
              .richText
              .withTextSpanChildren([' Hey '.textSpan.make()]).make(key: key)));

      final AutoSizeText autoSizeText = tester.widget(find.byKey(key));
      // expect(
      //   autoSizeText.textSpan.text + autoSizeText.textSpan.children.first.text,
      //   'VelocityX Hey ',
      // );

      expect(autoSizeText.textSpan!.children!.length, 1);
    });

    testWidgets('VelocityXRichTextBuilder responds to onTap',
        (WidgetTester tester) async {
      const Key key = Key('key');
      bool didTap = false;
      await tester.pumpWidget(
        directionalityWidget(
          child: 'VelocityX'.richText.tap(() => didTap = true).make(key: key),
        ),
      );

      expect(didTap, isFalse);
      await tester.tap(find.byKey(key));
      expect(didTap, isTrue);
    });

    testWidgets('VelocityXRichTextBuilder children responds to onTap',
        (WidgetTester tester) async {
      const Key key = Key('key');
      bool didTap = false;
      await tester.pumpWidget(
        directionalityWidget(
          child: 'VelocityX'.richText.withTextSpanChildren([
            ' Hey '.textSpan.tap(() => didTap = true).make()
          ]).make(key: key),
        ),
      );

      expect(didTap, isFalse);
      await tester.tap(find.byKey(key));
      expect(didTap, isTrue);
    });

    testWidgets('VelocityXRichTextBuilder responds to decoration',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(directionalityWidget(
          child: 'VelocityX'.richText.underline.make(key: key)));

      expect(
          tester
              .widget<AutoSizeText>(find.byKey(key))
              .textSpan!
              .style!
              .decoration,
          TextDecoration.underline);
    });

    testWidgets('VelocityXRichTextBuilder responds to color',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(directionalityWidget(
          child: 'VelocityX'.richText.green100.make(key: key)));

      expect(
          tester.widget<AutoSizeText>(find.byKey(key)).textSpan!.style!.color,
          Vx.green100);
    });

    testWidgets('VelocityXRichTextBuilder responds to color',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(directionalityWidget(
          child: 'VelocityX'.richText.green100.make(key: key)));

      expect(
          tester.widget<AutoSizeText>(find.byKey(key)).textSpan!.style!.color,
          Vx.green100);
    });

    testWidgets('VelocityXRichTextBuilder responds to fontSize',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(directionalityWidget(
          child: 'VelocityX'.richText.size(20).make(key: key)));

      expect(
          tester
              .widget<AutoSizeText>(find.byKey(key))
              .textSpan!
              .style!
              .fontSize,
          20);
    });

    testWidgets('VelocityXRichTextBuilder responds to letterSpacing',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(directionalityWidget(
          child: 'VelocityX'.richText.letterSpacing(4).make(key: key)));

      expect(
          tester
              .widget<AutoSizeText>(find.byKey(key))
              .textSpan!
              .style!
              .letterSpacing,
          4);
    });

    testWidgets('VelocityXRichTextBuilder responds to lineHeight',
        (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(directionalityWidget(
          child: 'VelocityX'.richText.heightSnug.make(key: key)));

      // The value of heightSnug is 0.875
      expect(
          tester.widget<AutoSizeText>(find.byKey(key)).textSpan!.style!.height,
          0.875);
    });
  });
}
