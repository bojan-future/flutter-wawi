import 'package:flutter/cupertino.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:intl/intl.dart';
import '../database/database.dart';
import 'auth_controller.dart';
import 'business.exception.dart';
import 'packets_controller.dart';

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
    _userID = _authController.getUserId();
  }

  /// add delivery
  Future<int> addDelivery() async {
    var now = DateTime.now();
    var formattedDate = DateFormat('dd.MM.yyyy kk:mm:ss').format(now);
    return database.deliveriesDao.createDelivery(DeliveriesCompanion(
        user: Value(_userID),
        date: Value(formattedDate),
        pictureCount: Value(0)));
  }

  /// add delivery position together with an associated packet
  Future<int> addDeliveryPosition(String barcode, int deliveryID) async {
    //check if already existing

    final packetTestId =
        await PacketsController().getPacketByBarcode(barcode).then((packet) {
      return packet.id;
    }, onError: (e) {
      return Future.value(-1);
      //do nothing -> we expect the packet not to exist
    }).catchError((e) {
      return Future.value(-1);
      //do nothing -> we expect the packet not to exist
    });

    if (packetTestId > 0) {
      throw PacketAlreadyExists();
    }

    final packetID = await PacketsController().addPacket(barcode);

    return database.deliveryPositionsDao
        .createDeliveryPosition(DeliveryPositionsCompanion(
      uuid: Value(Uuid().v4()),
      packet: Value(packetID),
      delivery: Value(deliveryID),
    ));
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
}
