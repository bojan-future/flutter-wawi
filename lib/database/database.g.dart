// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  /// primary key
  final int id;

  /// barcode
  final String barcode;

  /// user number
  final String userNr;
  User({required this.id, required this.barcode, required this.userNr});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      barcode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}barcode'])!,
      userNr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_nr'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['barcode'] = Variable<String>(barcode);
    map['user_nr'] = Variable<String>(userNr);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      barcode: Value(barcode),
      userNr: Value(userNr),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      barcode: serializer.fromJson<String>(json['barcode']),
      userNr: serializer.fromJson<String>(json['userNr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'barcode': serializer.toJson<String>(barcode),
      'userNr': serializer.toJson<String>(userNr),
    };
  }

  User copyWith({int? id, String? barcode, String? userNr}) => User(
        id: id ?? this.id,
        barcode: barcode ?? this.barcode,
        userNr: userNr ?? this.userNr,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('userNr: $userNr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(barcode.hashCode, userNr.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.barcode == this.barcode &&
          other.userNr == this.userNr);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> barcode;
  final Value<String> userNr;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    this.userNr = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String barcode,
    required String userNr,
  })  : barcode = Value(barcode),
        userNr = Value(userNr);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? barcode,
    Expression<String>? userNr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barcode != null) 'barcode': barcode,
      if (userNr != null) 'user_nr': userNr,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id, Value<String>? barcode, Value<String>? userNr}) {
    return UsersCompanion(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      userNr: userNr ?? this.userNr,
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
    if (userNr.present) {
      map['user_nr'] = Variable<String>(userNr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('userNr: $userNr')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  @override
  late final GeneratedTextColumn barcode = _constructBarcode();
  GeneratedTextColumn _constructBarcode() {
    return GeneratedTextColumn(
      'barcode',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userNrMeta = const VerificationMeta('userNr');
  @override
  late final GeneratedTextColumn userNr = _constructUserNr();
  GeneratedTextColumn _constructUserNr() {
    return GeneratedTextColumn(
      'user_nr',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, barcode, userNr];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('user_nr')) {
      context.handle(_userNrMeta,
          userNr.isAcceptableOrUnknown(data['user_nr']!, _userNrMeta));
    } else if (isInserting) {
      context.missing(_userNrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

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

  /// product name from product
  final String productName;

  /// product number from product
  final String productNr;

  /// foreign key -> 'parent' packet in case this is part of larger packet,
  /// might be null
  final int? wrapping;
  Packet(
      {required this.id,
      required this.barcode,
      required this.lot,
      required this.quantity,
      required this.product,
      required this.productName,
      required this.productNr,
      this.wrapping});
  factory Packet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Packet(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      barcode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}barcode'])!,
      lot: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lot'])!,
      quantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      product:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}product'])!,
      productName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
      productNr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_nr'])!,
      wrapping:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}wrapping']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['barcode'] = Variable<String>(barcode);
    map['lot'] = Variable<String>(lot);
    map['quantity'] = Variable<double>(quantity);
    map['product'] = Variable<int>(product);
    map['product_name'] = Variable<String>(productName);
    map['product_nr'] = Variable<String>(productNr);
    if (!nullToAbsent || wrapping != null) {
      map['wrapping'] = Variable<int?>(wrapping);
    }
    return map;
  }

  PacketsCompanion toCompanion(bool nullToAbsent) {
    return PacketsCompanion(
      id: Value(id),
      barcode: Value(barcode),
      lot: Value(lot),
      quantity: Value(quantity),
      product: Value(product),
      productName: Value(productName),
      productNr: Value(productNr),
      wrapping: wrapping == null && nullToAbsent
          ? const Value.absent()
          : Value(wrapping),
    );
  }

  factory Packet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Packet(
      id: serializer.fromJson<int>(json['id']),
      barcode: serializer.fromJson<String>(json['barcode']),
      lot: serializer.fromJson<String>(json['lot']),
      quantity: serializer.fromJson<double>(json['quantity']),
      product: serializer.fromJson<int>(json['product']),
      productName: serializer.fromJson<String>(json['productName']),
      productNr: serializer.fromJson<String>(json['productNr']),
      wrapping: serializer.fromJson<int?>(json['wrapping']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'barcode': serializer.toJson<String>(barcode),
      'lot': serializer.toJson<String>(lot),
      'quantity': serializer.toJson<double>(quantity),
      'product': serializer.toJson<int>(product),
      'productName': serializer.toJson<String>(productName),
      'productNr': serializer.toJson<String>(productNr),
      'wrapping': serializer.toJson<int?>(wrapping),
    };
  }

  Packet copyWith(
          {int? id,
          String? barcode,
          String? lot,
          double? quantity,
          int? product,
          String? productName,
          String? productNr,
          int? wrapping}) =>
      Packet(
        id: id ?? this.id,
        barcode: barcode ?? this.barcode,
        lot: lot ?? this.lot,
        quantity: quantity ?? this.quantity,
        product: product ?? this.product,
        productName: productName ?? this.productName,
        productNr: productNr ?? this.productNr,
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
          ..write('productName: $productName, ')
          ..write('productNr: $productNr, ')
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
              $mrjc(
                  quantity.hashCode,
                  $mrjc(
                      product.hashCode,
                      $mrjc(productName.hashCode,
                          $mrjc(productNr.hashCode, wrapping.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Packet &&
          other.id == this.id &&
          other.barcode == this.barcode &&
          other.lot == this.lot &&
          other.quantity == this.quantity &&
          other.product == this.product &&
          other.productName == this.productName &&
          other.productNr == this.productNr &&
          other.wrapping == this.wrapping);
}

class PacketsCompanion extends UpdateCompanion<Packet> {
  final Value<int> id;
  final Value<String> barcode;
  final Value<String> lot;
  final Value<double> quantity;
  final Value<int> product;
  final Value<String> productName;
  final Value<String> productNr;
  final Value<int?> wrapping;
  const PacketsCompanion({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    this.lot = const Value.absent(),
    this.quantity = const Value.absent(),
    this.product = const Value.absent(),
    this.productName = const Value.absent(),
    this.productNr = const Value.absent(),
    this.wrapping = const Value.absent(),
  });
  PacketsCompanion.insert({
    this.id = const Value.absent(),
    required String barcode,
    required String lot,
    required double quantity,
    required int product,
    required String productName,
    required String productNr,
    this.wrapping = const Value.absent(),
  })  : barcode = Value(barcode),
        lot = Value(lot),
        quantity = Value(quantity),
        product = Value(product),
        productName = Value(productName),
        productNr = Value(productNr);
  static Insertable<Packet> custom({
    Expression<int>? id,
    Expression<String>? barcode,
    Expression<String>? lot,
    Expression<double>? quantity,
    Expression<int>? product,
    Expression<String>? productName,
    Expression<String>? productNr,
    Expression<int?>? wrapping,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barcode != null) 'barcode': barcode,
      if (lot != null) 'lot': lot,
      if (quantity != null) 'quantity': quantity,
      if (product != null) 'product': product,
      if (productName != null) 'product_name': productName,
      if (productNr != null) 'product_nr': productNr,
      if (wrapping != null) 'wrapping': wrapping,
    });
  }

  PacketsCompanion copyWith(
      {Value<int>? id,
      Value<String>? barcode,
      Value<String>? lot,
      Value<double>? quantity,
      Value<int>? product,
      Value<String>? productName,
      Value<String>? productNr,
      Value<int?>? wrapping}) {
    return PacketsCompanion(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      lot: lot ?? this.lot,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
      productName: productName ?? this.productName,
      productNr: productNr ?? this.productNr,
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
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productNr.present) {
      map['product_nr'] = Variable<String>(productNr.value);
    }
    if (wrapping.present) {
      map['wrapping'] = Variable<int?>(wrapping.value);
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
          ..write('productName: $productName, ')
          ..write('productNr: $productNr, ')
          ..write('wrapping: $wrapping')
          ..write(')'))
        .toString();
  }
}

class $PacketsTable extends Packets with TableInfo<$PacketsTable, Packet> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PacketsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  @override
  late final GeneratedTextColumn barcode = _constructBarcode();
  GeneratedTextColumn _constructBarcode() {
    return GeneratedTextColumn(
      'barcode',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lotMeta = const VerificationMeta('lot');
  @override
  late final GeneratedTextColumn lot = _constructLot();
  GeneratedTextColumn _constructLot() {
    return GeneratedTextColumn(
      'lot',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  @override
  late final GeneratedRealColumn quantity = _constructQuantity();
  GeneratedRealColumn _constructQuantity() {
    return GeneratedRealColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productMeta = const VerificationMeta('product');
  @override
  late final GeneratedIntColumn product = _constructProduct();
  GeneratedIntColumn _constructProduct() {
    return GeneratedIntColumn('product', $tableName, false,
        $customConstraints: 'REFERENCES products(id)');
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedTextColumn productName = _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn(
      'product_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productNrMeta = const VerificationMeta('productNr');
  @override
  late final GeneratedTextColumn productNr = _constructProductNr();
  GeneratedTextColumn _constructProductNr() {
    return GeneratedTextColumn(
      'product_nr',
      $tableName,
      false,
    );
  }

  final VerificationMeta _wrappingMeta = const VerificationMeta('wrapping');
  @override
  late final GeneratedIntColumn wrapping = _constructWrapping();
  GeneratedIntColumn _constructWrapping() {
    return GeneratedIntColumn('wrapping', $tableName, true,
        $customConstraints: 'NULLABLE REFERENCES packets(id)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, barcode, lot, quantity, product, productName, productNr, wrapping];
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('lot')) {
      context.handle(
          _lotMeta, lot.isAcceptableOrUnknown(data['lot']!, _lotMeta));
    } else if (isInserting) {
      context.missing(_lotMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_nr')) {
      context.handle(_productNrMeta,
          productNr.isAcceptableOrUnknown(data['product_nr']!, _productNrMeta));
    } else if (isInserting) {
      context.missing(_productNrMeta);
    }
    if (data.containsKey('wrapping')) {
      context.handle(_wrappingMeta,
          wrapping.isAcceptableOrUnknown(data['wrapping']!, _wrappingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Packet map(Map<String, dynamic> data, {String? tablePrefix}) {
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

  /// product name
  final String productName;

  /// gtin 1
  final int gtin1;

  /// gtin 2
  final int gtin2;

  /// gtin 3
  final int gtin3;

  /// gtin 4
  final int gtin4;

  /// gtin 5
  final int gtin5;
  Product(
      {required this.id,
      required this.productNr,
      required this.productName,
      required this.gtin1,
      required this.gtin2,
      required this.gtin3,
      required this.gtin4,
      required this.gtin5});
  factory Product.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Product(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      productNr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_nr'])!,
      productName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
      gtin1: intType.mapFromDatabaseResponse(data['${effectivePrefix}gtin1'])!,
      gtin2: intType.mapFromDatabaseResponse(data['${effectivePrefix}gtin2'])!,
      gtin3: intType.mapFromDatabaseResponse(data['${effectivePrefix}gtin3'])!,
      gtin4: intType.mapFromDatabaseResponse(data['${effectivePrefix}gtin4'])!,
      gtin5: intType.mapFromDatabaseResponse(data['${effectivePrefix}gtin5'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_nr'] = Variable<String>(productNr);
    map['product_name'] = Variable<String>(productName);
    map['gtin1'] = Variable<int>(gtin1);
    map['gtin2'] = Variable<int>(gtin2);
    map['gtin3'] = Variable<int>(gtin3);
    map['gtin4'] = Variable<int>(gtin4);
    map['gtin5'] = Variable<int>(gtin5);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      productNr: Value(productNr),
      productName: Value(productName),
      gtin1: Value(gtin1),
      gtin2: Value(gtin2),
      gtin3: Value(gtin3),
      gtin4: Value(gtin4),
      gtin5: Value(gtin5),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      productNr: serializer.fromJson<String>(json['productNr']),
      productName: serializer.fromJson<String>(json['productName']),
      gtin1: serializer.fromJson<int>(json['gtin1']),
      gtin2: serializer.fromJson<int>(json['gtin2']),
      gtin3: serializer.fromJson<int>(json['gtin3']),
      gtin4: serializer.fromJson<int>(json['gtin4']),
      gtin5: serializer.fromJson<int>(json['gtin5']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productNr': serializer.toJson<String>(productNr),
      'productName': serializer.toJson<String>(productName),
      'gtin1': serializer.toJson<int>(gtin1),
      'gtin2': serializer.toJson<int>(gtin2),
      'gtin3': serializer.toJson<int>(gtin3),
      'gtin4': serializer.toJson<int>(gtin4),
      'gtin5': serializer.toJson<int>(gtin5),
    };
  }

  Product copyWith(
          {int? id,
          String? productNr,
          String? productName,
          int? gtin1,
          int? gtin2,
          int? gtin3,
          int? gtin4,
          int? gtin5}) =>
      Product(
        id: id ?? this.id,
        productNr: productNr ?? this.productNr,
        productName: productName ?? this.productName,
        gtin1: gtin1 ?? this.gtin1,
        gtin2: gtin2 ?? this.gtin2,
        gtin3: gtin3 ?? this.gtin3,
        gtin4: gtin4 ?? this.gtin4,
        gtin5: gtin5 ?? this.gtin5,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('productNr: $productNr, ')
          ..write('productName: $productName, ')
          ..write('gtin1: $gtin1, ')
          ..write('gtin2: $gtin2, ')
          ..write('gtin3: $gtin3, ')
          ..write('gtin4: $gtin4, ')
          ..write('gtin5: $gtin5')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          productNr.hashCode,
          $mrjc(
              productName.hashCode,
              $mrjc(
                  gtin1.hashCode,
                  $mrjc(
                      gtin2.hashCode,
                      $mrjc(gtin3.hashCode,
                          $mrjc(gtin4.hashCode, gtin5.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.productNr == this.productNr &&
          other.productName == this.productName &&
          other.gtin1 == this.gtin1 &&
          other.gtin2 == this.gtin2 &&
          other.gtin3 == this.gtin3 &&
          other.gtin4 == this.gtin4 &&
          other.gtin5 == this.gtin5);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> productNr;
  final Value<String> productName;
  final Value<int> gtin1;
  final Value<int> gtin2;
  final Value<int> gtin3;
  final Value<int> gtin4;
  final Value<int> gtin5;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.productNr = const Value.absent(),
    this.productName = const Value.absent(),
    this.gtin1 = const Value.absent(),
    this.gtin2 = const Value.absent(),
    this.gtin3 = const Value.absent(),
    this.gtin4 = const Value.absent(),
    this.gtin5 = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String productNr,
    required String productName,
    required int gtin1,
    required int gtin2,
    required int gtin3,
    required int gtin4,
    required int gtin5,
  })  : productNr = Value(productNr),
        productName = Value(productName),
        gtin1 = Value(gtin1),
        gtin2 = Value(gtin2),
        gtin3 = Value(gtin3),
        gtin4 = Value(gtin4),
        gtin5 = Value(gtin5);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? productNr,
    Expression<String>? productName,
    Expression<int>? gtin1,
    Expression<int>? gtin2,
    Expression<int>? gtin3,
    Expression<int>? gtin4,
    Expression<int>? gtin5,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productNr != null) 'product_nr': productNr,
      if (productName != null) 'product_name': productName,
      if (gtin1 != null) 'gtin1': gtin1,
      if (gtin2 != null) 'gtin2': gtin2,
      if (gtin3 != null) 'gtin3': gtin3,
      if (gtin4 != null) 'gtin4': gtin4,
      if (gtin5 != null) 'gtin5': gtin5,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? productNr,
      Value<String>? productName,
      Value<int>? gtin1,
      Value<int>? gtin2,
      Value<int>? gtin3,
      Value<int>? gtin4,
      Value<int>? gtin5}) {
    return ProductsCompanion(
      id: id ?? this.id,
      productNr: productNr ?? this.productNr,
      productName: productName ?? this.productName,
      gtin1: gtin1 ?? this.gtin1,
      gtin2: gtin2 ?? this.gtin2,
      gtin3: gtin3 ?? this.gtin3,
      gtin4: gtin4 ?? this.gtin4,
      gtin5: gtin5 ?? this.gtin5,
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
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (gtin1.present) {
      map['gtin1'] = Variable<int>(gtin1.value);
    }
    if (gtin2.present) {
      map['gtin2'] = Variable<int>(gtin2.value);
    }
    if (gtin3.present) {
      map['gtin3'] = Variable<int>(gtin3.value);
    }
    if (gtin4.present) {
      map['gtin4'] = Variable<int>(gtin4.value);
    }
    if (gtin5.present) {
      map['gtin5'] = Variable<int>(gtin5.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('productNr: $productNr, ')
          ..write('productName: $productName, ')
          ..write('gtin1: $gtin1, ')
          ..write('gtin2: $gtin2, ')
          ..write('gtin3: $gtin3, ')
          ..write('gtin4: $gtin4, ')
          ..write('gtin5: $gtin5')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProductsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _productNrMeta = const VerificationMeta('productNr');
  @override
  late final GeneratedTextColumn productNr = _constructProductNr();
  GeneratedTextColumn _constructProductNr() {
    return GeneratedTextColumn(
      'product_nr',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedTextColumn productName = _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn(
      'product_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gtin1Meta = const VerificationMeta('gtin1');
  @override
  late final GeneratedIntColumn gtin1 = _constructGtin1();
  GeneratedIntColumn _constructGtin1() {
    return GeneratedIntColumn(
      'gtin1',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gtin2Meta = const VerificationMeta('gtin2');
  @override
  late final GeneratedIntColumn gtin2 = _constructGtin2();
  GeneratedIntColumn _constructGtin2() {
    return GeneratedIntColumn(
      'gtin2',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gtin3Meta = const VerificationMeta('gtin3');
  @override
  late final GeneratedIntColumn gtin3 = _constructGtin3();
  GeneratedIntColumn _constructGtin3() {
    return GeneratedIntColumn(
      'gtin3',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gtin4Meta = const VerificationMeta('gtin4');
  @override
  late final GeneratedIntColumn gtin4 = _constructGtin4();
  GeneratedIntColumn _constructGtin4() {
    return GeneratedIntColumn(
      'gtin4',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gtin5Meta = const VerificationMeta('gtin5');
  @override
  late final GeneratedIntColumn gtin5 = _constructGtin5();
  GeneratedIntColumn _constructGtin5() {
    return GeneratedIntColumn(
      'gtin5',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, productNr, productName, gtin1, gtin2, gtin3, gtin4, gtin5];
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_nr')) {
      context.handle(_productNrMeta,
          productNr.isAcceptableOrUnknown(data['product_nr']!, _productNrMeta));
    } else if (isInserting) {
      context.missing(_productNrMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('gtin1')) {
      context.handle(
          _gtin1Meta, gtin1.isAcceptableOrUnknown(data['gtin1']!, _gtin1Meta));
    } else if (isInserting) {
      context.missing(_gtin1Meta);
    }
    if (data.containsKey('gtin2')) {
      context.handle(
          _gtin2Meta, gtin2.isAcceptableOrUnknown(data['gtin2']!, _gtin2Meta));
    } else if (isInserting) {
      context.missing(_gtin2Meta);
    }
    if (data.containsKey('gtin3')) {
      context.handle(
          _gtin3Meta, gtin3.isAcceptableOrUnknown(data['gtin3']!, _gtin3Meta));
    } else if (isInserting) {
      context.missing(_gtin3Meta);
    }
    if (data.containsKey('gtin4')) {
      context.handle(
          _gtin4Meta, gtin4.isAcceptableOrUnknown(data['gtin4']!, _gtin4Meta));
    } else if (isInserting) {
      context.missing(_gtin4Meta);
    }
    if (data.containsKey('gtin5')) {
      context.handle(
          _gtin5Meta, gtin5.isAcceptableOrUnknown(data['gtin5']!, _gtin5Meta));
    } else if (isInserting) {
      context.missing(_gtin5Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
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

  /// foreign key -> user
  final int user;
  Order({required this.id, required this.orderNr, required this.user});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Order(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      orderNr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_nr'])!,
      user: intType.mapFromDatabaseResponse(data['${effectivePrefix}user'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_nr'] = Variable<String>(orderNr);
    map['user'] = Variable<int>(user);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      orderNr: Value(orderNr),
      user: Value(user),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      orderNr: serializer.fromJson<String>(json['orderNr']),
      user: serializer.fromJson<int>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderNr': serializer.toJson<String>(orderNr),
      'user': serializer.toJson<int>(user),
    };
  }

  Order copyWith({int? id, String? orderNr, int? user}) => Order(
        id: id ?? this.id,
        orderNr: orderNr ?? this.orderNr,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('orderNr: $orderNr, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(orderNr.hashCode, user.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.orderNr == this.orderNr &&
          other.user == this.user);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> orderNr;
  final Value<int> user;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.orderNr = const Value.absent(),
    this.user = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String orderNr,
    required int user,
  })  : orderNr = Value(orderNr),
        user = Value(user);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? orderNr,
    Expression<int>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderNr != null) 'order_nr': orderNr,
      if (user != null) 'user': user,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id, Value<String>? orderNr, Value<int>? user}) {
    return OrdersCompanion(
      id: id ?? this.id,
      orderNr: orderNr ?? this.orderNr,
      user: user ?? this.user,
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
    if (user.present) {
      map['user'] = Variable<int>(user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('orderNr: $orderNr, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderNrMeta = const VerificationMeta('orderNr');
  @override
  late final GeneratedTextColumn orderNr = _constructOrderNr();
  GeneratedTextColumn _constructOrderNr() {
    return GeneratedTextColumn(
      'order_nr',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedIntColumn user = _constructUser();
  GeneratedIntColumn _constructUser() {
    return GeneratedIntColumn('user', $tableName, false,
        $customConstraints: 'REFERENCES users(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, orderNr, user];
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_nr')) {
      context.handle(_orderNrMeta,
          orderNr.isAcceptableOrUnknown(data['order_nr']!, _orderNrMeta));
    } else if (isInserting) {
      context.missing(_orderNrMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
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
  OrderPosition({required this.id, required this.order});
  factory OrderPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return OrderPosition(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order'] = Variable<int>(order);
    return map;
  }

  OrderPositionsCompanion toCompanion(bool nullToAbsent) {
    return OrderPositionsCompanion(
      id: Value(id),
      order: Value(order),
    );
  }

  factory OrderPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OrderPosition(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
    };
  }

  OrderPosition copyWith({int? id, int? order}) => OrderPosition(
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
    required int order,
  }) : order = Value(order);
  static Insertable<OrderPosition> custom({
    Expression<int>? id,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
    });
  }

  OrderPositionsCompanion copyWith({Value<int>? id, Value<int>? order}) {
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
  final String? _alias;
  $OrderPositionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedIntColumn order = _constructOrder();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderPosition map(Map<String, dynamic> data, {String? tablePrefix}) {
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
  ProductionOrder({required this.id, required this.productionOrderNr});
  factory ProductionOrder.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ProductionOrder(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      productionOrderNr: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}production_order_nr'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['production_order_nr'] = Variable<String>(productionOrderNr);
    return map;
  }

  ProductionOrdersCompanion toCompanion(bool nullToAbsent) {
    return ProductionOrdersCompanion(
      id: Value(id),
      productionOrderNr: Value(productionOrderNr),
    );
  }

  factory ProductionOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionOrder(
      id: serializer.fromJson<int>(json['id']),
      productionOrderNr: serializer.fromJson<String>(json['productionOrderNr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productionOrderNr': serializer.toJson<String>(productionOrderNr),
    };
  }

  ProductionOrder copyWith({int? id, String? productionOrderNr}) =>
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
    required String productionOrderNr,
  }) : productionOrderNr = Value(productionOrderNr);
  static Insertable<ProductionOrder> custom({
    Expression<int>? id,
    Expression<String>? productionOrderNr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productionOrderNr != null) 'production_order_nr': productionOrderNr,
    });
  }

  ProductionOrdersCompanion copyWith(
      {Value<int>? id, Value<String>? productionOrderNr}) {
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
  final String? _alias;
  $ProductionOrdersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _productionOrderNrMeta =
      const VerificationMeta('productionOrderNr');
  @override
  late final GeneratedTextColumn productionOrderNr =
      _constructProductionOrderNr();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('production_order_nr')) {
      context.handle(
          _productionOrderNrMeta,
          productionOrderNr.isAcceptableOrUnknown(
              data['production_order_nr']!, _productionOrderNrMeta));
    } else if (isInserting) {
      context.missing(_productionOrderNrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
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
  ProductionMaterial({required this.id, required this.order});
  factory ProductionMaterial.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ProductionMaterial(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order'] = Variable<int>(order);
    return map;
  }

  ProductionMaterialsCompanion toCompanion(bool nullToAbsent) {
    return ProductionMaterialsCompanion(
      id: Value(id),
      order: Value(order),
    );
  }

  factory ProductionMaterial.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionMaterial(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
    };
  }

  ProductionMaterial copyWith({int? id, int? order}) => ProductionMaterial(
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
    required int order,
  }) : order = Value(order);
  static Insertable<ProductionMaterial> custom({
    Expression<int>? id,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
    });
  }

  ProductionMaterialsCompanion copyWith({Value<int>? id, Value<int>? order}) {
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
  final String? _alias;
  $ProductionMaterialsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedIntColumn order = _constructOrder();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionMaterial map(Map<String, dynamic> data, {String? tablePrefix}) {
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
  ProductionResult({required this.id, required this.order});
  factory ProductionResult.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ProductionResult(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order'] = Variable<int>(order);
    return map;
  }

  ProductionResultsCompanion toCompanion(bool nullToAbsent) {
    return ProductionResultsCompanion(
      id: Value(id),
      order: Value(order),
    );
  }

  factory ProductionResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionResult(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
    };
  }

  ProductionResult copyWith({int? id, int? order}) => ProductionResult(
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
    required int order,
  }) : order = Value(order);
  static Insertable<ProductionResult> custom({
    Expression<int>? id,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
    });
  }

  ProductionResultsCompanion copyWith({Value<int>? id, Value<int>? order}) {
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
  final String? _alias;
  $ProductionResultsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedIntColumn order = _constructOrder();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductionResult.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductionResultsTable createAlias(String alias) {
    return $ProductionResultsTable(_db, alias);
  }
}

class Delivery extends DataClass implements Insertable<Delivery> {
  /// primary key
  final int id;

  /// foreign key -> user
  final int user;
  Delivery({required this.id, required this.user});
  factory Delivery.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return Delivery(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      user: intType.mapFromDatabaseResponse(data['${effectivePrefix}user'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user'] = Variable<int>(user);
    return map;
  }

  DeliveriesCompanion toCompanion(bool nullToAbsent) {
    return DeliveriesCompanion(
      id: Value(id),
      user: Value(user),
    );
  }

  factory Delivery.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Delivery(
      id: serializer.fromJson<int>(json['id']),
      user: serializer.fromJson<int>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'user': serializer.toJson<int>(user),
    };
  }

  Delivery copyWith({int? id, int? user}) => Delivery(
        id: id ?? this.id,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('Delivery(')
          ..write('id: $id, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, user.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Delivery && other.id == this.id && other.user == this.user);
}

class DeliveriesCompanion extends UpdateCompanion<Delivery> {
  final Value<int> id;
  final Value<int> user;
  const DeliveriesCompanion({
    this.id = const Value.absent(),
    this.user = const Value.absent(),
  });
  DeliveriesCompanion.insert({
    this.id = const Value.absent(),
    required int user,
  }) : user = Value(user);
  static Insertable<Delivery> custom({
    Expression<int>? id,
    Expression<int>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (user != null) 'user': user,
    });
  }

  DeliveriesCompanion copyWith({Value<int>? id, Value<int>? user}) {
    return DeliveriesCompanion(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (user.present) {
      map['user'] = Variable<int>(user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeliveriesCompanion(')
          ..write('id: $id, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $DeliveriesTable extends Deliveries
    with TableInfo<$DeliveriesTable, Delivery> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DeliveriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedIntColumn user = _constructUser();
  GeneratedIntColumn _constructUser() {
    return GeneratedIntColumn('user', $tableName, false,
        $customConstraints: 'REFERENCES users(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, user];
  @override
  $DeliveriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'deliveries';
  @override
  final String actualTableName = 'deliveries';
  @override
  VerificationContext validateIntegrity(Insertable<Delivery> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Delivery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Delivery.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DeliveriesTable createAlias(String alias) {
    return $DeliveriesTable(_db, alias);
  }
}

class DeliveryPosition extends DataClass
    implements Insertable<DeliveryPosition> {
  /// primary key
  final int id;

  /// foreign key -> delivery
  final int delivery;

  /// foreign key -> packets
  final int packet;
  DeliveryPosition(
      {required this.id, required this.delivery, required this.packet});
  factory DeliveryPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return DeliveryPosition(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      delivery:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}delivery'])!,
      packet:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}packet'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['delivery'] = Variable<int>(delivery);
    map['packet'] = Variable<int>(packet);
    return map;
  }

  DeliveryPositionsCompanion toCompanion(bool nullToAbsent) {
    return DeliveryPositionsCompanion(
      id: Value(id),
      delivery: Value(delivery),
      packet: Value(packet),
    );
  }

  factory DeliveryPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DeliveryPosition(
      id: serializer.fromJson<int>(json['id']),
      delivery: serializer.fromJson<int>(json['delivery']),
      packet: serializer.fromJson<int>(json['packet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'delivery': serializer.toJson<int>(delivery),
      'packet': serializer.toJson<int>(packet),
    };
  }

  DeliveryPosition copyWith({int? id, int? delivery, int? packet}) =>
      DeliveryPosition(
        id: id ?? this.id,
        delivery: delivery ?? this.delivery,
        packet: packet ?? this.packet,
      );
  @override
  String toString() {
    return (StringBuffer('DeliveryPosition(')
          ..write('id: $id, ')
          ..write('delivery: $delivery, ')
          ..write('packet: $packet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(delivery.hashCode, packet.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DeliveryPosition &&
          other.id == this.id &&
          other.delivery == this.delivery &&
          other.packet == this.packet);
}

class DeliveryPositionsCompanion extends UpdateCompanion<DeliveryPosition> {
  final Value<int> id;
  final Value<int> delivery;
  final Value<int> packet;
  const DeliveryPositionsCompanion({
    this.id = const Value.absent(),
    this.delivery = const Value.absent(),
    this.packet = const Value.absent(),
  });
  DeliveryPositionsCompanion.insert({
    this.id = const Value.absent(),
    required int delivery,
    required int packet,
  })  : delivery = Value(delivery),
        packet = Value(packet);
  static Insertable<DeliveryPosition> custom({
    Expression<int>? id,
    Expression<int>? delivery,
    Expression<int>? packet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (delivery != null) 'delivery': delivery,
      if (packet != null) 'packet': packet,
    });
  }

  DeliveryPositionsCompanion copyWith(
      {Value<int>? id, Value<int>? delivery, Value<int>? packet}) {
    return DeliveryPositionsCompanion(
      id: id ?? this.id,
      delivery: delivery ?? this.delivery,
      packet: packet ?? this.packet,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (delivery.present) {
      map['delivery'] = Variable<int>(delivery.value);
    }
    if (packet.present) {
      map['packet'] = Variable<int>(packet.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryPositionsCompanion(')
          ..write('id: $id, ')
          ..write('delivery: $delivery, ')
          ..write('packet: $packet')
          ..write(')'))
        .toString();
  }
}

class $DeliveryPositionsTable extends DeliveryPositions
    with TableInfo<$DeliveryPositionsTable, DeliveryPosition> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DeliveryPositionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _deliveryMeta = const VerificationMeta('delivery');
  @override
  late final GeneratedIntColumn delivery = _constructDelivery();
  GeneratedIntColumn _constructDelivery() {
    return GeneratedIntColumn('delivery', $tableName, false,
        $customConstraints: 'REFERENCES deliveries(id)');
  }

  final VerificationMeta _packetMeta = const VerificationMeta('packet');
  @override
  late final GeneratedIntColumn packet = _constructPacket();
  GeneratedIntColumn _constructPacket() {
    return GeneratedIntColumn('packet', $tableName, false,
        $customConstraints: 'REFERENCES packets(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, delivery, packet];
  @override
  $DeliveryPositionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'delivery_positions';
  @override
  final String actualTableName = 'delivery_positions';
  @override
  VerificationContext validateIntegrity(Insertable<DeliveryPosition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('delivery')) {
      context.handle(_deliveryMeta,
          delivery.isAcceptableOrUnknown(data['delivery']!, _deliveryMeta));
    } else if (isInserting) {
      context.missing(_deliveryMeta);
    }
    if (data.containsKey('packet')) {
      context.handle(_packetMeta,
          packet.isAcceptableOrUnknown(data['packet']!, _packetMeta));
    } else if (isInserting) {
      context.missing(_packetMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeliveryPosition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DeliveryPosition.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DeliveryPositionsTable createAlias(String alias) {
    return $DeliveryPositionsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $PacketsTable packets = $PacketsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $OrderPositionsTable orderPositions = $OrderPositionsTable(this);
  late final $ProductionOrdersTable productionOrders =
      $ProductionOrdersTable(this);
  late final $ProductionMaterialsTable productionMaterials =
      $ProductionMaterialsTable(this);
  late final $ProductionResultsTable productionResults =
      $ProductionResultsTable(this);
  late final $DeliveriesTable deliveries = $DeliveriesTable(this);
  late final $DeliveryPositionsTable deliveryPositions =
      $DeliveryPositionsTable(this);
  late final UsersDao usersDao = UsersDao(this as Database);
  late final PacketsDao packetsDao = PacketsDao(this as Database);
  late final ProductsDao productsDao = ProductsDao(this as Database);
  late final OrdersDao ordersDao = OrdersDao(this as Database);
  late final ProductionDao productionDao = ProductionDao(this as Database);
  late final DeliveriesDao deliveriesDao = DeliveriesDao(this as Database);
  late final DeliveryPositionsDao deliveryPositionsDao =
      DeliveryPositionsDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        packets,
        products,
        orders,
        orderPositions,
        productionOrders,
        productionMaterials,
        productionResults,
        deliveries,
        deliveryPositions
      ];
}
