import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import 'package:integration_test/integration_test.dart';
import "package:scholars_padi/main.dart" as app;

void main() {
  group("App test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Login screen test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final email = find.byKey(const Key('testKeyEmail'));
      final password = find.byKey(const Key('testKeyPassword'));
      final loginButton = find.byKey(const Key('testKeyloginButton'));

      await tester.enterText(email, 'kolikay1989@gmail.com');
      await tester.enterText(password, '12345');
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();
    });
  });
}
