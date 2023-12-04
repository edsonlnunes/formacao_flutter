import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main.dart' as app;
import 'json.dart';

void main() {
  final List<TestResult> results = [];

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await Future.delayed(const Duration(seconds: 1));
  });

  // tearDownAll(() => enviarDadosComoJson(results));

  group('end-to-end test', () {
    testWidgets('Validação do título da pagina incial', (tester) async {
      results.add(TestResult(
        title: 'Validação do título da página inicial',
        approved: false,
      ));

      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Rick and Morty'), findsOneWidget);

      results.last.approved = true;
    });

    testWidgets('Validação da descrição', (tester) async {
      results.add(TestResult(
        title: 'Validação da descrição da página inicial',
        approved: false,
      ));

      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Procupero pelo seu personagem'), findsOneWidget);

      results.last.approved = true;
    });

    testWidgets('Validação do imput de pesquisa', (tester) async {
      results.add(TestResult(
        title: 'Validação do imput de pesquisa',
        approved: false,
      ));

      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('filterInput')), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);

      results.last.approved = true;
    });

    testWidgets('Validação da troca entre GridView e ListView', (tester) async {
      results.add(TestResult(
        title: 'Validação da troca entre GridView e ListView',
        approved: false,
      ));

      app.main();
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.grid_view), findsOneWidget);
      expect(find.byKey(const Key("listView")), findsOneWidget);
      await tester.tap(find.byIcon(Icons.grid_view));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.list), findsOneWidget);
      expect(find.byKey(const Key("gridView")), findsOneWidget);
      await tester.tap(find.byIcon(Icons.list));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.list), findsOneWidget);
      expect(find.byKey(const Key("listView")), findsOneWidget);

      results.last.approved = true;
    });

    testWidgets('Validação do card no ListView', (tester) async {
      results.add(TestResult(
        title: 'Validação das informações no card do ListView',
        approved: false,
      ));

      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('listCard')), findsWidgets);

      expect(find.byKey(const Key("imageListCard")), findsWidgets);
      expect(find.text('Rick Sanchez'), findsWidgets);
      expect(find.text('Alive - Human'), findsWidgets);
      expect(find.text('Male'), findsWidgets);
      expect(find.text('1'), findsWidgets);

      results.last.approved = true;
    });

    testWidgets('Validação do card no GrindView', (tester) async {
      results.add(TestResult(
        title: 'Validação das informações no card do GrindView',
        approved: false,
      ));

      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.grid_view));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('gridCard')), findsWidgets);
      expect(find.byKey(const Key("imageGridCard")), findsWidgets);
      expect(find.text('Rick Sanchez'), findsWidgets);
      expect(find.text('1'), findsWidgets);

      results.last.approved = true;
    });

    testWidgets('Validação da pesquisa por nome', (tester) async {
      results.add(TestResult(
        title: 'Validação da pesquisa pelo nome do personagens',
        approved: false,
      ));

      app.main();
      await tester.pumpAndSettle();

      // pesquisa o personagem pelo nome
      await tester.enterText(
        find.byKey(const Key('filterInput')),
        'Morty Smith',
      );
      await tester.pumpAndSettle();
      // await tester.pump();
      // await Future.delayed(Duration(seconds: 1));

      expect(find.byKey(const Key('imageCard')), findsWidgets);
      expect(find.text('Morty Smith'), findsWidgets);
      expect(find.text('Alive - Human'), findsWidgets);
      expect(find.text('Male'), findsWidgets);
      expect(find.text('2'), findsWidgets);

      // altera para visualizacao em grid
      await tester.tap(find.byIcon(Icons.grid_view));
      await tester.pumpAndSettle();

      expect(find.text('2'), findsWidgets);
      expect(find.text('Morty Smith'), findsWidgets);
      results.last.approved = true;
    });

    //   testWidgets('Validação da tela de detalhes', (tester) async {
    //     results.add(
    //         TestResult(title: 'Validação da tela de detalhes', approved: false));
    //     app.main();
    //     await tester.pumpAndSettle();

    //     expect(find.text('Rick Sanchez'), findsWidgets);
    //     await tester.tap(find.text('Rick Sanchez'));
    //     await tester.pumpAndSettle();
    //     expect(find.byKey(Key('imageDetails')), findsOneWidget);
    //     expect(find.text('RICK SANCHEZ | #1'), findsWidgets);
    //     expect(find.text('Alive'), findsWidgets);
    //     expect(find.text('Human'), findsWidgets);
    //     expect(find.text('Male'), findsWidgets);
    //     expect(find.text('Última localização conhecida: '), findsWidgets);
    //     expect(find.text('Local de origem: '), findsWidgets);
    //     expect(find.text('Earth (C-137)'), findsWidgets);
    //     await Future.delayed(Duration(seconds: 1));
    //     expect(find.text('Quantidades de vezes que apareceu: '), findsWidgets);

    //     results.last.approved = true;
    //   });

    //   testWidgets('Validação de retornar a tela inicial', (tester) async {
    //     results.add(TestResult(
    //         title: 'Validação de retornar a tela incial', approved: false));
    //     app.main();
    //     await tester.pumpAndSettle();

    //     expect(find.text('Rick Sanchez'), findsWidgets);
    //     await tester.tap(find.text('Rick Sanchez'));
    //     await tester.pumpAndSettle();
    //     expect(find.byKey(Key('imageDetails')), findsOneWidget);
    //     await tester.pageBack();
    //     await tester.pumpAndSettle();
    //     expect(find.text('Rick Sanchez'), findsWidgets);

    //     results.last.approved = true;
    //   });

    //   testWidgets('Validação de scroll', (tester) async {
    //     results.add(TestResult(title: 'Validação de scroll', approved: false));
    //     app.main();
    //     await tester.pumpAndSettle();

    //     expect(find.text('Rick Sanchez'), findsWidgets);
    //     await tester.drag(find.text('Rick Sanchez'), const Offset(0, -20000));
    //     await Future.delayed(Duration(seconds: 4));

    //     results.last.approved = true;
    //   });

    //   test('Validacao copywith do character', () {
    //     final Character character = Character(
    //         id: 0,
    //         name: "test01",
    //         status: "01",
    //         species: "01",
    //         gender: "01",
    //         image: "01");
    //     final Character newCharacter = character.copyWith(
    //         id: 1,
    //         name: "test02",
    //         status: "02",
    //         species: "02",
    //         gender: "02",
    //         image: "02");

    //     expect(character, isNot(equals(newCharacter)));
    //   });

    //   testWidgets('Validação de scroll e refresh', (tester) async {
    //     results.add(
    //         TestResult(title: 'Validação de scroll e refresh', approved: false));
    //     app.main();
    //     await tester.pumpAndSettle();

    //     expect(find.text('Rick Sanchez'), findsWidgets);
    //     await tester.drag(find.text('Rick Sanchez'), const Offset(0, -200000));
    //     await Future.delayed(Duration(seconds: 6));
    //     await tester.drag(find.text('Butter Robot'), const Offset(0, 200000));
    //     await Future.delayed(Duration(seconds: 6));

    //     results.last.approved = true;
    //   });
  });
}
