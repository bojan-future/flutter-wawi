import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../main.dart';

// ignore_for_file: public_member_api_docs

class TextButtonWidget extends StatelessWidget {
  final IconData icon;
  final String buttonLabel;
  final String bottomSheetText;
  final String title;
  final Color col;

  const TextButtonWidget(
      this.icon, this.buttonLabel, this.bottomSheetText, this.title, this.col);

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
              CupertinoPageRoute(
                  builder: (context) => Delivery(
                        title: title,
                        color: col,
                      )),
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
                  CupertinoPageRoute(
                      builder: (context) => Delivery(
                            title: title,
                            color: (Colors.amber[300])!,
                          )),
                ));
          }
        },
      ),
    );
  }
}
