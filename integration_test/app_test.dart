import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:silent_moon/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets('fff', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      tester.tap(find.byType(FloatingActionButton));
     await Future.delayed(Duration(seconds: 5));
      await tester.pumpAndSettle();
    });
  });
}
