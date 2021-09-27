import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuda_lager/business_logic/auth_controller.dart';
import 'package:kuda_lager/services/scanner_controller.dart';
import 'package:kuda_lager/test_helpers/authcontroller_mock.dart';
import 'package:kuda_lager/test_helpers/login_view_testwidget.dart';
import 'package:kuda_lager/test_helpers/scannercontroller_mock.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

///  /!\ For testing: use "flutter test --no-test-assets" /!\
/// Flutter cant access the image assets in other packages during widget testing

void main() {
  /// test for elements on login screen
  testWidgets('LoginView Buildup', (tester) async {
    await pumpWidgetLoginView(tester, '');

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Mitarbeiternummer'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Mdi.barcodeScan), findsOneWidget);
    expect(find.byIcon(Icons.done), findsOneWidget);
  });

  /// test for successful login with barcode
  testWidgets('LoginView Barcode Successful', (tester) async {
    await pumpWidgetLoginView(tester, '9999912345');

    await tester.tap(find.byIcon(Mdi.barcodeScan));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Kuda Lager'), findsOneWidget);
  });

  /// test for unsuccessful login with barcode
  testWidgets('LoginView Barcode Unsuccessful', (tester) async {
    await pumpWidgetLoginView(tester, '1234512345');

    await tester.tap(find.byIcon(Mdi.barcodeScan));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Kuda Lager'), findsNothing);
  });

  /// test for successful login with usernumber
  testWidgets('LoginView Usernumber Successful', (tester) async {
    await pumpWidgetLoginView(tester, '');

    await tester.enterText(find.byType(TextField), '12345');
    await tester.tap(find.byIcon(Icons.done));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Kuda Lager'), findsOneWidget);
  });

  /// test for unsuccessful login with usernumber
  testWidgets('LoginView Usernumber Unsuccessful', (tester) async {
    await pumpWidgetLoginView(tester, '');

    await tester.enterText(find.byType(TextField), '1234512345');
    await tester.tap(find.byIcon(Icons.done));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Kuda Lager'), findsNothing);
  });
}

Future pumpWidgetLoginView(WidgetTester tester, String barcode) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        Provider<AuthController>(
          create: (context) => AuthControllerImplMock(['', barcode]),
        ),
        Provider<ScannerController>(
          create: (context) => ScannerControllerImplMock([barcode]),
        )
      ],
      child: LoginViewTestWidgetWrap(),
    ),
  );
}
