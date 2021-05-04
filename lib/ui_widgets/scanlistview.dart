import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import '../services/scanner_controller.dart';

/// ListView with built in scan functionality
class ScanListView extends StatefulWidget {
  ///
  ScanListView({
    Key? key,
    required this.title,
    this.color = Colors.blue,
    required this.onScan,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  final String title;
  final Color color;
  final void Function(String) onScan;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  _ScanListViewState createState() => _ScanListViewState(onScan);
}

class _ScanListViewState extends State<ScanListView> {
  final ScrollController _scrollController = ScrollController();
  final void Function(String) _scanCallback;

  _ScanListViewState(this._scanCallback);
  void onScan(String barcode) {
    setState(() {
      _scanCallback(barcode);
    });
  }

  @override
  Widget build(BuildContext context) {
    var scanner = Provider.of<ScannerController>(context);
    scanner.registerCallback(onScan);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          GestureDetector(
            // When the child is tapped, show a snackbar.
            onTapDown: (tapDownDetails) {
              //startScan();
              scanner.startScan();
              setState(() {});
            },
            onTapUp: (tapUpDetails) {
              scanner.stopScan();
            },
            child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Icon(Mdi.barcodeScan),
                )),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
