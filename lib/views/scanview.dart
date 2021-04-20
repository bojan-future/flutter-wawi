import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../services/scanner_controller.dart';

class ScanView extends StatefulWidget {
  ScanView({
    Key? key,
    required String title,
    Color color = Colors.blue,
    required void Function(String) onScan,
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
  })   : _title = title,
        _color = color,
        _onScan = onScan,
        _itemCount = itemCount,
        _itemBuilder = itemBuilder,
        super(key: key);

  final String _title;
  final Color _color;
  final void Function(String) _onScan;
  final int _itemCount;
  final IndexedWidgetBuilder _itemBuilder;

  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  final ScrollController _scrollController = ScrollController();
  final ScannerController _scanner = ScannerController();

  _ScanViewState() {
    _scanner.registerCallback(widget._onScan);
  }

  @override
  void dispose() {
    _scanner.unregisterCallback(widget._onScan);
    super.dispose();
  }

  void onScan(String barcode) {
    setState(() {
      widget._onScan(barcode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget._color,
        title: Text(widget._title),
      ),
      body: Column(
        children: [
          GestureDetector(
            // When the child is tapped, show a snackbar.
            onTapDown: (tapDownDetails) {
              //startScan();
              _scanner.startScan();
            },
            onTapUp: (tapUpDetails) {
              _scanner.stopScan();
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
              itemCount: widget._itemCount,
              itemBuilder: widget._itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
