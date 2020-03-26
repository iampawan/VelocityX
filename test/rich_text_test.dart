import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  Directionality directionalityWidget({Widget child}) => Directionality(
        child: child,
        textDirection: TextDirection.ltr,
      );

  testWidgets('richText creates RichText Widget', (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(
        directionalityWidget(child: 'VelocityX'.richText.make(key: key)));

    expect(find.byKey(key), findsOneWidget);
    // The rich text is type of AutoSizeText const
    expect(tester.widget(find.byKey(key)).runtimeType, AutoSizeText);
    expect(tester.widget<AutoSizeText>(find.byKey(key)).textSpan.text,
        'VelocityX');
  });

  testWidgets('VelocityXRichTextBuilder responds to children', (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(directionalityWidget(
        child: 'VelocityX'
            .richText
            .withTextSpanChildren([' Hey '.textSpan.make()]).make(key: key)));

    final AutoSizeText autoSizeText = tester.widget(find.byKey(key));
    expect(
      autoSizeText.textSpan.text + autoSizeText.textSpan.children.first.text,
      'VelocityX Hey ',
    );

    expect(autoSizeText.textSpan.children.length, 1);
  });

  testWidgets('VelocityXRichTextBuilder responds to onTap', (WidgetTester tester) async {
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
        child: 'VelocityX'.richText.withTextSpanChildren(
            [' Hey '.textSpan.tap(() => didTap = true).make()]).make(key: key),
      ),
    );

    expect(didTap, isFalse);
    await tester.tap(find.byKey(key));
    expect(didTap, isTrue);
  });

  testWidgets('VelocityXRichTextBuilder responds to decoration', (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(directionalityWidget(
        child: 'VelocityX'.richText.underline.make(key: key)));

    expect(
        tester.widget<AutoSizeText>(find.byKey(key)).textSpan.style.decoration,
        TextDecoration.underline);
  });

  testWidgets('VelocityXRichTextBuilder responds to color', (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(directionalityWidget(
        child: 'VelocityX'.richText.green100.make(key: key)));

    expect(tester.widget<AutoSizeText>(find.byKey(key)).textSpan.style.color,
        VelocityX.green100);
  });

  testWidgets('VelocityXRichTextBuilder responds to color', (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(directionalityWidget(
        child: 'VelocityX'.richText.green100.make(key: key)));

    expect(tester.widget<AutoSizeText>(find.byKey(key)).textSpan.style.color,
        VelocityX.green100);
  });

  testWidgets('VelocityXRichTextBuilder responds to fontSize', (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(directionalityWidget(
        child: 'VelocityX'.richText.size(20).make(key: key)));

    expect(tester.widget<AutoSizeText>(find.byKey(key)).textSpan.style.fontSize,
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
            .textSpan
            .style
            .letterSpacing,
        4);
  });

  testWidgets('VelocityXRichTextBuilder responds to lineHeight', (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(directionalityWidget(
        child: 'VelocityX'.richText.heightSnug.make(key: key)));

    // The value of heightSnug is 0.875
    expect(tester.widget<AutoSizeText>(find.byKey(key)).textSpan.style.height,
        0.875);
  });
}
