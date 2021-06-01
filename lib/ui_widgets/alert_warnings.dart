import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

/// Alert Popop when the scanned Barcode is invalid
Alert buildAlertInvalidBarcode(BuildContext context, String errorMessage) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: "Achtung!",
    desc: errorMessage,
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.blue,
        radius: BorderRadius.circular(0.0),
      ),
    ],
  );
}
