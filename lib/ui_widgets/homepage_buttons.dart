import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

/// Widget representing the buttons on the homepage
class TextButtonWidget extends StatelessWidget {

  final IconData? icon;
  final String buttonLabel;
  final String bottomSheetText;
  final String title;
  final Color col;
  final Widget child;

  const TextButtonWidget(
      {required this.icon,
      required this.buttonLabel,
      required this.bottomSheetText,
      required this.title,
      required this.col,
      required this.child});

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
          if (bottomSheetText.isEmpty) {
            Navigator.push(
              context,
              buildCupertinoPageRoute(),
            );
          } else {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  color: col,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(bottomSheetText),
                        ElevatedButton(
                          child: const Icon(Mdi.barcodeScan),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            ).then((value) => Navigator.push(
                  context,
                  buildCupertinoPageRoute(),
                ));
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
