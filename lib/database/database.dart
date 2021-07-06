import 'package:flutter/foundation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import '../misc/future_annotations.dart';
import 'deliveries_dao.dart';
import 'deliveryimages_dao.dart';
import 'deliverypositions_dao.dart';
import 'dispatches_dao.dart';
import 'dispatchpositions_dao.dart';
import 'inventories_dao.dart';
import 'inventorypositions_dao.dart';
import 'orders_dao.dart';
import 'packets_dao.dart';
import 'production_dao.dart';
import 'production_material_dao.dart';
import 'production_result_dao.dart';
import 'products_dao.dart';
import 'synchroupdates_dao.dart';
import 'systemvariables_dao.dart';
import 'users_dao.dart';

part 'database.exception.dart';
part 'database.g.dart';

@DataClassName('SynchroUpdate')

/// Represents one Synchronisation Packet for sending to the server
class SynchroUpdates extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  ///data type derived from the source table
  IntColumn get type => integer()();

  /// mark this record as deleted
  BoolColumn get deleted => boolean()();

  ///json containing data to be synchronized
  TextColumn get data => text()();
}

///conversion to map needed for http request
extension MapConversion on SynchroUpdate {
  ///conversion to map needed for http request
  Map<String, String> toMap() {
    return <String, String>{
      "uuid": uuid,
      "type": type.toString(),
      "data": data,
    };
  }
}

@DataClassName('SystemVariable')

///various Variables that need Persistance
class SystemVariables extends Table {
  /// key
  TextColumn get name => text().customConstraint('UNIQUE')();

  /// value
  TextColumn get value => text()();
}

/// represents a user
@DataClassName('User')
@FutureTableNumber(200)
class Users extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(131)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// barcode
  @FutureColumnNumber(139)
  TextColumn get barcode => text()();

  /// user number
  @FutureColumnNumber(8)
  TextColumn get userNr => text()();
}

/// represents a physical package with product, barcode, lot and quantity
@DataClassName('Packet')
@FutureTableNumber(529)
class Packets extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(96)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// barcode
  @FutureColumnNumber(53)
  TextColumn get barcode => text()();

  /// lot (charge)
  @FutureColumnNumber(52)
  TextColumn get lot => text()();

  /// quantity of items in the package
  @FutureColumnNumber(35)
  RealColumn get quantity => real()();

  /// foreign key -> product
  @FutureColumnNumber(5)
  IntColumn get product =>
      integer().customConstraint('REFERENCES products(id)')();

  /// product name from product
  TextColumn get productName => text()();

  /// product number from product
  TextColumn get productNr => text()();

  /// foreign key -> 'parent' packet in case this is part of larger packet,
  /// might be null
  IntColumn get wrapping => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES packets(id)')();
}

@DataClassName('Product')

/// represents a product as part of a package
@FutureTableNumber(90)
class Products extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(156)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// product number
  @FutureColumnNumber(5)
  TextColumn get productNr => text()();

  /// product name
  /// @FutureColumnNumber(6)
  TextColumn get productName => text()();

  /// gtin 1
  /// @FutureColumnNumber(8)
  IntColumn get gtin1 => integer()();

  /// gtin 2
  /// @FutureColumnNumber(49)
  IntColumn get gtin2 => integer()();

  /// gtin 3
  /// @FutureColumnNumber(50)
  IntColumn get gtin3 => integer()();

  /// gtin 4
  /// @FutureColumnNumber(163)
  IntColumn get gtin4 => integer()();

  /// gtin 5
  /// @FutureColumnNumber(164)
  IntColumn get gtin5 => integer()();
}

@DataClassName('Order')
@FutureTableNumber(152)

/// represents an order, has many positions
class Orders extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(193)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// order number
  @FutureColumnNumber(5)
  TextColumn get orderNr => text()();

  /// order barcode
  @FutureColumnNumber(1)
  TextColumn get orderBarcode => text()();
}

//not used for now - will be used later for checking dispatches
//(offene verkaufspositionen)
@DataClassName('OrderPosition')

/// one position in an order
class OrderPositions extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> order
  IntColumn get order => integer().customConstraint('REFERENCES orders(id)')();
}

@DataClassName('Delivery')
@FutureTableNumber(187)

/// represents a delivery, has many positions
class Deliveries extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(107)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// picture count
  IntColumn get pictureCount => integer()();

  /// foreign key -> user
  @FutureColumnNumber(9)
  IntColumn get user => integer().customConstraint('REFERENCES users(id)')();
}

@DataClassName('DeliveryPosition')
@FutureTableNumber(188)

/// one position in a delivery
class DeliveryPositions extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(34)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> delivery
  @FutureColumnNumber(2)
  IntColumn get delivery =>
      integer().customConstraint('REFERENCES deliveries(id)')();

  /// foreign key -> packets
  // 999 -> not a real column, but we need it generated for JSON conversion
  @FutureColumnNumber(999)
  IntColumn get packet =>
      integer().customConstraint('REFERENCES packets(id)')();
}

@DataClassName('Dispatch')
@FutureTableNumber(154)

/// represents a dispatch, has many positions
class Dispatches extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(193)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> order
  @FutureColumnNumber(50)
  IntColumn get orderID =>
      integer().customConstraint('REFERENCES orders(id)')();
}

@DataClassName('DispatchPosition')
@FutureTableNumber(155)

/// one position in a dispatch
class DispatchPositions extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(68)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> dispatch
  @FutureColumnNumber(2)
  IntColumn get dispatch =>
      integer().customConstraint('REFERENCES dispatches(id)')();

  /// foreign key -> packets
  // 999 -> not a real column, but we need it generated for JSON conversion
  @FutureColumnNumber(999)
  IntColumn get packet =>
      integer().customConstraint('REFERENCES packets(id)')();
}

@DataClassName('DeliveryImage')
@FutureTableNumber(39)

/// images for deliveries
class DeliveryImages extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(16)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// file path
  @FutureColumnNumber(5)
  TextColumn get filePath => text()();

  /// foreign key -> delivery
  @FutureColumnNumber(12)
  IntColumn get delivery =>
      integer().customConstraint('REFERENCES deliveries(id)')();
}

@DataClassName('Inventory')
@FutureTableNumber(107)

/// represents an inventory, has many positions
class Inventories extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();
}

@DataClassName('InventoryPosition')
@FutureTableNumber(999107)

/// one position in an inventory
class InventoryPositions extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> inventory
  @FutureColumnNumber(998)
  IntColumn get inventory =>
      integer().customConstraint('REFERENCES inventories(id)')();

  /// foreign key -> packets
  @FutureColumnNumber(999)
  IntColumn get packet =>
      integer().customConstraint('REFERENCES packets(id)')();

  /// quantity
  RealColumn get quantity => real()();
}

@DataClassName('ProductionOrder')
@FutureTableNumber(170)

/// production order with input materials and output results
class ProductionOrders extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  @FutureColumnNumber(79)
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// production order number
  @FutureColumnNumber(5)
  TextColumn get productionOrderNr => text()();

  /// production order barcode
  @FutureColumnNumber(35)
  TextColumn get productionOrderBarcode => text()();
}

@DataClassName('ProductionMaterial')
@FutureTableNumber(999170)

/// material part of production order (many materials - one order)
class ProductionMaterials extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> production order
  @FutureColumnNumber(998)
  IntColumn get prodOrder =>
      integer().customConstraint('REFERENCES production_orders(id)')();

  /// Material Packet
  /// foreign key -> packets
  @FutureColumnNumber(999)
  IntColumn get packet =>
      integer().customConstraint('REFERENCES packets(id)')();
}

@DataClassName('ProductionResult')
@FutureTableNumber(998170)

/// result part of production order (many results - one order)
class ProductionResults extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> production order
  @FutureColumnNumber(998)
  IntColumn get prodOrder =>
      integer().customConstraint('REFERENCES production_orders(id)')();

  /// Resulting Packet
  /// foreign key -> packets
  @FutureColumnNumber(999)
  IntColumn get packet =>
      integer().customConstraint('REFERENCES packets(id)')();
}

// ignore: avoid_classes_with_only_static_members
/// use DatabaseFactory to get database instance
class DatabaseFactory {
  static Database? _databaseInstance;

  /// retrieves database instance, creating one on first call
  static Database getDatabaseInstance() {
    if (_databaseInstance == null) {
      _databaseInstance = Database(Database.createDefaultQueryExecutor());
    }

    return _databaseInstance!;
  }
}

@UseMoor(tables: [
  SynchroUpdates,
  SystemVariables,
  Users,
  Packets,
  Products,
  Orders,
  OrderPositions,
  ProductionOrders,
  ProductionMaterials,
  ProductionResults,
  Deliveries,
  DeliveryPositions,
  Dispatches,
  DispatchPositions,
  DeliveryImages,
  Inventories,
  InventoryPositions,
], daos: [
  SynchroUpdatesDao,
  SystemVariablesDao,
  UsersDao,
  PacketsDao,
  ProductsDao,
  OrdersDao,
  ProductionDao,
  ProductionMaterialsDao,
  ProductionResultsDao,
  DeliveriesDao,
  DeliveryPositionsDao,
  DispatchesDao,
  DispatchPositionsDao,
  DeliveryImagesDao,
  InventoriesDao,
  InventoryPositionsDao,
])

/// Main database
class Database extends _$Database {
  ///
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) {
        return m.createAll();
      },
      onUpgrade: (m, from, to) async {},
      beforeOpen: (details) async {
        if (details.wasCreated /* || kDebugMode*/) {
          if (kDebugMode) {
            final m = createMigrator(); // changed to this
            for (final table in allTables) {
              await m.deleteTable(table.actualTableName);
              await m.createTable(table);
            }
          }
          // await into(products).insert(Product(
          //     id: 1,
          //     uuid: Uuid().v4(),
          //     productNr: "123456789",
          //     productName: "Faser NAT-35 Meatcling Kal. 80",
          //     gtin1: 123,
          //     gtin2: 123,
          //     gtin3: 123,
          //     gtin4: 123,
          //     gtin5: 123));

          // await into(products).insert(Product(
          //     id: 2,
          //     uuid: Uuid().v4(),
          //     productNr: "101010101",
          //     productName: "Tripan farblos Kal. 110",
          //     gtin1: 456789012345,
          //     gtin2: 123,
          //     gtin3: 123,
          //     gtin4: 123,
          //     gtin5: 123));

          await into(users).insert(User(
            id: 1,
            uuid: Uuid().v4(),
            barcode: "9999912345",
            userNr: '12345',
          ));
        }
      },
    );
  }

  /// default executor for running real database in app
  static QueryExecutor createDefaultQueryExecutor() {
    return FlutterQueryExecutor.inDatabaseFolder(
        path: 'db.sqlite', logStatements: kDebugMode); //only log if in debug
  }
}
