import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/business.exception.dart';
import '../business_logic/delivery_controller.dart';
import '../business_logic/packets_controller.dart';
import '../database/database.dart';
import '../ui_widgets/alert_warnings.dart';
import '../ui_widgets/scanlistview.dart';
import '../ui_widgets/waitingscreen.dart';

/// Widget representing the Delivery Screen
class DeliveryView extends StatefulWidget {
  @override
  _DeliveryViewState createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  String? actualDeliveryId;
  List<Packet> scanViewList = [];

  @override
  void initState() {
    super.initState();
    var deliveryController =
        Provider.of<DeliveryController>(context, listen: false);
    deliveryController.addDelivery().then((deliveryId) {
      setState(() {
        actualDeliveryId = deliveryId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (actualDeliveryId == null) {
      return WaitingScreen();
    }
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
              barcode, actualDeliveryId!);

          if (deliveryPositionID == -1) {
            setState(() {
              buildAlert(context, "Achtung!",
                      "Der gescannte Barcode ist ungültig!")
                  .show();
            });
          } else {
            var deliveryPosition = await deliveryController
                .getDeliveryPosition(deliveryPositionID);

            final packetID = deliveryPosition.packet;

            packet = await packetsController.getPacketByUuid(packetID);
            setState(() {
              scanViewList.insert(0, packet);
            });
          }
        } on RecordNotFoundException {
          setState(() {
            buildAlert(context, "Achtung!",
                    "Das gescannte Paket wurde nicht erkannt!")
                .show();
          });
        } on InvalidBarcodeException {
          setState(() {
            buildAlert(
                    context, "Achtung!", "Der gescannte Barcode ist ungültig!")
                .show();
          });
        } on DeliveryPositionAlreadyExists {
          setState(() {
            buildAlert(context, "Achtung!",
                    "Das gescannte Paket wurde bereits als geliefert erfasst!")
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
