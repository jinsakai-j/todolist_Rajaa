import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

void main() {
  testWidgets('TodoApp displays welcome text and todo items', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('103022400116 - Rajaa'), findsOneWidget);
    expect(find.text('Welcome,'), findsOneWidget);
    expect(find.text('Tugas Praktikum Modul 5'), findsOneWidget);
  });
}
