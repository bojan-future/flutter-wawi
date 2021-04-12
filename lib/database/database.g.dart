// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Packet extends DataClass implements Insertable<Packet> {
  /// primary key
  final int id;

  /// barcode
  final String barcode;

  /// lot (charge)
  final String lot;

  /// quantity of items in the package
  final double quantity;

  /// foreign key -> product
  final int product;

  /// foreign key -> 'parent' packet in case this is part of larger packet,
  /// might be null
  final int wrapping;
  Packet(
      {@required this.id,
      @required this.barcode,
      @required this.lot,
      @required this.quantity,
      @required this.product,
      this.wrapping});
  factory Packet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Packet(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      barcode:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}barcode']),
      lot: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lot']),
      quantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      product:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}product']),
      wrapping:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}wrapping']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || lot != null) {
      map['lot'] = Variable<String>(lot);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || product != null) {
      map['product'] = Variable<int>(product);
    }
    if (!nullToAbsent || wrapping != null) {
      map['wrapping'] = Variable<int>(wrapping);
    }
    return map;
  }

  PacketsCompanion toCompanion(bool nullToAbsent) {
    return PacketsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      lot: lot == null && nullToAbsent ? const Value.absent() : Value(lot),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      product: product == null && nullToAbsent
          ? const Value.absent()
          : Value(product),
      wrapping: wrapping == null && nullToAbsent
          ? const Value.absent()
          : Value(wrapping),
    );
  }

  factory Packet.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Packet(
      id: serializer.fromJson<int>(json['id']),
      barcode: serializer.fromJson<String>(json['barcode']),
      lot: serializer.fromJson<String>(json['lot']),
      quantity: serializer.fromJson<double>(json['quantity']),
      product: serializer.fromJson<int>(json['product']),
      wrapping: serializer.fromJson<int>(json['wrapping']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'barcode': serializer.toJson<String>(barcode),
      'lot': serializer.toJson<String>(lot),
      'quantity': serializer.toJson<double>(quantity),
      'product': serializer.toJson<int>(product),
      'wrapping': serializer.toJson<int>(wrapping),
    };
  }

  Packet copyWith(
          {int id,
          String barcode,
          String lot,
          double quantity,
          int product,
          int wrapping}) =>
      Packet(
        id: id ?? this.id,
        barcode: barcode ?? this.barcode,
        lot: lot ?? this.lot,
        quantity: quantity ?? this.quantity,
        product: product ?? this.product,
        wrapping: wrapping ?? this.wrapping,
      );
  @override
  String toString() {
    return (StringBuffer('Packet(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('lot: $lot, ')
          ..write('quantity: $quantity, ')
          ..write('product: $product, ')
          ..write('wrapping: $wrapping')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          barcode.hashCode,
          $mrjc(
              lot.hashCode,
              $mrjc(quantity.hashCode,
                  $mrjc(product.hashCode, wrapping.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Packet &&
          other.id == this.id &&
          other.barcode == this.barcode &&
          other.lot == this.lot &&
          other.quantity == this.quantity &&
          other.product == this.product &&
          other.wrapping == this.wrapping);
}

class PacketsCompanion extends UpdateCompanion<Packet> {
  final Value<int> id;
  final Value<String> barcode;
  final Value<String> lot;
  final Value<double> quantity;
  final Value<int> product;
  final Value<int> wrapping;
  const PacketsCompanion({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    this.lot = const Value.absent(),
    this.quantity = const Value.absent(),
    this.product = const Value.absent(),
    this.wrapping = const Value.absent(),
  });
  PacketsCompanion.insert({
    this.id = const Value.absent(),
    @required String barcode,
    @required String lot,
    @required double quantity,
    @required int product,
    this.wrapping = const Value.absent(),
  })  : barcode = Value(barcode),
        lot = Value(lot),
        quantity = Value(quantity),
        product = Value(product);
  static Insertable<Packet> custom({
    Expression<int> id,
    Expression<String> barcode,
    Expression<String> lot,
    Expression<double> quantity,
    Expression<int> product,
    Expression<int> wrapping,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barcode != null) 'barcode': barcode,
      if (lot != null) 'lot': lot,
      if (quantity != null) 'quantity': quantity,
      if (product != null) 'product': product,
      if (wrapping != null) 'wrapping': wrapping,
    });
  }

  PacketsCompanion copyWith(
      {Value<int> id,
      Value<String> barcode,
      Value<String> lot,
      Value<double> quantity,
      Value<int> product,
      Value<int> wrapping}) {
    return PacketsCompanion(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      lot: lot ?? this.lot,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
      wrapping: wrapping ?? this.wrapping,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (lot.present) {
      map['lot'] = Variable<String>(lot.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (product.present) {
      map['product'] = Variable<int>(product.value);
    }
    if (wrapping.present) {
      map['wrapping'] = Variable<int>(wrapping.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PacketsCompanion(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('lot: $lot, ')
          ..write('quantity: $quantity, ')
          ..write('product: $product, ')
          ..write('wrapping: $wrapping')
          ..write(')'))
        .toString();
  }
}

class $PacketsTable extends Packets with TableInfo<$PacketsTable, Packet> {
  final GeneratedDatabase _db;
  final String _alias;
  $PacketsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  GeneratedTextColumn _barcode;
  @override
  GeneratedTextColumn get barcode => _barcode ??= _constructBarcode();
  GeneratedTextColumn _constructBarcode() {
    return GeneratedTextColumn(
      'barcode',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lotMeta = const VerificationMeta('lot');
  GeneratedTextColumn _lot;
  @override
  GeneratedTextColumn get lot => _lot ??= _constructLot();
  GeneratedTextColumn _constructLot() {
    return GeneratedTextColumn(
      'lot',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedRealColumn _quantity;
  @override
  GeneratedRealColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedRealColumn _constructQuantity() {
    return GeneratedRealColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productMeta = const VerificationMeta('product');
  GeneratedIntColumn _product;
  @override
  GeneratedIntColumn get product => _product ??= _constructProduct();
  GeneratedIntColumn _constructProduct() {
    return GeneratedIntColumn('product', $tableName, false,
        $customConstraints: 'REFERENCES products(id)');
  }

  final VerificationMeta _wrappingMeta = const VerificationMeta('wrapping');
  GeneratedIntColumn _wrapping;
  @override
  GeneratedIntColumn get wrapping => _wrapping ??= _constructWrapping();
  GeneratedIntColumn _constructWrapping() {
    return GeneratedIntColumn('wrapping', $tableName, true,
        $customConstraints: 'NULLABLE REFERENCES packets(id)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, barcode, lot, quantity, product, wrapping];
  @override
  $PacketsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'packets';
  @override
  final String actualTableName = 'packets';
  @override
  VerificationContext validateIntegrity(Insertable<Packet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode'], _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('lot')) {
      context.handle(
          _lotMeta, lot.isAcceptableOrUnknown(data['lot'], _lotMeta));
    } else if (isInserting) {
      context.missing(_lotMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product'], _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('wrapping')) {
      context.handle(_wrappingMeta,
          wrapping.isAcceptableOrUnknown(data['wrapping'], _wrappingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Packet map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Packet.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PacketsTable createAlias(String alias) {
    return $PacketsTable(_db, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  /// primary key
  final int id;

  /// product number
  final String productNr;
  Product({@required this.id, @required this.productNr});
  factory Product.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Product(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      productNr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_nr']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || productNr != null) {
      map['product_nr'] = Variable<String>(productNr);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      productNr: productNr == null && nullToAbsent
          ? const Value.absent()
          : Value(productNr),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      productNr: serializer.fromJson<String>(json['productNr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productNr': serializer.toJson<String>(productNr),
    };
  }

  Product copyWith({int id, String productNr}) => Product(
        id: id ?? this.id,
        productNr: productNr ?? this.productNr,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('productNr: $productNr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, productNr.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.productNr == this.productNr);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> productNr;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.productNr = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    @required String productNr,
  }) : productNr = Value(productNr);
  static Insertable<Product> custom({
    Expression<int> id,
    Expression<String> productNr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productNr != null) 'product_nr': productNr,
    });
  }

  ProductsCompanion copyWith({Value<int> id, Value<String> productNr}) {
    return ProductsCompanion(
      id: id ?? this.id,
      productNr: productNr ?? this.productNr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productNr.present) {
      map['product_nr'] = Variable<String>(productNr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('productNr: $productNr')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _productNrMeta = const VerificationMeta('productNr');
  GeneratedTextColumn _productNr;
  @override
  GeneratedTextColumn get productNr => _productNr ??= _constructProductNr();
  GeneratedTextColumn _constructProductNr() {
    return GeneratedTextColumn(
      'product_nr',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, productNr];
  @override
  $ProductsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'products';
  @override
  final String actualTableName = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('product_nr')) {
      context.handle(_productNrMeta,
          productNr.isAcceptableOrUnknown(data['product_nr'], _productNrMeta));
    } else if (isInserting) {
      context.missing(_productNrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Product.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(_db, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  /// primary key
  final int id;

  /// order number
  final String orderNr;
  Order({@required this.id, @required this.orderNr});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Order(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      orderNr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_nr']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || orderNr != null) {
      map['order_nr'] = Variable<String>(orderNr);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      orderNr: orderNr == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNr),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      orderNr: serializer.fromJson<String>(json['orderNr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderNr': serializer.toJson<String>(orderNr),
    };
  }

  Order copyWith({int id, String orderNr}) => Order(
        id: id ?? this.id,
        orderNr: orderNr ?? this.orderNr,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('orderNr: $orderNr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, orderNr.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order && other.id == this.id && other.orderNr == this.orderNr);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> orderNr;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.orderNr = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    @required String orderNr,
  }) : orderNr = Value(orderNr);
  static Insertable<Order> custom({
    Expression<int> id,
    Expression<String> orderNr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderNr != null) 'order_nr': orderNr,
    });
  }

  OrdersCompanion copyWith({Value<int> id, Value<String> orderNr}) {
    return OrdersCompanion(
      id: id ?? this.id,
      orderNr: orderNr ?? this.orderNr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderNr.present) {
      map['order_nr'] = Variable<String>(orderNr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('orderNr: $orderNr')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderNrMeta = const VerificationMeta('orderNr');
  GeneratedTextColumn _orderNr;
  @override
  GeneratedTextColumn get orderNr => _orderNr ??= _constructOrderNr();
  GeneratedTextColumn _constructOrderNr() {
    return GeneratedTextColumn(
      'order_nr',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, orderNr];
  @override
  $OrdersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'orders';
  @override
  final String actualTableName = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order_nr')) {
      context.handle(_orderNrMeta,
          orderNr.isAcceptableOrUnknown(data['order_nr'], _orderNrMeta));
    } else if (isInserting) {
      context.missing(_orderNrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Order.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

class OrderPosition extends DataClass implements Insertable<OrderPosition> {
  /// primary key
  final int id;

  /// foreign key -> order
  final int order;
  OrderPosition({@required this.id, @required this.order});
  factory OrderPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return OrderPosition(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    return map;
  }

  OrderPositionsCompanion toCompanion(bool nullToAbsent) {
    return OrderPositionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
    );
  }

  factory OrderPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OrderPosition(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
    };
  }

  OrderPosition copyWith({int id, int order}) => OrderPosition(
        id: id ?? this.id,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('OrderPosition(')
          ..write('id: $id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, order.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OrderPosition &&
          other.id == this.id &&
          other.order == this.order);
}

class OrderPositionsCompanion extends UpdateCompanion<OrderPosition> {
  final Value<int> id;
  final Value<int> order;
  const OrderPositionsCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
  });
  OrderPositionsCompanion.insert({
    this.id = const Value.absent(),
    @required int order,
  }) : order = Value(order);
  static Insertable<OrderPosition> custom({
    Expression<int> id,
    Expression<int> order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
    });
  }

  OrderPositionsCompanion copyWith({Value<int> id, Value<int> order}) {
    return OrderPositionsCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderPositionsCompanion(')
          ..write('id: $id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $OrderPositionsTable extends OrderPositions
    with TableInfo<$OrderPositionsTable, OrderPosition> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrderPositionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  @override
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, false,
        $customConstraints: 'REFERENCES orders(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, order];
  @override
  $OrderPositionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'order_positions';
  @override
  final String actualTableName = 'order_positions';
  @override
  VerificationContext validateIntegrity(Insertable<OrderPosition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderPosition map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OrderPosition.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OrderPositionsTable createAlias(String alias) {
    return $OrderPositionsTable(_db, alias);
  }
}

class ProductionOrder extends DataClass implements Insertable<ProductionOrder> {
  /// primary key
  final int id;

  /// production order number
  final String productionOrderNr;
  ProductionOrder({@required this.id, @required this.productionOrderNr});
  factory ProductionOrder.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ProductionOrder(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      productionOrderNr: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}production_order_nr']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || productionOrderNr != null) {
      map['production_order_nr'] = Variable<String>(productionOrderNr);
    }
    return map;
  }

  ProductionOrdersCompanion toCompanion(bool nullToAbsent) {
    return ProductionOrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      productionOrderNr: productionOrderNr == null && nullToAbsent
          ? const Value.absent()
          : Value(productionOrderNr),
    );
  }

  factory ProductionOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionOrder(
      id: serializer.fromJson<int>(json['id']),
      productionOrderNr: serializer.fromJson<String>(json['productionOrderNr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productionOrderNr': serializer.toJson<String>(productionOrderNr),
    };
  }

  ProductionOrder copyWith({int id, String productionOrderNr}) =>
      ProductionOrder(
        id: id ?? this.id,
        productionOrderNr: productionOrderNr ?? this.productionOrderNr,
      );
  @override
  String toString() {
    return (StringBuffer('ProductionOrder(')
          ..write('id: $id, ')
          ..write('productionOrderNr: $productionOrderNr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, productionOrderNr.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProductionOrder &&
          other.id == this.id &&
          other.productionOrderNr == this.productionOrderNr);
}

class ProductionOrdersCompanion extends UpdateCompanion<ProductionOrder> {
  final Value<int> id;
  final Value<String> productionOrderNr;
  const ProductionOrdersCompanion({
    this.id = const Value.absent(),
    this.productionOrderNr = const Value.absent(),
  });
  ProductionOrdersCompanion.insert({
    this.id = const Value.absent(),
    @required String productionOrderNr,
  }) : productionOrderNr = Value(productionOrderNr);
  static Insertable<ProductionOrder> custom({
    Expression<int> id,
    Expression<String> productionOrderNr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productionOrderNr != null) 'production_order_nr': productionOrderNr,
    });
  }

  ProductionOrdersCompanion copyWith(
      {Value<int> id, Value<String> productionOrderNr}) {
    return ProductionOrdersCompanion(
      id: id ?? this.id,
      productionOrderNr: productionOrderNr ?? this.productionOrderNr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productionOrderNr.present) {
      map['production_order_nr'] = Variable<String>(productionOrderNr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionOrdersCompanion(')
          ..write('id: $id, ')
          ..write('productionOrderNr: $productionOrderNr')
          ..write(')'))
        .toString();
  }
}

class $ProductionOrdersTable extends ProductionOrders
    with TableInfo<$ProductionOrdersTable, ProductionOrder> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductionOrdersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _productionOrderNrMeta =
      const VerificationMeta('productionOrderNr');
  GeneratedTextColumn _productionOrderNr;
  @override
  GeneratedTextColumn get productionOrderNr =>
      _productionOrderNr ??= _constructProductionOrderNr();
  GeneratedTextColumn _constructProductionOrderNr() {
    return GeneratedTextColumn(
      'production_order_nr',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, productionOrderNr];
  @override
  $ProductionOrdersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'production_orders';
  @override
  final String actualTableName = 'production_orders';
  @override
  VerificationContext validateIntegrity(Insertable<ProductionOrder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('production_order_nr')) {
      context.handle(
          _productionOrderNrMeta,
          productionOrderNr.isAcceptableOrUnknown(
              data['production_order_nr'], _productionOrderNrMeta));
    } else if (isInserting) {
      context.missing(_productionOrderNrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionOrder map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductionOrder.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductionOrdersTable createAlias(String alias) {
    return $ProductionOrdersTable(_db, alias);
  }
}

class ProductionMaterial extends DataClass
    implements Insertable<ProductionMaterial> {
  /// primary key
  final int id;

  /// foreign key -> production order
  final int order;
  ProductionMaterial({@required this.id, @required this.order});
  factory ProductionMaterial.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ProductionMaterial(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    return map;
  }

  ProductionMaterialsCompanion toCompanion(bool nullToAbsent) {
    return ProductionMaterialsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
    );
  }

  factory ProductionMaterial.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionMaterial(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
    };
  }

  ProductionMaterial copyWith({int id, int order}) => ProductionMaterial(
        id: id ?? this.id,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('ProductionMaterial(')
          ..write('id: $id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, order.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProductionMaterial &&
          other.id == this.id &&
          other.order == this.order);
}

class ProductionMaterialsCompanion extends UpdateCompanion<ProductionMaterial> {
  final Value<int> id;
  final Value<int> order;
  const ProductionMaterialsCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
  });
  ProductionMaterialsCompanion.insert({
    this.id = const Value.absent(),
    @required int order,
  }) : order = Value(order);
  static Insertable<ProductionMaterial> custom({
    Expression<int> id,
    Expression<int> order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
    });
  }

  ProductionMaterialsCompanion copyWith({Value<int> id, Value<int> order}) {
    return ProductionMaterialsCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionMaterialsCompanion(')
          ..write('id: $id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $ProductionMaterialsTable extends ProductionMaterials
    with TableInfo<$ProductionMaterialsTable, ProductionMaterial> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductionMaterialsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  @override
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, false,
        $customConstraints: 'REFERENCES orders(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, order];
  @override
  $ProductionMaterialsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'production_materials';
  @override
  final String actualTableName = 'production_materials';
  @override
  VerificationContext validateIntegrity(Insertable<ProductionMaterial> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionMaterial map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductionMaterial.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductionMaterialsTable createAlias(String alias) {
    return $ProductionMaterialsTable(_db, alias);
  }
}

class ProductionResult extends DataClass
    implements Insertable<ProductionResult> {
  /// primary key
  final int id;

  /// foreign key -> production order
  final int order;
  ProductionResult({@required this.id, @required this.order});
  factory ProductionResult.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ProductionResult(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    return map;
  }

  ProductionResultsCompanion toCompanion(bool nullToAbsent) {
    return ProductionResultsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
    );
  }

  factory ProductionResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionResult(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
    };
  }

  ProductionResult copyWith({int id, int order}) => ProductionResult(
        id: id ?? this.id,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('ProductionResult(')
          ..write('id: $id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, order.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProductionResult &&
          other.id == this.id &&
          other.order == this.order);
}

class ProductionResultsCompanion extends UpdateCompanion<ProductionResult> {
  final Value<int> id;
  final Value<int> order;
  const ProductionResultsCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
  });
  ProductionResultsCompanion.insert({
    this.id = const Value.absent(),
    @required int order,
  }) : order = Value(order);
  static Insertable<ProductionResult> custom({
    Expression<int> id,
    Expression<int> order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
    });
  }

  ProductionResultsCompanion copyWith({Value<int> id, Value<int> order}) {
    return ProductionResultsCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionResultsCompanion(')
          ..write('id: $id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $ProductionResultsTable extends ProductionResults
    with TableInfo<$ProductionResultsTable, ProductionResult> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductionResultsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  @override
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, false,
        $customConstraints: 'REFERENCES orders(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, order];
  @override
  $ProductionResultsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'production_results';
  @override
  final String actualTableName = 'production_results';
  @override
  VerificationContext validateIntegrity(Insertable<ProductionResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionResult map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductionResult.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductionResultsTable createAlias(String alias) {
    return $ProductionResultsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PacketsTable _packets;
  $PacketsTable get packets => _packets ??= $PacketsTable(this);
  $ProductsTable _products;
  $ProductsTable get products => _products ??= $ProductsTable(this);
  $OrdersTable _orders;
  $OrdersTable get orders => _orders ??= $OrdersTable(this);
  $OrderPositionsTable _orderPositions;
  $OrderPositionsTable get orderPositions =>
      _orderPositions ??= $OrderPositionsTable(this);
  $ProductionOrdersTable _productionOrders;
  $ProductionOrdersTable get productionOrders =>
      _productionOrders ??= $ProductionOrdersTable(this);
  $ProductionMaterialsTable _productionMaterials;
  $ProductionMaterialsTable get productionMaterials =>
      _productionMaterials ??= $ProductionMaterialsTable(this);
  $ProductionResultsTable _productionResults;
  $ProductionResultsTable get productionResults =>
      _productionResults ??= $ProductionResultsTable(this);
  ProductionDao _productionDao;
  ProductionDao get productionDao =>
      _productionDao ??= ProductionDao(this as Database);
  PacketsDao _packetsDao;
  PacketsDao get packetsDao => _packetsDao ??= PacketsDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        packets,
        products,
        orders,
        orderPositions,
        productionOrders,
        productionMaterials,
        productionResults
      ];
}
