import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuda_lager/services/scanner_controller.dart';
import 'package:provider/provider.dart';

import 'package:kuda_lager/test_helpers/scanlistview_testwidget.dart';
import 'package:kuda_lager/test_helpers/scannercontroller_mock.dart';

void main() {
  testWidgets('ScanListView Buildup', (tester) async {
    await tester.pumpWidget(
      Provider<ScannerController>(
        create: (context) => ScannerControllerImplMock(['123456789']),
        child: ScanListViewTestWidgetWrap(),
      ),
    );

    expect(find.text('TestScanListView'), findsOneWidget);
  });

  testWidgets('ScanListView ScanOne', (tester) async {
    await tester.pumpWidget(
      Provider<ScannerController>(
        create: (context) => ScannerControllerImplMock(['123456789']),
        child: ScanListViewTestWidgetWrap(),
      ),
    );

    expect(find.text('TestScanListView'), findsOneWidget);
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('123456789'), findsOneWidget);
  });
}
