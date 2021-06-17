import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/packets_controller.dart';
import '../business_logic/production_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';

/// Widget representing ProductionCompletion Screen
class ProductionCompletionView extends StatefulWidget {
  /// Production completion view
  ProductionCompletionView({
    Key? key,
    required this.productionID,
  }) : super(key: key);

  /// ID of the production order
  final int productionID;

  @override
  _ProductionCompletionViewState createState() =>
      _ProductionCompletionViewState();
}

class _ProductionCompletionViewState extends State<ProductionCompletionView> {
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScanListView(
      title: 'Produktion-Abschluss',
      color: Colors.teal[300]!,
      onScan: (barcode) async {
        var packet;
        var productionController =
            Provider.of<ProductionController>(context, listen: false);
        var packetsController =
            Provider.of<PacketsController>(context, listen: false);

        productionController
            .addProductionResult(
                barcode, widget.productionID, packetsController)
            .then((value) async {
          var productionMaterial =
              await productionController.getProductionResult(value);

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
