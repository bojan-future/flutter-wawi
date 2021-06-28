import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuda_lager/services/synchro_controller.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import 'business_logic/auth_controller.dart';
import 'business_logic/delivery_controller.dart';
import 'business_logic/dispatch_controller.dart';
import 'business_logic/file_controller.dart';
import 'business_logic/inventory_controller.dart';
import 'business_logic/order_controller.dart';
import 'business_logic/packets_controller.dart';
import 'business_logic/production_controller.dart';
import 'business_logic/scan_bottom_sheet_result.dart';
import 'services/scanner_controller.dart';
import 'test_helpers/scannercontroller_mock.dart';
import 'ui_widgets/alert_warnings.dart';
import 'ui_widgets/drawer.dart';
import 'ui_widgets/homepage_buttons.dart';
import 'views/deliveries_for_images_view.dart';
import 'views/delivery_view.dart';
import 'views/dispatch_view.dart';
import 'views/login_view.dart';
import 'views/production_completion_view.dart';
import 'views/production_start_view.dart';

void main() {
  FlutterError.onError = FlutterError.dumpErrorToConsole;
  WidgetsFlutterBinding.ensureInitialized();

  final synchroController = SynchroController();
  synchroController.synchronize(); //synchronize once at the start
  //start scheduler
  synchroController.initSchedule();

  /// blocks rotation; sets orientation to: portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
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
        Provider<DispatchController>(
          create: (context) => DispatchController(),
        ),
        Provider<OrderController>(
          create: (context) => OrderController(),
        ),
        Provider<ProductionController>(
          create: (context) => ProductionController(),
        ),
        Provider<InventoryController>(
          create: (context) => InventoryController(),
        ),
        Provider<FileController>(
          create: (context) => FileController(),
        ),
        Provider<ScannerController>(
          //create: (context) => ScannerControllerImplDataWedge()
          // use this implementation in Emulator
          // Barcode Lengths: 34 / 44 / 36 / 20
          create: (context) => ScannerControllerImplMock([
            '9999912345',
            '147258369',
            '1111222233334444555566667777888899',
            '9999888877776666555544443333222211',
            '9999666633338888555522227777444411',
            '12345678901234567890123456789012345678901234',
            '2222555588883333666699997777444411',
            '12345678901234567890'
          ]),
        ),
        Provider<SynchroController>(create: (context) {
          final synchroController = SynchroController();
          synchroController.synchronize(); //synchronize once at the start
          //start scheduler
          synchroController.initSchedule();
          return synchroController;
        })
      ],
      child: MyApp(),
    ));
  });
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
  ///
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
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        foregroundColor: Colors.black,
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Row(
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
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      child: TextButtonWidget(
                        icon: Mdi.camera,
                        buttonLabel: "Foto",
                        bottomSheetText: "",
                        title: "Fotos",
                        col: Colors.red[400]!,
                        child: DeliveriesForImagesView(),
                        onScanBottomSheet: null,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              TextButtonWidget(
                icon: Mdi.truckDelivery,
                buttonLabel: "Auslieferung",
                bottomSheetText: "Auftrag Scannen",
                title: "Auslieferung",
                col: Colors.amber[300]!,
                builder: (parentId) {
                  return DispatchView(orderID: parentId);
                },
                onScanBottomSheet: (barcode) async {
                  var dispatchController =
                      Provider.of<DispatchController>(context, listen: false);

                  var orderController =
                      Provider.of<OrderController>(context, listen: false);

                  return dispatchController
                      .onScanBarcode(barcode, orderController)
                      .catchError((error, stackTrace) {
                    buildAlert(
                            context,
                            "Achtung!",
                            // ignore: lines_longer_than_80_chars
                            "Der gescannte Auftrag konnte nicht gefunden werden!")
                        .show();
                    return ScanBottomSheetResult(false, 0);
                  });
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
                onScanBottomSheet: (barcode) async {
                  return ScanBottomSheetResult(barcode.isNotEmpty, 0);
                },
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    TextButtonWidget(
                      icon: Mdi.hammerWrench,
                      buttonLabel: "Produktion\nStart",
                      bottomSheetText: "Produktionsauftrag Scannen",
                      title: "Produktion-Start",
                      col: Colors.lightGreen[300]!,
                      builder: (parentId) {
                        return ProductionStartView(productionID: parentId);
                      },
                      onScanBottomSheet: (barcode) async {
                        var productionController =
                            Provider.of<ProductionController>(context,
                                listen: false);

                        return productionController
                            .onScanProdBarcode(barcode)
                            .catchError((error, stackTrace) {
                          buildAlert(
                                  context,
                                  "Achtung!",
                                  // ignore: lines_longer_than_80_chars
                                  "Der gescannte Produktionsauftrag konnte nicht gefunden werden!")
                              .show();
                          return ScanBottomSheetResult(false, 0);
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    TextButtonWidget(
                      icon: Mdi.hammerWrench,
                      buttonLabel: "Produktion\nAbschluss",
                      bottomSheetText: "Produktionsauftrag Scannen",
                      title: "Produktion-Abschluss",
                      col: Colors.teal[300]!,
                      builder: (parentId) {
                        return ProductionCompletionView(productionID: parentId);
                      },
                      onScanBottomSheet: (barcode) async {
                        var productionController =
                            Provider.of<ProductionController>(context,
                                listen: false);

                        return productionController
                            .onScanProdBarcode(barcode)
                            .catchError((error, stackTrace) {
                          buildAlert(
                                  context,
                                  "Achtung!",
                                  // ignore: lines_longer_than_80_chars
                                  "Der gescannte Produktionsauftrag konnte nicht gefunden werden!")
                              .show();
                          return ScanBottomSheetResult(false, 0);
                        });
                      },
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
