import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../main.dart';
import '../ui_widgets/scan_popup.dart';

// ignore_for_file: public_member_api_docs

class TextButtonWidget extends StatelessWidget {
  final IconData icon;
  final String buttonLabel;
  final String? bottomSheetText;
  final String title;
  final Color col;
  final bool Function(String)? onScanBottomSheet;

  const TextButtonWidget(this.icon, this.buttonLabel, this.bottomSheetText,
      this.title, this.col, this.onScanBottomSheet);

  void openListView(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => Delivery(
                title: title,
                color: col,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            Text(
              buttonLabel,
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        style: TextButton.styleFrom(
          backgroundColor: col,
          primary: Colors.black,
        ),
        onPressed: () {
          if (bottomSheetText == null || onScanBottomSheet == null) {
            openListView(context);
          } else {
            scanPopup(
                popupText: bottomSheetText!,
                title: title,
                popupColor: col,
                scanCallback: (barcode) {
                  var openListDialog = onScanBottomSheet!(barcode);
                  if (openListDialog) {
                    Navigator.pop(context);
                    openListView(context);
                  }
                },
                context: context);
          }
        },
      ),
    );
  }
}
