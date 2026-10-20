import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sabori_delivery/main.dart';

void main() {
  testWidgets('Mostra a tela de login ao abrir o app', (tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Sabori'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Continuar com Google'), findsOneWidget);
  });

  testWidgets('Botão Entrar abre a página inicial', (tester) async {
    await tester.pumpWidget(const MeuApp());

    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Entrar'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Entrar'));
    await tester.pumpAndSettle();

    expect(find.text('O que você deseja pedir?'), findsOneWidget);
  });

  testWidgets('Busca filtra os produtos pelo texto', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PaginaBusca()));

    expect(find.text('6 itens'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'pizza');
    await tester.pump();

    expect(find.text('1 item'), findsOneWidget);
    expect(find.text('Pizza de calabresa'), findsOneWidget);
  });
}
