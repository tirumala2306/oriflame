import 'package:flutter_test/flutter_test.dart';
import 'package:oriflame/app/app.dart';

void main() {
  testWidgets('App boots with intro route', (tester) async {
    await tester.pumpWidget(const OriflameApp());
    await tester.pump();

    expect(find.byType(OriflameApp), findsOneWidget);
  });
}
