import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import '../services/scanner_controller.dart';

/// ListView with built in scan functionality
class ScanListView extends StatefulWidget {
  ///
  ScanListView({
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
  _ScanListViewState createState() => _ScanListViewState(_onScan);
}

class _ScanListViewState extends State<ScanListView> {
  final ScrollController _scrollController = ScrollController();
  final void Function(String) _scanCallback;

  _ScanListViewState(this._scanCallback) {
    var scanner = Provider.of<ScannerController>(context, listen: false);
    scanner.registerCallback(_scanCallback);
  }

  @override
  void dispose() {
    var scanner = Provider.of<ScannerController>(context, listen: false);
    scanner.unregisterCallback(_scanCallback);
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
              var scanner =
                  Provider.of<ScannerController>(context, listen: false);
              scanner.startScan();
            },
            onTapUp: (tapUpDetails) {
              var scanner =
                  Provider.of<ScannerController>(context, listen: false);
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
              itemCount: widget._itemCount,
              itemBuilder: widget._itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
