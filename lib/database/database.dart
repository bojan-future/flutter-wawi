import 'package:flutter/foundation.dart';
import 'package:kuda_lager/database/users_dao.dart';
import 'package:kuda_lager/services/synchro_controller.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import 'deliveries_dao.dart';
import 'deliverypositions_dao.dart';
import 'inventories_dao.dart';
import 'inventorypositions_dao.dart';
import 'orders_dao.dart';
import 'packets_dao.dart';
import 'production_dao.dart';
import 'products_dao.dart';
import 'systemvariables_dao.dart';

part 'database.exception.dart';
part 'database.g.dart';

@DataClassName('SystemVariable')
class SystemVariables extends Table {
  TextColumn get name => text()();

  TextColumn get value => text()();
}

/// represents a user
@DataClassName('User')
class Users extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// barcode
  TextColumn get barcode => text()();

  /// user number
  TextColumn get userNr => text()();
}

/// represents a physical package with product, barcode, lot and quantity
@DataClassName('Packet')
class Packets extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// barcode
  TextColumn get barcode => text()();

  /// lot (charge)
  TextColumn get lot => text()();

  /// quantity of items in the package
  RealColumn get quantity => real()();

  /// foreign key -> product
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
class Products extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// product number
  TextColumn get productNr => text()();

  /// product name
  TextColumn get productName => text()();

  /// gtin 1
  IntColumn get gtin1 => integer()();

  /// gtin 2
  IntColumn get gtin2 => integer()();

  /// gtin 3
  IntColumn get gtin3 => integer()();

  /// gtin 4
  IntColumn get gtin4 => integer()();

  /// gtin 5
  IntColumn get gtin5 => integer()();
}

@DataClassName('Order')

/// represents an order, has many positions
class Orders extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// order number
  TextColumn get orderNr => text()();

  /// foreign key -> user
  IntColumn get user => integer().customConstraint('REFERENCES users(id)')();
}

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

/// represents a delivery, has many positions
class Deliveries extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> user
  IntColumn get user => integer().customConstraint('REFERENCES users(id)')();
}

@DataClassName('DeliveryPosition')

/// one position in a delivery
class DeliveryPositions extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> delivery
  IntColumn get delivery =>
      integer().customConstraint('REFERENCES deliveries(id)')();

  /// foreign key -> packets
  IntColumn get packet =>
      integer().customConstraint('REFERENCES packets(id)')();
}

@DataClassName('Inventory')

/// represents an inventory, has many positions
class Inventories extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();
}

@DataClassName('InventoryPosition')

/// one position in an inventory
class InventoryPositions extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> inventory
  IntColumn get inventory =>
      integer().customConstraint('REFERENCES inventories(id)')();

  /// foreign key -> packets
  IntColumn get packet =>
      integer().customConstraint('REFERENCES packets(id)')();

  /// quantity
  RealColumn get quantity => real()();
}

@DataClassName('ProductionOrder')

/// production order with input materials and output results
class ProductionOrders extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// production order number
  TextColumn get productionOrderNr => text()();
}

@DataClassName('ProductionMaterial')

/// material part of production order (many materials - one order)
class ProductionMaterials extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> production order
  IntColumn get order => integer().customConstraint('REFERENCES orders(id)')();
}

@DataClassName('ProductionResult')

/// result part of production order (many results - one order)
class ProductionResults extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// globaly unique id used for synchronizing
  TextColumn get uuid => text().customConstraint('UNIQUE')();

  /// foreign key -> production order
  IntColumn get order => integer().customConstraint('REFERENCES orders(id)')();
}

/// High level production model
/// including production order, materials and results
class ProductionModel {
  /// production order
  final ProductionOrder prodOrder;

  /// materials (input)
  final List<ProductionMaterial> materials;

  /// results (output)
  final List<ProductionResult> results;

  ///
  ProductionModel(this.prodOrder, this.materials, this.results);
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
  Inventories,
  InventoryPositions,
], daos: [
  SystemVariablesDao,
  UsersDao,
  PacketsDao,
  ProductsDao,
  OrdersDao,
  ProductionDao,
  DeliveriesDao,
  DeliveryPositionsDao,
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
        // fetchSync().then((syncResponse) {
        //   print(syncResponse.success);
        //   print(syncResponse.syncs.length);
        // }).catchError((error) {
        //   print(error);
        // });
        if (details.wasCreated || kDebugMode) {
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
            barcode: '9999912345',
            id: 1,
            userNr: '12345',
            uuid: Uuid().v4(),
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
