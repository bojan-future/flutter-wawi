import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

/// Alert Popop when the scanned Barcode is invalid
Alert buildAlertInvalidBarcode(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.warning,
    title: "Achtung!",
    desc: "Der gescannte Barcode ist ungültig!",
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.blue,
        radius: BorderRadius.circular(8.0),
      ),
    ],
  );
}
