import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuda_lager/business_logic/auth_controller.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import 'business_logic/delivery_controller.dart';
import 'business_logic/packets_controller.dart';
import 'services/scanner_controller.dart';
import 'test_helpers/scannercontroller_mock.dart';
import 'ui_widgets/drawer.dart';
import 'ui_widgets/homepage_buttons.dart';
import 'views/delivery_view.dart';
import 'views/login_view.dart';

void main() {
  FlutterError.onError = FlutterError.dumpErrorToConsole;

  runApp(MultiProvider(
    providers: [
      Provider<AuthController>(
        create: (context) => AuthControllerImplDatabase(),
      ),
      Provider<PacketsController>(
        create: (context) => PacketsController(),
      ),
      Provider<DeliveryController>(
        create: (context) => DeliveryController(context),
      ),
      Provider<ScannerController>(
        // create: (context) => ScannerControllerImplDataWedge()
        // use this implementation in Emulator
        // Barcode Lengths: 34 / 44 / 36 / 20
        create: (context) => ScannerControllerImplMock([
          '9999912345',
          '1234567890123456789012345678901234',
          '12345678901234567890123456789012345678901234',
          '123456789012345678901234567890123456',
          '12345678901234567890'
        ]),
      )
    ],
    child: MyApp(),
  ));
}

/// Top App Widget
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuda Lager',
      theme: ThemeData(
        // Theme of the application.
        primarySwatch: Colors.blue,
        accentColor: Colors.amberAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(),
    );
  }
}

/// Home screen
class MyHomePage extends StatefulWidget {
  static const routeName = '/homepage';

  ///
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kuda Lager"),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButtonWidget(
                      icon: Mdi.dolly,
                      buttonLabel: "Anlieferung",
                      bottomSheetText: "",
                      title: "Anlieferung",
                      col: Colors.blue[300]!,
                      child: DeliveryView(),
                      onScanBottomSheet: null,
                    ),
                    SizedBox(height: 10),
                    TextButtonWidget(
                      icon: Mdi.truckDelivery,
                      buttonLabel: "Auslieferung",
                      bottomSheetText: "Auftrag Scannen",
                      title: "Auslieferung",
                      col: Colors.amber[300]!,
                      child: Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.amber[300]!,
                          title: Text('Auslieferung'),
                        ),
                        body: Center(child: Text('Coming soon...')),
                      ),
                      onScanBottomSheet: (barcode) {
                        return barcode.isNotEmpty;
                      },
                    ),
                    SizedBox(height: 10),
                    TextButtonWidget(
                      icon: Mdi.packageVariant,
                      buttonLabel: "Auspacken",
                      bottomSheetText: "Außenpaket Scannen",
                      title: "Caddies Scannen",
                      col: Colors.deepOrange[300]!,
                      child: Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.amber[300]!,
                          title: Text('Caddies Scannen'),
                        ),
                        body: Center(child: Text('Coming soon...')),
                      ),
                      onScanBottomSheet: (barcode) {
                        return barcode.isNotEmpty;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextButtonWidget(
                          icon: Mdi.hammerWrench,
                          buttonLabel: "Produktion\nStart",
                          bottomSheetText: "Produktionsauftrag Scannen",
                          title: "Produktion-Start",
                          col: Colors.lightGreen[300]!,
                          child: Scaffold(
                            appBar: AppBar(
                              backgroundColor: Colors.amber[300]!,
                              title: Text('Produktion-Start'),
                            ),
                            body: Center(child: Text('Coming soon...')),
                          ),
                          onScanBottomSheet: (barcode) {
                            return barcode.isNotEmpty;
                          },
                        ),
                        SizedBox(width: 10),
                        TextButtonWidget(
                          icon: Mdi.hammerWrench,
                          buttonLabel: "Produktion\nAbschluss",
                          bottomSheetText: "Produktionsauftrag Scannen",
                          title: "Produktion-Abschluss",
                          col: Colors.teal[300]!,
                          child: Scaffold(
                            appBar: AppBar(
                              backgroundColor: Colors.amber[300]!,
                              title: Text('Produktion-Abschluss'),
                            ),
                            body: Center(child: Text('Coming soon...')),
                          ),
                          onScanBottomSheet: (barcode) {
                            return barcode.isNotEmpty;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
