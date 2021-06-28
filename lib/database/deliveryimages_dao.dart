import 'dart:convert';
import 'dart:io';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database.dart';
import 'synchronizable.dart';

part 'deliveryimages_dao.g.dart';

@UseDao(tables: [DeliveryImages])

/// delivery images functionality extension for database
class DeliveryImagesDao extends DatabaseAccessor<Database>
    with _$DeliveryImagesDaoMixin {
  ///
  DeliveryImagesDao(Database db) : super(db);

  /// retrieves deliveryImage with a given ID
  Future<DeliveryImage> getDeliveryImage(String imagePath) {
    return (select(deliveryImages)..where((p) => p.filePath.equals(imagePath)))
        .getSingle();
  }

  /// retrieves last 10 deliveries
  Stream<List<DeliveryImage>> getDeliveryImages(int deliveryID) {
    final imageList = (select(deliveryImages)
          ..where((p) => p.delivery.equals(deliveryID)))
        .watch();
    return imageList;
  }

  Future<DeliveryImage> getDeliveryImageById(int id) {
    return (select(deliveryImages)..where((p) => p.id.equals(id))).getSingle();
  }

  /// inserts given delivery into database
  Future<int> createDeliveryImage(DeliveryImagesCompanion deliveryImage) {
    if (!deliveryImage.uuid.present) {
      deliveryImage = DeliveryImagesCompanion(
        uuid: Value(Uuid().v4()),
        delivery: deliveryImage.delivery,
        filePath: deliveryImage.filePath,
      );
    }
    return into(deliveryImages).insert(deliveryImage).then((value) {
      getDeliveryImageById(value).then(onUpdateData);
      return value;
    });
  }

  /// deletes delivery from the database
  void deleteDeliveryImage(DeliveryImage deliveryImage) async {
    await delete(deliveryImages).delete(deliveryImage).then((value) {
      if (value > 0) {
        onDeleteData(deliveryImage);
      }
      return value;
    });
  }

// todo: encode image data as base64 into json
  void onUpdateData(DeliveryImage model) {
    var json = model.toJson();
    json['data'] = File(model.filePath).readAsBytes().then(base64Encode);

    addSynchroUpdate(model.uuid, SyncType.delivery_image, json.toString());
  }

  void onDeleteData(DeliveryImage model) {
    addSynchroUpdate(model.uuid, SyncType.delivery_image, model.toJsonString(),
        deleted: true);
  }
}
