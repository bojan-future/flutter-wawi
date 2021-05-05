import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  int inventoryPositionID = 0;

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

        inventoryPositionID = await inventoryController.addInventoryPosition(
            barcode, actualInventoryID);

        if (inventoryPositionID == -1) {
          setState(() {
            buildAlertInvalidBarcode(context).show();
          });
        } else {
          var inventoryPosition = await inventoryController
              .getInventoryPosition(inventoryPositionID);

          var packetID = inventoryPosition.packet;

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
            onLongPress: () {
              buildShowDialog(context, index);
            },
          ),
        );
      },
    );
  }

  Future<void> buildShowDialog(BuildContext context, int index) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return _SystemPadding(
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Menge ändern',
                        helperText: "Originale Menge: "
                            "${scanViewList[index].quantity}"),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('Abbrechen'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                    //todo: update list
                  })
            ],
          ),
        );
      },
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300), child: child);
  }
}
