import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import '../business_logic/file_controller.dart';

/// A widget that displays the picture taken by the user
class DisplayPictureScreen extends StatelessWidget {
  ///Path where the image file is stored
  final String imagePath;

  ///ID of delivery
  final int deliveryID;

  ///
  const DisplayPictureScreen(
      {Key? key, required this.imagePath, required this.deliveryID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Foto Vorschau'),
          backgroundColor: Colors.red[400]!),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
              flex: 5,
              child: Image.file(File(imagePath)),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Mdi.close, size: 40)],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        primary: Colors.black,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: TextButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.done, size: 40)],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        primary: Colors.black,
                      ),
                      onPressed: () async {
                        var fileController =
                            Provider.of<FileController>(context, listen: false);

                        await fileController.createDeliveryImage(
                            imagePath, deliveryID);

                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
