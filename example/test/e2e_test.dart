import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vx_example/main.dart' as app;
import 'package:vx_example/pages/pages.dart';

void main() {
  testWidgets('Example end-to-end test', (tester) async {
    app.main();

    await tester.pump();

    expect(find.byType(HomePage), findsOneWidget);

    /// Tap on get data button.
    await tester.tap(find.byKey(const Key('get-data-button')));
    await tester.pumpAndSettle();

    /// Tap on profile button.
    await tester.tap(find.byKey(const Key('bottom-nav-profile')));
    await tester.pumpAndSettle();

    expect(find.byType(ProfilePage), findsOneWidget);

    /// Tap on update name button.
    await tester.tap(find.byKey(const Key('update-name-button')));
    await tester.pumpAndSettle();

    expect(find.byType(UpdateNamePage), findsOneWidget);

    /// Enter in new name.
    await tester.enterText(
      find.byKey(const Key('update-name-form')),
      'new name',
    );

    /// Submit form.
    await tester.tap(find.byKey(const Key('update-name-submit')));
    await tester.pumpAndSettle();

    expect(find.byType(ProfilePage), findsOneWidget);

    /// Tap on home button.
    await tester.tap(find.byKey(const Key('bottom-nav-home')));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    /// Tap on about button.
    await tester.tap(find.byKey(const Key('about-button')));
    await tester.pumpAndSettle();

    expect(find.byType(AboutPage), findsOneWidget);

    /// Tap on back button.
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });
}
