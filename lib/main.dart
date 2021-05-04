import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import 'business_logic/delivery_controller.dart';
import 'business_logic/packets_controller.dart';
import 'database/database.dart';
import 'services/scanner_controller.dart';
import 'test_helpers/scannercontroller_mock.dart';
import 'ui_widgets/drawer.dart';
import 'ui_widgets/homepage_buttons.dart';
import 'views/delivery_view.dart';
import 'views/scanlistview.dart';

void main() {
  FlutterError.onError = FlutterError.dumpErrorToConsole;

  runApp(MultiProvider(
    providers: [
      Provider<PacketsController>(
        create: (context) => PacketsController(),
      ),
      Provider<DeliveryController>(
        create: (context) => DeliveryController(),
      ),
      Provider<ScannerController>(
        //create: (context) => ScannerControllerImplDataWedge()
        //use this implementation in Emulator
        create: (context) => ScannerControllerImplMock([
          '1234567890123456789012345678901234',
          '12345678901234567890123456789012345678901234',
          '123456789012345678901234567890123456'
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        accentColor: Colors.amberAccent,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Test'),
    );
  }
}

/// Home screen
class MyHomePage extends StatefulWidget {
  ///
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  /// title is displayed on the top of the screen
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    //     // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
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
                  ),
                  SizedBox(height: 10),
                  TextButtonWidget(
                    icon: Mdi.packageVariant,
                    buttonLabel: "Auspacken",
                    bottomSheetText: "Außenpaket Scannen",
                    title: "Caddies Scannen",
                    col: Colors.deepOrange[300]!,
                    child: ScanListView(
                      title: 'Auspacken',
                      onScan: (barcode) {},
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ListTile();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
