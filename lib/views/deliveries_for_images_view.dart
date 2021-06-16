import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/delivery_controller.dart';
import '../database/database.dart';
import '../ui_widgets/deliverylistview.dart';
import 'images_of_deliveries_view.dart';

/// Widget representing the Inventory Screen
class DeliveriesForImagesView extends StatefulWidget {
  @override
  _DeliveriesForImagesViewState createState() =>
      _DeliveriesForImagesViewState();
}

class _DeliveriesForImagesViewState extends State<DeliveriesForImagesView> {
  List<Delivery> actualDeliveryViewList = [];

  @override
  void initState() {
    super.initState();
    _asyncMethod();
  }

  _asyncMethod() async {
    var deliveryController =
        Provider.of<DeliveryController>(context, listen: false);
    var deliveryViewList = await deliveryController.getLast10Deliveries();

    setState(() {
      actualDeliveryViewList = deliveryViewList.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DeliveriesForImagesWidget(
      title: 'Anlieferungen',
      itemCount: actualDeliveryViewList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title:
                Text("Anlieferung vom ${actualDeliveryViewList[index].date}\n"),
            subtitle:
                Text("Fotos: ${actualDeliveryViewList[index].pictureCount}"),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => DeliveryImagesView(
                            deliveryId: actualDeliveryViewList[index].id,
                          )));
            },
          ),
        );
      },
    );
  }
}
