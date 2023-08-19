import "package:flutter_test/flutter_test.dart";
import 'package:integration_test/integration_test.dart';
import "package:scholars_padi/main.dart" as app;

void main() {
  group("App test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Login screen test", (tester) async {
      app.main();
      tester.pumpAndSettle();
      
    });
  });
}
