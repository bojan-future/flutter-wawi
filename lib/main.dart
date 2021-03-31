import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kuda_lager/business_logic/models/order_model.dart';
import 'package:kuda_lager/business_logic/models/packet_model.dart';
import 'package:kuda_lager/business_logic/models/product_model.dart';
import 'package:kuda_lager/business_logic/models/production_model.dart';

import 'package:mdi/mdi.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:kuda_lager/business_logic/controllers/order_controller.dart';
import 'package:kuda_lager/business_logic/controllers/packet_controller.dart';
import 'package:kuda_lager/business_logic/controllers/product_controller.dart';
import 'package:kuda_lager/business_logic/controllers/production_controller.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  await PacketController.init();
  await ProductController.init();
  await OrderController.init();
  await ProductionController.init();
}

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  await initHive();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) =>
            PacketController(Hive.box<Packet>(PacketController.boxName))),
    ChangeNotifierProvider(
        create: (context) =>
            ProductController(Hive.box<Product>(ProductController.boxName))),
    ChangeNotifierProvider(
        create: (context) =>
            OrderController(Hive.box<Order>(OrderController.boxName))),
    ChangeNotifierProvider(
        create: (context) => ProductionController(
            Hive.box<Production>(ProductionController.boxName))),
  ], child: MyApp()));
}

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: FlatButton.icon(
                  icon: Icon(Mdi.dolly, size: 48),
                  label: Text("Anlieferung", style: TextStyle(fontSize: 24)),
                  color: Colors.blue[300],
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => Delivery(
                                title: "Anlieferung",
                                color: Colors.blue[300],
                              )),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: FlatButton.icon(
                  icon: Icon(Mdi.truckDelivery, size: 48),
                  label: Text("Auslieferung", style: TextStyle(fontSize: 24)),
                  color: Colors.amber[300],
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
                                    color: Colors.amber[300],
                                  )),
                        ));
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: FlatButton.icon(
                  icon: Icon(
                    Mdi.packageVariant,
                    size: 48,
                  ),
                  label: Text("Auspacken", style: TextStyle(fontSize: 24)),
                  color: Colors.deepOrange[300],
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
                                    color: Colors.deepOrange[300],
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
  Delivery({Key key, this.title, this.color}) : super(key: key);

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
          RaisedButton(
            onPressed: () {
              addItemToList();
            },
            color: Colors.amber,
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
