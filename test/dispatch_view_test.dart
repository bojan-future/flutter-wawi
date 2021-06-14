import 'package:flutter_test/flutter_test.dart';
import 'package:mdi/mdi.dart';
import 'package:kuda_lager/main.dart';

void main() {
  testWidgets('DispatchView Scan Order', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byIcon(Mdi.truckDelivery));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Auftrag Scannen'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Mdi.barcodeScan));
    await tester.pumpAndSettle();

    expect(find.text('der gescannte Auftrag konnte nicht gefunden werden!'),
        findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Auftrag Scannen'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Mdi.barcodeScan));
    await tester.pumpAndSettle();

    expect(find.text('der gescannte Auftrag konnte nicht gefunden werden!'),
        findsOneWidget);
    await tester.tap(find.text('OK'));

    await tester.tap(find.text('Auftrag Scannen'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Mdi.barcodeScan));
    await tester.pumpAndSettle();

    expect(find.text("Auslieferung"), findsOneWidget);
  });
}
