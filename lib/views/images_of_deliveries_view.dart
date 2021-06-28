import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/file_controller.dart';
import '../database/database.dart';
import '../ui_widgets/delivery_photos_widget.dart';

/// Widget representing the Inventory Screen
class DeliveryImagesView extends StatefulWidget {
  ///
  DeliveryImagesView({
    Key? key,
    required this.deliveryId,
  }) : super(key: key);

  final int deliveryId;

  @override
  _DeliveryImagesViewState createState() => _DeliveryImagesViewState();
}

class _DeliveryImagesViewState extends State<DeliveryImagesView> {
  Stream<List<DeliveryImage>> imageListStream =
      Stream<List<DeliveryImage>>.empty();
  @override
  void initState() {
    super.initState();
    _asyncMethod();
  }

  _asyncMethod() async {
    var fileController = Provider.of<FileController>(context, listen: false);
    imageListStream = fileController.getDeliveryImages(widget.deliveryId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DeliveryImage>>(
        stream: imageListStream,
        builder: (context, snapshot) {
          var actualImageList = snapshot.data ?? List<DeliveryImage>.empty();
          return DeliveryImagesWidget(
            title: "Fotos zur Anlieferung",
            itemCount: actualImageList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: GestureDetector(
                  onTap: () {
                    buildShowDialog(context, index, actualImageList);
                  },
                  child: Image.file(File(actualImageList[index].filePath)),
                ),
              );
            },
            deliveryID: widget.deliveryId,
            onPhotoFinished: () {},
          );
        });
  }
}

/// Popup when a picture is tapped
Future<void> buildShowDialog(
    BuildContext context, int index, List<DeliveryImage> actualimageList) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return _SystemPadding(
        child: AlertDialog(
          actions: <Widget>[
            TextButton(
                child: const Text('Löschen'),
                onPressed: () {
                  var fileController =
                      Provider.of<FileController>(context, listen: false);

                  fileController.deleteDeliveryImage(actualimageList[index]);

                  Navigator.pop(context);
                }),
            TextButton(
                child: const Text('Abbrechen'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      );
    },
  );
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
