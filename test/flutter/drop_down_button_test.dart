import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {

  testWidgets('user is able to select value from drop down',
      (WidgetTester tester) async {
    String _value = 'HEY';
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        home: Material(
          child: ['HELLO', 'HEY', 'HOLA']
              .dropDown(value: _value)
              .onChange((value) => _value = value)
              .make()
              .centered(),
        ),
      ),
    ));

    // Expects one widget with Text HEY
    expect(find.text('HEY'), findsOneWidget);

    // Tap at the HEY to open drop down
    await tester.tap(find.text('HEY'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Select the value by tapping HELLO
    await tester.tap(find.text('HELLO').last);
    await tester.pumpAndSettle();

    // The value of _value should be changed to HELLO
    expect(_value, 'HELLO');
  });
}
