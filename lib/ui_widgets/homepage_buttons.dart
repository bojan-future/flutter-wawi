import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui_widgets/scan_popup.dart';

/// Widget representing the buttons on the homepage
class TextButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String buttonLabel;
  final String? bottomSheetText;
  final String title;
  final Color col;
  final Widget child;
  final bool Function(String)? onScanBottomSheet;

  /// required parameters when calling TextButtonWIdget
  const TextButtonWidget(
      {required this.icon,
      required this.buttonLabel,
      required this.bottomSheetText,
      required this.title,
      required this.col,
      required this.child,
      required this.onScanBottomSheet});

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
            Navigator.push(
              context,
              buildCupertinoPageRoute(),
            );
          } else {
            scanPopup(
                popupText: bottomSheetText!,
                title: title,
                popupColor: col,
                scanCallback: (barcode) {
                  var openListDialog = onScanBottomSheet!(barcode);
                  if (openListDialog) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      buildCupertinoPageRoute(),
                    );
                  }
                },
                context: context);
          }
        },
      ),
    );
  }

  /// iOS transition to child widget
  CupertinoPageRoute buildCupertinoPageRoute() {
    return CupertinoPageRoute(
      builder: (context) {
        return child;
      },
    );
  }
}
