import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuda_lager/services/scanner_controller.dart';
import 'package:kuda_lager/test_helpers/scannercontroller_mock.dart';
import 'package:kuda_lager/test_helpers/scanpopup_testwidget.dart';
import 'package:mdi/mdi.dart';

import 'package:provider/provider.dart';

void main() {
  testWidgets('ScanListView ScanOne', (tester) async {
    await tester.pumpWidget(
      Provider<ScannerController>(
        create: (context) => ScannerControllerImplMock(['123456789']),
        child: ScanPopupTestWidgetWrap(),
      ),
    );

    expect(find.text('PopupTest'), findsOneWidget);
    await tester.tap(find.text('Press here'));
    await tester.pump();
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Mdi.barcodeScan));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('123456789'), findsOneWidget);
  });
}
