import 'package:flutter/material.dart';
import 'package:kuda_lager/ui_widgets/scan_popup.dart';

/// MaterialApp Wrap for the tested widget
class ScanPopupTestWidgetWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: ScanPopupTestWidget(),
        ),
      ),
    );
  }
}

///
class ScanPopupTestWidget extends StatefulWidget {
  @override
  _ScanPopupTestWidgetState createState() => _ScanPopupTestWidgetState();
}

class _ScanPopupTestWidgetState extends State<ScanPopupTestWidget> {
  String testoutput = 'PopupTest';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(testoutput),
        ElevatedButton(
            onPressed: () {
              scanPopup(
                  title: 'Title',
                  popupText: 'PopupText',
                  scanCallback: (barcode) {
                    setState(() {
                      testoutput = barcode;
                    });
                  },
                  context: context);
            },
            child: Text('Press here')),
      ],
    ));
  }
}
