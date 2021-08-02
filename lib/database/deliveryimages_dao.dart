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

  /// observer for images of one specific delivery
  Stream<List<DeliveryImage>> watchDeliveryImages(int packetId) {
    final imageList = (select(deliveryImages)
          ..where((p) => p.packet.equals(packetId)))
        .watch();
    return imageList;
  }

  /// retrieve by id
  Future<DeliveryImage> getDeliveryImageById(int id) {
    return (select(deliveryImages)..where((p) => p.id.equals(id))).getSingle();
  }

  /// inserts given delivery into database
  Future<int> createDeliveryImage(DeliveryImagesCompanion deliveryImage) {
    if (!deliveryImage.uuid.present) {
      deliveryImage = DeliveryImagesCompanion(
        uuid: Value(Uuid().v4()),
        packet: deliveryImage.packet,
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

  ///hook executed when record has been changed
  void onUpdateData(DeliveryImage model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();
    json['data'] = await File(model.filePath).readAsBytes().then(base64Encode);
    json['packet'] = await db.packetsDao
        .getPacketWithId(model.packet)
        .then((packet) => packet.uuid, onError: (e) => 'error')
        .catchError((e) => 'error');

    addSynchroUpdate(model.uuid, SyncType.delivery_image, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(DeliveryImage model) {
    addSynchroUpdate(model.uuid, SyncType.delivery_image, model.toJsonString(),
        deleted: true);
  }
}
