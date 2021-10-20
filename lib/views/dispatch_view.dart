import 'package:flutter/material.dart';
import 'package:kuda_lager/business_logic/business.exception.dart';
import 'package:kuda_lager/business_logic/order_controller.dart';
import 'package:provider/provider.dart';

import '../business_logic/dispatch_controller.dart';
import '../business_logic/packets_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';
import '../ui_widgets/waitingscreen.dart';

/// Widget representing Dispatch Screen
class DispatchView extends StatefulWidget {
  ///
  DispatchView({
    Key? key,
    required this.orderPositionID,
  }) : super(key: key);

  /// linked order
  final String orderPositionID;

  @override
  _DispatchViewState createState() => _DispatchViewState();
}

class _DispatchViewState extends State<DispatchView> {
  String? actualDispatchId;
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
    var dispatchController =
        Provider.of<DispatchController>(context, listen: false);
    dispatchController.addDispatch(widget.orderPositionID).then((dispatchId) {
      setState(() {
        actualDispatchId = dispatchId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (actualDispatchId == null) {
      return WaitingScreen();
    }
    return ScanListView(
      title: 'Auslieferung',
      color: Colors.amber[300]!,
      onScan: (barcode) async {
        var packet;
        var dispatchController =
            Provider.of<DispatchController>(context, listen: false);
        var packetsController =
            Provider.of<PacketsController>(context, listen: false);
        var orderController =
            Provider.of<OrderController>(context, listen: false);

        try {
          final dispatchPositionID =
              await dispatchController.addDispatchPosition(barcode,
                  actualDispatchId!, packetsController, orderController);

          final dispatchPosition =
              await dispatchController.getDispatchPosition(dispatchPositionID);

          final packetID = dispatchPosition.packet;

          packet = await packetsController.getPacketByUuid(packetID);
          setState(() {
            scanViewList.add(packet);
          });
        } on RecordNotFoundException {
          setState(() {
            buildAlert(
                    context, "Achtung!", "Der gescannte Barcode ist ungültig!")
                .show();
          });
        } on DispatchWrongProduct {
          setState(() {
            buildAlert(context, "Achtung!",
                    "Der gescannte Produkt gehört nicht zu dieser Position!")
                .show();
          });
        } on DispatchQuantityExceeded catch (e) {
          setState(() {
            String message;
            if (e.restQuantity == 0) {
              message = "Diese Position wurde bereits vollständig erfasst.";
            } else {
              //leave indentation as is, otherwise second and third lines
              //will be indented in the alert window
              message =
                  """Der gescannte Paket hat eine höhere Menge als erwartet!
Offene Menge: ${e.restQuantity}\n
Gescannte Menge: ${e.scannedQuantity}""";
            }
            buildAlert(context, "Achtung!", message).show();
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