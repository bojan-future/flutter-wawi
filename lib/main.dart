import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import 'business_logic/packets_controller.dart';
import 'services/scanner_controller.dart';
import 'test_helpers/scannercontroller_mock.dart';
import 'ui_widgets/drawer.dart';
import 'ui_widgets/homepage_buttons.dart';

void main() {
  FlutterError.onError = FlutterError.dumpErrorToConsole;

  runApp(MultiProvider(
    providers: [
      Provider<PacketsController>(
        create: (context) => PacketsController(),
      ),
      Provider<ScannerController>(
        //create: (context) => ScannerControllerImplDataWedge()
        //use this implementation in Emulator
        create: (context) =>
            ScannerControllerImplMock(['123456789', '987654321', 'text']),
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
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Icon, Buttonlabel, Bottomsheet Text, Title, Color, Wrap
                    TextButtonWidget(Mdi.dolly, "Anlieferung", "",
                        "Anlieferung", Colors.blue[300]!),
                    SizedBox(height: 10),
                    TextButtonWidget(Mdi.truckDelivery, "Auslieferung",
                        "Auftrag Scannen", "Auslieferung", Colors.amber[300]!),
                    SizedBox(height: 10),
                    TextButtonWidget(
                        Mdi.packageVariant,
                        "Auspacken",
                        "Außenpaket Scannen",
                        "Caddies Scannen",
                        Colors.deepOrange[300]!),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextButtonWidget(
                            Mdi.hammerWrench,
                            "Produktion\nStart",
                            "Produktionsauftrag Scannen",
                            "Produktion-Start",
                            Colors.lightGreen[300]!),
                        SizedBox(width: 10),
                        TextButtonWidget(
                            Mdi.check,
                            "Produktion\nAbschluss",
                            "Produktionsauftrag Scannen",
                            "Produktion-Abschluss",
                            Colors.teal[300]!),
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

// ignore: public_member_api_docs
class Delivery extends StatefulWidget {
  // ignore: public_member_api_docs
  Delivery({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final List<String> _scanList = <String>[];
  final ScrollController _scrollController = ScrollController();

  void addItemToList() {
    setState(() {
      final nextItemNumber = _scanList.length + 1;
      _scanList.add("Artikel $nextItemNumber");
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(
          widget.title,
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: addItemToList,
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.black,
            ),
            child: Icon(Mdi.barcodeScan),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: _scanList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text((index + 1).toString()),
                  title: Text(_scanList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
