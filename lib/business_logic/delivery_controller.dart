import 'package:flutter/cupertino.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';
import 'auth_controller.dart';
import 'packets_controller.dart';

/// Business Logic for Deliveries
class DeliveryController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  final BuildContext _context;
  late AuthController authController;
  late dynamic userID;

  /// Delivery Controller
  DeliveryController(this._context) {
    authController = Provider.of<AuthController>(_context, listen: false);
    userID = authController.getUserId();
  }

  /// add delivery
  Future<int> addDelivery() async {
    var now = DateTime.now();
    var formattedDate = DateFormat('dd.MM.yyyy / kk:mm').format(now);
    return database.deliveriesDao.createDelivery(DeliveriesCompanion(
        user: Value(userID),
        date: Value(formattedDate),
        pictureCount: Value(0)));
  }

  /// add delivery position together with an associated packet
  Future<int> addDeliveryPosition(String barcode, int deliveryID) async {
    var packetID = await PacketsController().addPacket(barcode);

    return database.deliveryPositionsDao.createDeliveryPosition(
        DeliveryPositionsCompanion(
            packet: Value(packetID), delivery: Value(deliveryID)));
  }

  /// get delivery position
  Future<DeliveryPosition> getDeliveryPosition(int deliveryPositionID) async {
    return database.deliveryPositionsDao
        .getDeliveryPositionByID(deliveryPositionID);
  }

  /// get delivery position
  Future<List<Delivery>> getLast10Deliveries() async {
    return database.deliveriesDao.getLast10Deliveries();
  }

  /// increment picture count delivery
  Future<int> incrementPictureCounter(int deliveryID) async {
    var delivery = await database.deliveriesDao.getDelivery(deliveryID);

    return database.deliveriesDao.incrementPictureCounter(delivery);
  }

  /// decrement picture count delivery
  Future<int> decrementPictureCounter(int deliveryID) async {
    var delivery = await database.deliveriesDao.getDelivery(deliveryID);

    return database.deliveriesDao.decrementPictureCounter(delivery);
  }
}
