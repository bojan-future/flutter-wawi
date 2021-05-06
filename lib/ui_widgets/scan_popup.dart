import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import '../services/scanner_controller.dart';

// ignore: public_member_api_docs
void scanPopup(
    {required String popupText,
    required String title,
    Color popupColor = Colors.amber,
    required void Function(String) scanCallback,
    required BuildContext context}
    ) {
  showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        var scanner = Provider.of<ScannerController>(context);
        scanner.registerCallback(scanCallback);

        return Container(
          height: 200,
          color: popupColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  popupText,
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTapDown: (tapDownDetails) {
                    scanner.startScan();
                  },
                  onTapUp: (tapUpDetails) {
                    scanner.stopScan();
                  },
                  child: Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Icon(Mdi.barcodeScan,
                            color: Colors.white, size: 40),
                      )),
                ),
              ],
            ),
          ),
        );
      });
}
