import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/packets_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';

/// Unwrapping packets screen
class UnwrapView extends StatefulWidget {
  /// id of the "parrent" packet
  final int wrappingId;

  ///
  const UnwrapView({Key? key, required this.wrappingId}) : super(key: key);

  @override
  _UnwrapViewState createState() => _UnwrapViewState();
}

class _UnwrapViewState extends State<UnwrapView> {
  List<Packet> scanViewList = [];

  @override
  Widget build(BuildContext context) {
    return ScanListView(
        title: "Auspacken",
        color: Colors.deepOrange[300]!,
        onScan: (barcode) async {
          var packetsController =
              Provider.of<PacketsController>(context, listen: false);

          packetsController
              .addPacket(barcode, wrapping: widget.wrappingId)
              .then(
            (subpacketId) async {
              var packet = await packetsController.getPacketWithId(subpacketId);
              setState(() {
                scanViewList.insert(0, packet);
              });
            },
            onError: (e) => _showAlert(context),
          ).catchError((e) {
            _showAlert(context);
            return null;
          });
        },
        itemCount: scanViewList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("Name: ${scanViewList[index].productName}\n"),
              subtitle: Text("Product Nr: ${scanViewList[index].productNr}\n"
                  "Trace: ${scanViewList[index].lot}\n"
                  "Quantity: ${scanViewList[index].quantity} "),
            ),
          );
        });
  }

  void _showAlert(BuildContext context) {
    setState(() {
      buildAlert(context, "Achtung!", "Der gescannte Barcode ist ungültig!")
          .show();
    });
  }
}
