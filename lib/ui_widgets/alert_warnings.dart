import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

/// Alert Popop when the scanned Barcode is invalid
Alert buildAlert(BuildContext context, String title, String desc) {
  return Alert(
    context: context,
    type: AlertType.warning,
    title: title,
    desc: desc,
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
