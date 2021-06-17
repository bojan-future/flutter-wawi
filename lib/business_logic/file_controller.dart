import 'dart:io';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../database/database.dart';

/// Business Logic for Files
class FileController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// get images from a given delivery
  Stream<List<DeliveryImage>> getDeliveryImages(int deliveryID) {
    return database.deliveryImagesDao.getDeliveryImages(deliveryID);
  }

  /// create images for a given delivery
  Future<int> createDeliveryImage(String imagePath, int deliveryID) async {
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
            delivery: Value(deliveryID), filePath: Value(newPath)));
  }

  /// add inventory
  void deleteDeliveryImage(String imagePath) async {
    database.deliveryImagesDao.deleteDeliveryImage(imagePath);
  }
}
