import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/packets_controller.dart';
import '../business_logic/production_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';

/// Widget representing ProductionStart Screen
class ProductionStartView extends StatefulWidget {
  ProductionStartView({
    Key? key,
    required this.productionID,
  }) : super(key: key);

  /// ID of the production order
  final int productionID;

  @override
  _ProductionStartViewState createState() => _ProductionStartViewState();
}

class _ProductionStartViewState extends State<ProductionStartView> {
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScanListView(
      title: 'Produktion-Start',
      color: Colors.lightGreen[300]!,
      onScan: (barcode) async {
        var packet;
        var productionstartController =
            Provider.of<ProductionController>(context, listen: false);
        var packetsController =
            Provider.of<PacketsController>(context, listen: false);

        productionstartController
            .addProductionMaterial(
                barcode, widget.productionID, packetsController)
            .then((value) async {
          var productionMaterial =
              await productionstartController.getProductionMaterial(value);

          var packetID = productionMaterial.packet;

          packet = await packetsController.getPacketWithId(packetID);
          setState(() {
            scanViewList.add(packet);
          });
        }).catchError((error) {
          setState(() {
            buildAlert(
                    context, "Achtung!", "Der gescannte Barcode ist ungültig!")
                .show();
          });
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
      },
    );
  }
}
