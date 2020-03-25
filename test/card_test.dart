import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  testWidgets("card creates Card Widget", (WidgetTester tester) async {
    const Key key = Key('key');
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: const Text('VelocityX').card.make(key: key),
    ));

    expect(find.byKey(key), findsOneWidget);
  });

  testWidgets('card widget responds to padding', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: const Text('Velocity').card.p16.make(),
    ));

    expect(tester.getTopLeft(find.byType(Card)), const Offset(0.0, 0.0));
    expect(tester.getTopLeft(find.byType(Text)), const Offset(16.0, 16.0));
  });

  testWidgets('card Widget responds to color', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: const Text('Velocity').card.blue600.make(),
    ));

    expect(tester.widget<Card>(find.byType(Card)).color, VelocityX.blue600);
  });

  testWidgets('card Widget responds to zero Elevation',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: const Text('Velocity').card.zero.make(),
    ));

    expect(tester.widget<Card>(find.byType(Card)).elevation, 0);
  });

  testWidgets('card Widget responds to custom Elevation',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: const Text('Velocity').card.elevation(20).make(),
    ));

    expect(tester.widget<Card>(find.byType(Card)).elevation, 20);
  });

  testWidgets('card Widget responds to custom shape',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: const Text('Velocity').card.withRounded(value: 15).make(),
    ));

    final roundedRectangleBorder =
        tester.widget<Card>(find.byType(Card)).shape as RoundedRectangleBorder;
    expect(roundedRectangleBorder.borderRadius, BorderRadius.circular(15));
  });
}
