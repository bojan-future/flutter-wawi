import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/business.exception.dart';
import '../business_logic/inventory_controller.dart';
import '../business_logic/packets_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';
import '../ui_widgets/waitingscreen.dart';

/// Widget representing the Inventory Screen
class InventoryView extends StatefulWidget {
  @override
  _InventoryViewState createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  String? actualInventoryID;
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
    var inventoryController =
        Provider.of<InventoryController>(context, listen: false);
    inventoryController.addInventory().then((inventoryId) {
      setState(() {
        actualInventoryID = inventoryId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (actualInventoryID == null) {
      return WaitingScreen();
    }
    return ScanListView(
      color: Colors.purple[300]!,
      title: 'Inventur',
      onScan: (barcode) async {
        var packet;
        var inventoryController =
            Provider.of<InventoryController>(context, listen: false);
        var packetsController =
            Provider.of<PacketsController>(context, listen: false);
        try {
          var inventoryPositionUuid = await inventoryController
              .addInventoryPosition(barcode, actualInventoryID!);
          var inventoryPosition = await inventoryController
              .getInventoryPosition(inventoryPositionUuid);

          var packetID = inventoryPosition.packet;

          packet = await packetsController.getPacketByUuid(packetID);
          setState(() {
            scanViewList.insert(0, packet);
          });
        } on InvalidBarcodeException {
          setState(() {
            buildAlert(
                    context, "Achtung!", "Der gescannte Barcode ist ungültig!")
                .show();
          });
        } on RecordNotFoundException {
          setState(() {
            buildAlert(context, "Achtung!",
                    "Das gescannte Paket wurde nicht erkannt!")
                .show();
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
