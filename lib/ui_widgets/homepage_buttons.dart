import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuda_lager/business_logic/scanBottomSheetResult.dart';

import '../ui_widgets/scan_popup.dart';

/// Widget representing the buttons on the homepage
class TextButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String buttonLabel;
  final String? bottomSheetText;
  final String title;
  final Color col;
  final Widget? child;
  final Widget Function(int)? builder;
  final Future<ScanBottomSheetResult> Function(String)? onScanBottomSheet;

  const TextButtonWidget(
      {required this.icon,
      required this.buttonLabel,
      required this.bottomSheetText,
      required this.title,
      required this.col,
      this.child,
      this.builder,
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
              buildCupertinoPageRoute(0), //Create page without id
            );
          } else {
            scanPopup(
                popupText: bottomSheetText!,
                title: title,
                popupColor: col,
                scanCallback: (barcode) async {
                  onScanBottomSheet!(barcode).then((scanResult) {
                    print(scanResult.success);
                    if (scanResult.success == true) {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        buildCupertinoPageRoute(
                            scanResult.parentID), //Create page with scanned id
                      );
                    }
                  });
                },
                context: context);
          }
        },
      ),
    );
  }

  /// iOS transition to child widget
  CupertinoPageRoute buildCupertinoPageRoute(int parentID) {
    return CupertinoPageRoute(
      builder: (context) {
        if (builder != null) {
          return builder!(parentID);
        } else {
          return child!;
        }
      },
    );
  }
}
