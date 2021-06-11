import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/dispatch_controller.dart';
import '../business_logic/packets_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';

/// Widget representing Dispatch Screen
class DispatchView extends StatefulWidget {
  DispatchView({
    Key? key,
    required this.orderID,
  }) : super(key: key);

  final int orderID;

  @override
  _DispatchViewState createState() => _DispatchViewState();
}

class _DispatchViewState extends State<DispatchView> {
  int actualDispatchId = 0;
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
    var dispatchController =
        Provider.of<DispatchController>(context, listen: false);
    dispatchController.addDispatch(widget.orderID).then((dispatchId) {
      actualDispatchId = dispatchId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScanListView(
      title: 'Auslieferung',
      color: Colors.amber[300]!,
      onScan: (barcode) async {
        var packet;
        var dispatchController =
            Provider.of<DispatchController>(context, listen: false);
        var packetsController =
            Provider.of<PacketsController>(context, listen: false);

        var dispatchPositionID = await dispatchController.addDispatchPosition(
            barcode, actualDispatchId);

        if (dispatchPositionID == -1) {
          setState(() {
            buildAlertInvalidBarcode(
                    context, "Der gescannte Barcode ist ungültig!")
                .show();
          });
        } else {
          var dispatchPosition =
              await dispatchController.getDispatchPosition(dispatchPositionID);

          var packetID = dispatchPosition.packet;

          packet = await packetsController.getPacketWithId(packetID);
          setState(() {
            scanViewList.add(packet);
          });
        }
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
      },
    );
  }
}
