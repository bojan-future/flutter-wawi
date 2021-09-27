import 'dart:io';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../database/database.dart';

/// Business Logic for Files
class FileController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// get images from a given delivery
  Stream<List<DeliveryImage>> getPacketImages(int packetId) {
    return database.deliveryImagesDao.watchDeliveryImages(packetId);
  }

  /// create images for a given delivery
  Future<int> createPacketImage(String imagePath, int packetId) async {
    final image = File(imagePath);
    var documentsDirectory = await getApplicationDocumentsDirectory();

    var directoryPath = documentsDirectory.path;
    var deliveryImagesDirectory = Directory('$directoryPath/DeliveryImages');

    if (!await deliveryImagesDirectory.exists()) {
      deliveryImagesDirectory.create();
    }

    var fileName = image.path.split('/').last;
    var newImage = await image.copy('$directoryPath/DeliveryImages/$fileName');
    var newPath = newImage.path;

    return database.deliveryImagesDao.createDeliveryImage(
        DeliveryImagesCompanion(
            packet: Value(packetId), filePath: Value(newPath)));
  }

  /// add inventory
  void deleteDeliveryImage(DeliveryImage deliveryImage) async {
    database.deliveryImagesDao.deleteDeliveryImage(deliveryImage);
  }
}
