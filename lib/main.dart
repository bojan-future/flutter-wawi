import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuda_lager/business_logic/packets_controller.dart';
import 'package:kuda_lager/views/scanview.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';

void main() {
  FlutterError.onError = FlutterError.dumpErrorToConsole;

  runApp(MultiProvider(
    providers: [
      Provider<PacketsController>(
        create: (context) => PacketsController(),
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
      home: MyHomePage(title: 'Kuda Lager'),
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
  //temp: this list is only used to demonstrate use of ScanView
  final List<String> _testScanViewList = <String>[];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Kuda Lager Demo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Mdi.buffer),
              title: Text('Inventur'),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Historie'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mitarbeiter'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Einstellungen'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Abmelden'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextButton.icon(
                  icon: Icon(Mdi.dolly, size: 48),
                  label: Text("Anlieferung", style: TextStyle(fontSize: 24)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) {
                        return StatefulBuilder(
                          //todo: maybe it is not necesary to use StatefulBuilder, if list variable is inside new page
                          builder: (context, setInnerState) => ScanView(
                            title: "Anlieferung",
                            color: (Colors.blue[300])!,
                            onScan: (barcode) {
                              setState(() {
                                _testScanViewList.add(barcode);
                                setInnerState(() {});
                              });
                            },
                            itemCount: _testScanViewList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text((index + 1).toString()),
                                title: Text(_testScanViewList[index]),
                              );
                            },
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: TextButton.icon(
                  icon: Icon(Mdi.truckDelivery, size: 48),
                  label: Text("Auslieferung", style: TextStyle(fontSize: 24)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          color: Colors.amber[300],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Auftrag Scannen'),
                                ElevatedButton(
                                  child: const Icon(Mdi.barcodeScan),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ).then((value) => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Delivery(
                                    title: "Auslieferung",
                                    color: (Colors.amber[300])!,
                                  )),
                        ));
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: TextButton.icon(
                  icon: Icon(
                    Mdi.packageVariant,
                    size: 48,
                  ),
                  label: Text("Auspacken", style: TextStyle(fontSize: 24)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          color: Colors.deepOrange[300],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Außenpaket Scannen'),
                                ElevatedButton(
                                  child: const Icon(Mdi.barcodeScan),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ).then((value) => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Delivery(
                                    title: "Caddies Scannen",
                                    color: (Colors.deepOrange[300])!,
                                  )),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Delivery extends StatefulWidget {
  Delivery({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final List<String> _scanList = <String>[];
  ScrollController _scrollController = new ScrollController();

  void addItemToList() {
    setState(() {
      final int nextItemNumber = _scanList.length + 1;
      _scanList.add("Artikel " + nextItemNumber.toString());
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              addItemToList();
            },
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
