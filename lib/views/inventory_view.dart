import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/business.exception.dart';
import '../business_logic/inventory_controller.dart';
import '../business_logic/packets_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';

/// Widget representing the Inventory Screen
class InventoryView extends StatefulWidget {
  @override
  _InventoryViewState createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  int actualInventoryID = 0;
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
    var inventoryController =
        Provider.of<InventoryController>(context, listen: false);
    inventoryController.addInventory().then((inventoryId) {
      actualInventoryID = inventoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          var inventoryPositionID = await inventoryController
              .addInventoryPosition(barcode, actualInventoryID);
          var inventoryPosition = await inventoryController
              .getInventoryPosition(inventoryPositionID);

          var packetID = inventoryPosition.packet;

          packet = await packetsController.getPacketWithId(packetID);
          setState(() {
            scanViewList.add(packet);
          });
        } on InvalidBarcodeException {
          setState(() {
            buildAlertInvalidBarcode(context).show();
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
