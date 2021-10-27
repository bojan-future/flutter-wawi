import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../database/database.dart';
import 'auth_controller.dart';
import 'business.exception.dart';
import 'packets_controller.dart';
import 'purchasepositions_controller.dart';

/// Business Logic for Deliveries
class DeliveryController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  final BuildContext _context;
  late AuthController _authController;
  late dynamic _userID;

  /// Delivery Controller
  DeliveryController(this._context) {
    _authController = Provider.of<AuthController>(_context, listen: false);
    _userID = _authController.getUserUuid();
  }

  /// add delivery
  Future<String> addDelivery() async {
    var now = DateTime.now();
    var formattedDate = DateFormat('dd.MM.yyyy kk:mm:ss').format(now);
    return database.deliveriesDao.createDelivery(DeliveriesCompanion(
        user: Value(_userID),
        date: Value(formattedDate),
        pictureCount: Value(0)));
  }

  /// add delivery position together with an associated packet
  Future<String> addDeliveryPosition(
      String barcode, String deliveryUuid) async {
    //check if already existing

    final packetsController = PacketsController();

    final packetTestId =
        await packetsController.getPacketByBarcode(barcode).then((packet) {
      return packet.uuid;
    }, onError: (e) {
      return Future.value("");
      //do nothing -> we expect the packet not to exist
    }).catchError((e) {
      return Future.value("");
      //do nothing -> we expect the packet not to exist
    });

    if (packetTestId.isNotEmpty) {
      var exists = await checkDeliveryPositionByPacket(packetTestId);
      if (exists) {
        return Future.error(DeliveryPositionAlreadyExists());
      }
    }

    final packetUuid = await packetsController.addPacket(barcode);

    final packet = await packetsController.getPacketByUuid(packetUuid);

    final purchasePositionsController = PurchasePositionsController();
    final purchasePositionList = await purchasePositionsController
        .getPurchasePositionsByProduct(packet.product);

    if (purchasePositionList.isEmpty) {
      return Future.error(DeliveryWrongProduct());
    }

    //get sum of rest quantity from all positions
    var sumRestQuantity = purchasePositionList
        .map((e) => e.restQuantity)
        .reduce((value, element) => value + element);

    if (sumRestQuantity < packet.quantity) {
      return Future.error(DeliveryQuantityExceeded(
          restQuantity: sumRestQuantity, scannedQuantity: packet.quantity));
    }

    return database.deliveryPositionsDao
        .createDeliveryPosition(DeliveryPositionsCompanion(
      uuid: Value(Uuid().v4()),
      packet: Value(packetUuid),
      delivery: Value(deliveryUuid),
    ))
        .then((newDeliveryPositionUuid) {
      //update purchasePosition (decrement restQuantity)
      purchasePositionList.forEach((purchasePosition) {
        if (sumRestQuantity > 0) {
          final sumDifference =
              min(packet.quantity, purchasePosition.restQuantity);
          sumRestQuantity -= sumDifference;
          purchasePositionsController.updatePurchasePosition(
              PurchasePositionsCompanion(
                  id: Value(purchasePosition.id),
                  restQuantity:
                      Value(purchasePosition.restQuantity - sumDifference)));
        }
      });

      return newDeliveryPositionUuid;
    });
  }

  /// get delivery position
  Future<DeliveryPosition> getDeliveryPosition(
      String deliveryPositionUuid) async {
    return database.deliveryPositionsDao
        .getDeliveryPositionByUuid(deliveryPositionUuid);
  }

  Future<bool> checkDeliveryPositionByPacket(String packetUuid) async {
    return database.deliveryPositionsDao
        .checkDeliveryPositionByPacket(packetUuid);
  }

  /// get delivery position
  Future<List<Delivery>> getLast10Deliveries() async {
    return database.deliveriesDao.getLast10Deliveries();
  }
}
