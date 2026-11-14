import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fastwork_login/main.dart';

void main() {
  testWidgets('Login screen renders brand, fields and actions', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('FASTWORK'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Iniciar Sesión'), findsOneWidget);
  });

  testWidgets('Bottom navigation reaches every tab', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainPage()));

    for (final label in ['Servicios', 'Historial', 'Perfil', 'Inicio']) {
      await tester.tap(find.text(label).last);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });
}
