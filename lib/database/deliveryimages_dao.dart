import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

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

  /// inserts given delivery into database
  Future<int> createDeliveryImage(DeliveryImagesCompanion deliveryImage) {
    return into(deliveryImages).insert(deliveryImage);
  }

  /// deletes delivery from the database
  void deleteDeliveryImage(String strImagePath) async {
    await (delete(deliveryImages)
          ..where((d) => d.filePath.equals(strImagePath)))
        .go();
  }
}
