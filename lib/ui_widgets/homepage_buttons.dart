import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../business_logic/scan_bottom_sheet_result.dart';

import '../ui_widgets/scan_popup.dart';

/// Widget representing the buttons on the homepage
class TextButtonWidget extends StatelessWidget {
  /// icon that is displayed on the button
  final IconData? icon;

  /// text that is displayed on the button
  final String buttonLabel;

  /// text that is displayed on the bottomSheet for scanning
  final String? bottomSheetText;

  /// title of the page that is being opened with this button
  final String title;

  /// color of the button
  final Color col;

  /// next page can directly be coded and shown here instead of a seperate view
  final Widget? child;

  /// view of the next page
  final Widget Function(int)? builder;

  /// defines what happens if something was scanned in the bottom sheet
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
