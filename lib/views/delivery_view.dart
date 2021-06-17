import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/business.exception.dart';
import '../business_logic/delivery_controller.dart';
import '../business_logic/packets_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';

/// Widget representing the Delivery Screen
class DeliveryView extends StatefulWidget {
  @override
  _DeliveryViewState createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  int actualDeliveryId = 0;
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
    var deliveryController =
        Provider.of<DeliveryController>(context, listen: false);
    deliveryController.addDelivery().then((deliveryId) {
      actualDeliveryId = deliveryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScanListView(
      title: 'Anlieferung',
      onScan: (barcode) async {
        var packet;
        var deliveryController =
            Provider.of<DeliveryController>(context, listen: false);
        var packetsController =
            Provider.of<PacketsController>(context, listen: false);

        try {
          var deliveryPositionID = await deliveryController.addDeliveryPosition(
              barcode, actualDeliveryId);

          if (deliveryPositionID == -1) {
            setState(() {
              buildAlert(context, "Achtung!",
                      "Der gescannte Barcode ist ungültig!")
                  .show();
            });
          } else {
            var deliveryPosition = await deliveryController
                .getDeliveryPosition(deliveryPositionID);

            var packetID = deliveryPosition.packet;

            packet = await packetsController.getPacketWithId(packetID);
            setState(() {
              scanViewList.insert(0, packet);
            });
          }
        } on InvalidBarcodeException {
          setState(() {
            buildAlert(
                    context, "Achtung!", "Der gescannte Barcode ist ungültig!")
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
