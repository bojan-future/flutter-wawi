import 'package:flutter/material.dart';
import 'package:kuda_lager/views/scanlistview.dart';

class ScanListViewTestWidgetWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          //child: ScanListViewTestWidget(),
          child: Text('TestScanListView'),
        ),
      ),
    );
  }
}

class ScanListViewTestWidget extends StatefulWidget {
  @override
  _ScanListViewTestWidgetState createState() => _ScanListViewTestWidgetState();
}

class _ScanListViewTestWidgetState extends State<ScanListViewTestWidget> {
  @override
  Widget build(BuildContext context) {
    var _testScanViewList = <String>[];

    return Container(
      child: ScanListView(
          title: "TestScanListView",
          color: (Colors.blue[300])!,
          onScan: (barcode) {
            setState(() {
              _testScanViewList.add(barcode);
            });
          },
          itemCount: _testScanViewList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text((index + 1).toString()),
              title: Text(_testScanViewList[index]),
            );
          }),
    );
  }
}
