import 'package:moor_flutter/moor_flutter.dart';

import 'packets_dao.dart';
import 'production_dao.dart';

part 'database.g.dart';

@DataClassName('Packet')

/// represents a physical package with product, barcode, lot and quantity
class Packets extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// barcode
  TextColumn get barcode => text()();

  /// lot (charge)
  TextColumn get lot => text()();

  /// quantity of items in the package
  RealColumn get quantity => real()();

  /// foreign key -> product
  IntColumn get product =>
      integer().customConstraint('REFERENCES products(id)')();

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

  /// product number
  TextColumn get productNr => text()();
}

@DataClassName('Order')

/// represents an order, has many positions
class Orders extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// order number
  TextColumn get orderNr => text()();
}

@DataClassName('OrderPosition')

/// one position in an order
class OrderPositions extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// foreign key -> order
  IntColumn get order => integer().customConstraint('REFERENCES orders(id)')();
}

@DataClassName('ProductionOrder')

/// production order with input materials and output results
class ProductionOrders extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// production order number
  TextColumn get productionOrderNr => text()();
}

@DataClassName('ProductionMaterial')

/// material part of production order (many materials - one order)
class ProductionMaterials extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

  /// foreign key -> production order
  IntColumn get order => integer().customConstraint('REFERENCES orders(id)')();
}

@DataClassName('ProductionResult')

/// result part of production order (many results - one order)
class ProductionResults extends Table {
  /// primary key
  IntColumn get id => integer().autoIncrement()();

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

@UseMoor(tables: [
  Packets,
  Products,
  Orders,
  OrderPositions,
  ProductionOrders,
  ProductionMaterials,
  ProductionResults
], daos: [
  ProductionDao,
  PacketsDao
])

/// Main database
class Database extends _$Database {
  ///
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

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
        if (details.wasCreated) {
          //todo: insert default data
        }
      },
    );
  }
}
