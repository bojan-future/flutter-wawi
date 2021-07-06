// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class SynchroUpdate extends DataClass implements Insertable<SynchroUpdate> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  ///data type derived from the source table
  final int type;

  /// mark this record as deleted
  final bool deleted;

  ///json containing data to be synchronized
  final String data;
  SynchroUpdate(
      {required this.id,
      required this.uuid,
      required this.type,
      required this.deleted,
      required this.data});
  factory SynchroUpdate.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SynchroUpdate(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      deleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted'])!,
      data: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['type'] = Variable<int>(type);
    map['deleted'] = Variable<bool>(deleted);
    map['data'] = Variable<String>(data);
    return map;
  }

  SynchroUpdatesCompanion toCompanion(bool nullToAbsent) {
    return SynchroUpdatesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      type: Value(type),
      deleted: Value(deleted),
      data: Value(data),
    );
  }

  factory SynchroUpdate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SynchroUpdate(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      type: serializer.fromJson<int>(json['type']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'type': serializer.toJson<int>(type),
      'deleted': serializer.toJson<bool>(deleted),
      'data': serializer.toJson<String>(data),
    };
  }

  SynchroUpdate copyWith(
          {int? id, String? uuid, int? type, bool? deleted, String? data}) =>
      SynchroUpdate(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        type: type ?? this.type,
        deleted: deleted ?? this.deleted,
        data: data ?? this.data,
      );
  @override
  String toString() {
    return (StringBuffer('SynchroUpdate(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('type: $type, ')
          ..write('deleted: $deleted, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(uuid.hashCode,
          $mrjc(type.hashCode, $mrjc(deleted.hashCode, data.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SynchroUpdate &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.type == this.type &&
          other.deleted == this.deleted &&
          other.data == this.data);
}

class SynchroUpdatesCompanion extends UpdateCompanion<SynchroUpdate> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> type;
  final Value<bool> deleted;
  final Value<String> data;
  const SynchroUpdatesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.type = const Value.absent(),
    this.deleted = const Value.absent(),
    this.data = const Value.absent(),
  });
  SynchroUpdatesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int type,
    required bool deleted,
    required String data,
  })  : uuid = Value(uuid),
        type = Value(type),
        deleted = Value(deleted),
        data = Value(data);
  static Insertable<SynchroUpdate> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? type,
    Expression<bool>? deleted,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (type != null) 'type': type,
      if (deleted != null) 'deleted': deleted,
      if (data != null) 'data': data,
    });
  }

  SynchroUpdatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? type,
      Value<bool>? deleted,
      Value<String>? data}) {
    return SynchroUpdatesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      type: type ?? this.type,
      deleted: deleted ?? this.deleted,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SynchroUpdatesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('type: $type, ')
          ..write('deleted: $deleted, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $SynchroUpdatesTable extends SynchroUpdates
    with TableInfo<$SynchroUpdatesTable, SynchroUpdate> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SynchroUpdatesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedIntColumn type = _constructType();
  GeneratedIntColumn _constructType() {
    return GeneratedIntColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  @override
  late final GeneratedBoolColumn deleted = _constructDeleted();
  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn(
      'deleted',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedTextColumn data = _constructData();
  GeneratedTextColumn _constructData() {
    return GeneratedTextColumn(
      'data',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, type, deleted, data];
  @override
  $SynchroUpdatesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'synchro_updates';
  @override
  final String actualTableName = 'synchro_updates';
  @override
  VerificationContext validateIntegrity(Insertable<SynchroUpdate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    } else if (isInserting) {
      context.missing(_deletedMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SynchroUpdate map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SynchroUpdate.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SynchroUpdatesTable createAlias(String alias) {
    return $SynchroUpdatesTable(_db, alias);
  }
}

class SystemVariable extends DataClass implements Insertable<SystemVariable> {
  /// key
  final String name;

  /// value
  final String value;
  SystemVariable({required this.name, required this.value});
  factory SystemVariable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SystemVariable(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      value: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}value'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['value'] = Variable<String>(value);
    return map;
  }

  SystemVariablesCompanion toCompanion(bool nullToAbsent) {
    return SystemVariablesCompanion(
      name: Value(name),
      value: Value(value),
    );
  }

  factory SystemVariable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SystemVariable(
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
    };
  }

  SystemVariable copyWith({String? name, String? value}) => SystemVariable(
        name: name ?? this.name,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('SystemVariable(')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, value.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SystemVariable &&
          other.name == this.name &&
          other.value == this.value);
}

class SystemVariablesCompanion extends UpdateCompanion<SystemVariable> {
  final Value<String> name;
  final Value<String> value;
  const SystemVariablesCompanion({
    this.name = const Value.absent(),
    this.value = const Value.absent(),
  });
  SystemVariablesCompanion.insert({
    required String name,
    required String value,
  })  : name = Value(name),
        value = Value(value);
  static Insertable<SystemVariable> custom({
    Expression<String>? name,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    });
  }

  SystemVariablesCompanion copyWith(
      {Value<String>? name, Value<String>? value}) {
    return SystemVariablesCompanion(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SystemVariablesCompanion(')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $SystemVariablesTable extends SystemVariables
    with TableInfo<$SystemVariablesTable, SystemVariable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SystemVariablesTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedTextColumn value = _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, value];
  @override
  $SystemVariablesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'system_variables';
  @override
  final String actualTableName = 'system_variables';
  @override
  VerificationContext validateIntegrity(Insertable<SystemVariable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  SystemVariable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SystemVariable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SystemVariablesTable createAlias(String alias) {
    return $SystemVariablesTable(_db, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// barcode
  final String barcode;

  /// user number
  final String userNr;
  User(
      {required this.id,
      required this.uuid,
      required this.barcode,
      required this.userNr});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      barcode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}barcode'])!,
      userNr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_nr'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['barcode'] = Variable<String>(barcode);
    map['user_nr'] = Variable<String>(userNr);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      barcode: Value(barcode),
      userNr: Value(userNr),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      barcode: serializer.fromJson<String>(json['barcode']),
      userNr: serializer.fromJson<String>(json['userNr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'barcode': serializer.toJson<String>(barcode),
      'userNr': serializer.toJson<String>(userNr),
    };
  }

  User copyWith({int? id, String? uuid, String? barcode, String? userNr}) =>
      User(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        barcode: barcode ?? this.barcode,
        userNr: userNr ?? this.userNr,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('barcode: $barcode, ')
          ..write('userNr: $userNr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(barcode.hashCode, userNr.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.barcode == this.barcode &&
          other.userNr == this.userNr);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> barcode;
  final Value<String> userNr;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.barcode = const Value.absent(),
    this.userNr = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String barcode,
    required String userNr,
  })  : uuid = Value(uuid),
        barcode = Value(barcode),
        userNr = Value(userNr);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? barcode,
    Expression<String>? userNr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (barcode != null) 'barcode': barcode,
      if (userNr != null) 'user_nr': userNr,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? barcode,
      Value<String>? userNr}) {
    return UsersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
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
  List<GeneratedColumn> get $columns => [id, uuid, barcode, userNr];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
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
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Packet extends DataClass implements Insertable<Packet> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

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
      required this.uuid,
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
    return Packet(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      barcode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}barcode'])!,
      lot: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lot'])!,
      quantity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      product: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
      productNr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_nr'])!,
      wrapping: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wrapping']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
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
      uuid: Value(uuid),
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
      uuid: serializer.fromJson<String>(json['uuid']),
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
      'uuid': serializer.toJson<String>(uuid),
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
          String? uuid,
          String? barcode,
          String? lot,
          double? quantity,
          int? product,
          String? productName,
          String? productNr,
          int? wrapping}) =>
      Packet(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
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
          ..write('uuid: $uuid, ')
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
          uuid.hashCode,
          $mrjc(
              barcode.hashCode,
              $mrjc(
                  lot.hashCode,
                  $mrjc(
                      quantity.hashCode,
                      $mrjc(
                          product.hashCode,
                          $mrjc(
                              productName.hashCode,
                              $mrjc(productNr.hashCode,
                                  wrapping.hashCode)))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Packet &&
          other.id == this.id &&
          other.uuid == this.uuid &&
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
  final Value<String> uuid;
  final Value<String> barcode;
  final Value<String> lot;
  final Value<double> quantity;
  final Value<int> product;
  final Value<String> productName;
  final Value<String> productNr;
  final Value<int?> wrapping;
  const PacketsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
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
    required String uuid,
    required String barcode,
    required String lot,
    required double quantity,
    required int product,
    required String productName,
    required String productNr,
    this.wrapping = const Value.absent(),
  })  : uuid = Value(uuid),
        barcode = Value(barcode),
        lot = Value(lot),
        quantity = Value(quantity),
        product = Value(product),
        productName = Value(productName),
        productNr = Value(productNr);
  static Insertable<Packet> custom({
    Expression<int>? id,
    Expression<String>? uuid,
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
      if (uuid != null) 'uuid': uuid,
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
      Value<String>? uuid,
      Value<String>? barcode,
      Value<String>? lot,
      Value<double>? quantity,
      Value<int>? product,
      Value<String>? productName,
      Value<String>? productNr,
      Value<int?>? wrapping}) {
    return PacketsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
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
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        barcode,
        lot,
        quantity,
        product,
        productName,
        productNr,
        wrapping
      ];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
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
    return Packet.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PacketsTable createAlias(String alias) {
    return $PacketsTable(_db, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// product number
  final String productNr;

  /// product name
  /// @FutureColumnNumber(6)
  final String productName;

  /// gtin 1
  /// @FutureColumnNumber(8)
  final int gtin1;

  /// gtin 2
  /// @FutureColumnNumber(49)
  final int gtin2;

  /// gtin 3
  /// @FutureColumnNumber(50)
  final int gtin3;

  /// gtin 4
  /// @FutureColumnNumber(163)
  final int gtin4;

  /// gtin 5
  /// @FutureColumnNumber(164)
  final int gtin5;
  Product(
      {required this.id,
      required this.uuid,
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
    return Product(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      productNr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_nr'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
      gtin1: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gtin1'])!,
      gtin2: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gtin2'])!,
      gtin3: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gtin3'])!,
      gtin4: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gtin4'])!,
      gtin5: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gtin5'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
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
      uuid: Value(uuid),
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
      uuid: serializer.fromJson<String>(json['uuid']),
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
      'uuid': serializer.toJson<String>(uuid),
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
          String? uuid,
          String? productNr,
          String? productName,
          int? gtin1,
          int? gtin2,
          int? gtin3,
          int? gtin4,
          int? gtin5}) =>
      Product(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
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
          ..write('uuid: $uuid, ')
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
          uuid.hashCode,
          $mrjc(
              productNr.hashCode,
              $mrjc(
                  productName.hashCode,
                  $mrjc(
                      gtin1.hashCode,
                      $mrjc(
                          gtin2.hashCode,
                          $mrjc(gtin3.hashCode,
                              $mrjc(gtin4.hashCode, gtin5.hashCode)))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.uuid == this.uuid &&
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
  final Value<String> uuid;
  final Value<String> productNr;
  final Value<String> productName;
  final Value<int> gtin1;
  final Value<int> gtin2;
  final Value<int> gtin3;
  final Value<int> gtin4;
  final Value<int> gtin5;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
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
    required String uuid,
    required String productNr,
    required String productName,
    required int gtin1,
    required int gtin2,
    required int gtin3,
    required int gtin4,
    required int gtin5,
  })  : uuid = Value(uuid),
        productNr = Value(productNr),
        productName = Value(productName),
        gtin1 = Value(gtin1),
        gtin2 = Value(gtin2),
        gtin3 = Value(gtin3),
        gtin4 = Value(gtin4),
        gtin5 = Value(gtin5);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? uuid,
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
      if (uuid != null) 'uuid': uuid,
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
      Value<String>? uuid,
      Value<String>? productNr,
      Value<String>? productName,
      Value<int>? gtin1,
      Value<int>? gtin2,
      Value<int>? gtin3,
      Value<int>? gtin4,
      Value<int>? gtin5}) {
    return ProductsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
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
      [id, uuid, productNr, productName, gtin1, gtin2, gtin3, gtin4, gtin5];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
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
    return Product.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(_db, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// order number
  final String orderNr;

  /// order barcode
  final String orderBarcode;
  Order(
      {required this.id,
      required this.uuid,
      required this.orderNr,
      required this.orderBarcode});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Order(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      orderNr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order_nr'])!,
      orderBarcode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order_barcode'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order_nr'] = Variable<String>(orderNr);
    map['order_barcode'] = Variable<String>(orderBarcode);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      orderNr: Value(orderNr),
      orderBarcode: Value(orderBarcode),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      orderNr: serializer.fromJson<String>(json['orderNr']),
      orderBarcode: serializer.fromJson<String>(json['orderBarcode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'orderNr': serializer.toJson<String>(orderNr),
      'orderBarcode': serializer.toJson<String>(orderBarcode),
    };
  }

  Order copyWith(
          {int? id, String? uuid, String? orderNr, String? orderBarcode}) =>
      Order(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        orderNr: orderNr ?? this.orderNr,
        orderBarcode: orderBarcode ?? this.orderBarcode,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderNr: $orderNr, ')
          ..write('orderBarcode: $orderBarcode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(orderNr.hashCode, orderBarcode.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.orderNr == this.orderNr &&
          other.orderBarcode == this.orderBarcode);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> orderNr;
  final Value<String> orderBarcode;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.orderNr = const Value.absent(),
    this.orderBarcode = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String orderNr,
    required String orderBarcode,
  })  : uuid = Value(uuid),
        orderNr = Value(orderNr),
        orderBarcode = Value(orderBarcode);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? orderNr,
    Expression<String>? orderBarcode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (orderNr != null) 'order_nr': orderNr,
      if (orderBarcode != null) 'order_barcode': orderBarcode,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? orderNr,
      Value<String>? orderBarcode}) {
    return OrdersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      orderNr: orderNr ?? this.orderNr,
      orderBarcode: orderBarcode ?? this.orderBarcode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (orderNr.present) {
      map['order_nr'] = Variable<String>(orderNr.value);
    }
    if (orderBarcode.present) {
      map['order_barcode'] = Variable<String>(orderBarcode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderNr: $orderNr, ')
          ..write('orderBarcode: $orderBarcode')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
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

  final VerificationMeta _orderBarcodeMeta =
      const VerificationMeta('orderBarcode');
  @override
  late final GeneratedTextColumn orderBarcode = _constructOrderBarcode();
  GeneratedTextColumn _constructOrderBarcode() {
    return GeneratedTextColumn(
      'order_barcode',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, orderNr, orderBarcode];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('order_nr')) {
      context.handle(_orderNrMeta,
          orderNr.isAcceptableOrUnknown(data['order_nr']!, _orderNrMeta));
    } else if (isInserting) {
      context.missing(_orderNrMeta);
    }
    if (data.containsKey('order_barcode')) {
      context.handle(
          _orderBarcodeMeta,
          orderBarcode.isAcceptableOrUnknown(
              data['order_barcode']!, _orderBarcodeMeta));
    } else if (isInserting) {
      context.missing(_orderBarcodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Order.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

class OrderPosition extends DataClass implements Insertable<OrderPosition> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// foreign key -> order
  final int order;
  OrderPosition({required this.id, required this.uuid, required this.order});
  factory OrderPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OrderPosition(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order'] = Variable<int>(order);
    return map;
  }

  OrderPositionsCompanion toCompanion(bool nullToAbsent) {
    return OrderPositionsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      order: Value(order),
    );
  }

  factory OrderPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OrderPosition(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'order': serializer.toJson<int>(order),
    };
  }

  OrderPosition copyWith({int? id, String? uuid, int? order}) => OrderPosition(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('OrderPosition(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(uuid.hashCode, order.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderPosition &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.order == this.order);
}

class OrderPositionsCompanion extends UpdateCompanion<OrderPosition> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> order;
  const OrderPositionsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.order = const Value.absent(),
  });
  OrderPositionsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int order,
  })  : uuid = Value(uuid),
        order = Value(order);
  static Insertable<OrderPosition> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (order != null) 'order': order,
    });
  }

  OrderPositionsCompanion copyWith(
      {Value<int>? id, Value<String>? uuid, Value<int>? order}) {
    return OrderPositionsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedIntColumn order = _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, false,
        $customConstraints: 'REFERENCES orders(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, order];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
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
    return OrderPosition.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrderPositionsTable createAlias(String alias) {
    return $OrderPositionsTable(_db, alias);
  }
}

class ProductionOrder extends DataClass implements Insertable<ProductionOrder> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// production order number
  final String productionOrderNr;

  /// production order barcode
  final String productionOrderBarcode;
  ProductionOrder(
      {required this.id,
      required this.uuid,
      required this.productionOrderNr,
      required this.productionOrderBarcode});
  factory ProductionOrder.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductionOrder(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      productionOrderNr: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}production_order_nr'])!,
      productionOrderBarcode: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}production_order_barcode'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['production_order_nr'] = Variable<String>(productionOrderNr);
    map['production_order_barcode'] = Variable<String>(productionOrderBarcode);
    return map;
  }

  ProductionOrdersCompanion toCompanion(bool nullToAbsent) {
    return ProductionOrdersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      productionOrderNr: Value(productionOrderNr),
      productionOrderBarcode: Value(productionOrderBarcode),
    );
  }

  factory ProductionOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionOrder(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      productionOrderNr: serializer.fromJson<String>(json['productionOrderNr']),
      productionOrderBarcode:
          serializer.fromJson<String>(json['productionOrderBarcode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'productionOrderNr': serializer.toJson<String>(productionOrderNr),
      'productionOrderBarcode':
          serializer.toJson<String>(productionOrderBarcode),
    };
  }

  ProductionOrder copyWith(
          {int? id,
          String? uuid,
          String? productionOrderNr,
          String? productionOrderBarcode}) =>
      ProductionOrder(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        productionOrderNr: productionOrderNr ?? this.productionOrderNr,
        productionOrderBarcode:
            productionOrderBarcode ?? this.productionOrderBarcode,
      );
  @override
  String toString() {
    return (StringBuffer('ProductionOrder(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('productionOrderNr: $productionOrderNr, ')
          ..write('productionOrderBarcode: $productionOrderBarcode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(uuid.hashCode,
          $mrjc(productionOrderNr.hashCode, productionOrderBarcode.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductionOrder &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.productionOrderNr == this.productionOrderNr &&
          other.productionOrderBarcode == this.productionOrderBarcode);
}

class ProductionOrdersCompanion extends UpdateCompanion<ProductionOrder> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> productionOrderNr;
  final Value<String> productionOrderBarcode;
  const ProductionOrdersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.productionOrderNr = const Value.absent(),
    this.productionOrderBarcode = const Value.absent(),
  });
  ProductionOrdersCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String productionOrderNr,
    required String productionOrderBarcode,
  })  : uuid = Value(uuid),
        productionOrderNr = Value(productionOrderNr),
        productionOrderBarcode = Value(productionOrderBarcode);
  static Insertable<ProductionOrder> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? productionOrderNr,
    Expression<String>? productionOrderBarcode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (productionOrderNr != null) 'production_order_nr': productionOrderNr,
      if (productionOrderBarcode != null)
        'production_order_barcode': productionOrderBarcode,
    });
  }

  ProductionOrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? productionOrderNr,
      Value<String>? productionOrderBarcode}) {
    return ProductionOrdersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      productionOrderNr: productionOrderNr ?? this.productionOrderNr,
      productionOrderBarcode:
          productionOrderBarcode ?? this.productionOrderBarcode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (productionOrderNr.present) {
      map['production_order_nr'] = Variable<String>(productionOrderNr.value);
    }
    if (productionOrderBarcode.present) {
      map['production_order_barcode'] =
          Variable<String>(productionOrderBarcode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionOrdersCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('productionOrderNr: $productionOrderNr, ')
          ..write('productionOrderBarcode: $productionOrderBarcode')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
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

  final VerificationMeta _productionOrderBarcodeMeta =
      const VerificationMeta('productionOrderBarcode');
  @override
  late final GeneratedTextColumn productionOrderBarcode =
      _constructProductionOrderBarcode();
  GeneratedTextColumn _constructProductionOrderBarcode() {
    return GeneratedTextColumn(
      'production_order_barcode',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, productionOrderNr, productionOrderBarcode];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('production_order_nr')) {
      context.handle(
          _productionOrderNrMeta,
          productionOrderNr.isAcceptableOrUnknown(
              data['production_order_nr']!, _productionOrderNrMeta));
    } else if (isInserting) {
      context.missing(_productionOrderNrMeta);
    }
    if (data.containsKey('production_order_barcode')) {
      context.handle(
          _productionOrderBarcodeMeta,
          productionOrderBarcode.isAcceptableOrUnknown(
              data['production_order_barcode']!, _productionOrderBarcodeMeta));
    } else if (isInserting) {
      context.missing(_productionOrderBarcodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductionOrder.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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

  /// globaly unique id used for synchronizing
  final String uuid;

  /// foreign key -> production order
  final int prodOrder;

  /// Material Packet
  /// foreign key -> packets
  final int packet;
  ProductionMaterial(
      {required this.id,
      required this.uuid,
      required this.prodOrder,
      required this.packet});
  factory ProductionMaterial.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductionMaterial(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      prodOrder: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prod_order'])!,
      packet: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}packet'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['prod_order'] = Variable<int>(prodOrder);
    map['packet'] = Variable<int>(packet);
    return map;
  }

  ProductionMaterialsCompanion toCompanion(bool nullToAbsent) {
    return ProductionMaterialsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      prodOrder: Value(prodOrder),
      packet: Value(packet),
    );
  }

  factory ProductionMaterial.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionMaterial(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      prodOrder: serializer.fromJson<int>(json['prodOrder']),
      packet: serializer.fromJson<int>(json['packet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'prodOrder': serializer.toJson<int>(prodOrder),
      'packet': serializer.toJson<int>(packet),
    };
  }

  ProductionMaterial copyWith(
          {int? id, String? uuid, int? prodOrder, int? packet}) =>
      ProductionMaterial(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        prodOrder: prodOrder ?? this.prodOrder,
        packet: packet ?? this.packet,
      );
  @override
  String toString() {
    return (StringBuffer('ProductionMaterial(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('prodOrder: $prodOrder, ')
          ..write('packet: $packet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(prodOrder.hashCode, packet.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductionMaterial &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.prodOrder == this.prodOrder &&
          other.packet == this.packet);
}

class ProductionMaterialsCompanion extends UpdateCompanion<ProductionMaterial> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> prodOrder;
  final Value<int> packet;
  const ProductionMaterialsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.prodOrder = const Value.absent(),
    this.packet = const Value.absent(),
  });
  ProductionMaterialsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int prodOrder,
    required int packet,
  })  : uuid = Value(uuid),
        prodOrder = Value(prodOrder),
        packet = Value(packet);
  static Insertable<ProductionMaterial> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? prodOrder,
    Expression<int>? packet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (prodOrder != null) 'prod_order': prodOrder,
      if (packet != null) 'packet': packet,
    });
  }

  ProductionMaterialsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? prodOrder,
      Value<int>? packet}) {
    return ProductionMaterialsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      prodOrder: prodOrder ?? this.prodOrder,
      packet: packet ?? this.packet,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (prodOrder.present) {
      map['prod_order'] = Variable<int>(prodOrder.value);
    }
    if (packet.present) {
      map['packet'] = Variable<int>(packet.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionMaterialsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('prodOrder: $prodOrder, ')
          ..write('packet: $packet')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _prodOrderMeta = const VerificationMeta('prodOrder');
  @override
  late final GeneratedIntColumn prodOrder = _constructProdOrder();
  GeneratedIntColumn _constructProdOrder() {
    return GeneratedIntColumn('prod_order', $tableName, false,
        $customConstraints: 'REFERENCES production_orders(id)');
  }

  final VerificationMeta _packetMeta = const VerificationMeta('packet');
  @override
  late final GeneratedIntColumn packet = _constructPacket();
  GeneratedIntColumn _constructPacket() {
    return GeneratedIntColumn('packet', $tableName, false,
        $customConstraints: 'REFERENCES packets(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, prodOrder, packet];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('prod_order')) {
      context.handle(_prodOrderMeta,
          prodOrder.isAcceptableOrUnknown(data['prod_order']!, _prodOrderMeta));
    } else if (isInserting) {
      context.missing(_prodOrderMeta);
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
  ProductionMaterial map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductionMaterial.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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

  /// globaly unique id used for synchronizing
  final String uuid;

  /// foreign key -> production order
  final int prodOrder;

  /// Resulting Packet
  /// foreign key -> packets
  final int packet;
  ProductionResult(
      {required this.id,
      required this.uuid,
      required this.prodOrder,
      required this.packet});
  factory ProductionResult.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductionResult(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      prodOrder: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prod_order'])!,
      packet: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}packet'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['prod_order'] = Variable<int>(prodOrder);
    map['packet'] = Variable<int>(packet);
    return map;
  }

  ProductionResultsCompanion toCompanion(bool nullToAbsent) {
    return ProductionResultsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      prodOrder: Value(prodOrder),
      packet: Value(packet),
    );
  }

  factory ProductionResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductionResult(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      prodOrder: serializer.fromJson<int>(json['prodOrder']),
      packet: serializer.fromJson<int>(json['packet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'prodOrder': serializer.toJson<int>(prodOrder),
      'packet': serializer.toJson<int>(packet),
    };
  }

  ProductionResult copyWith(
          {int? id, String? uuid, int? prodOrder, int? packet}) =>
      ProductionResult(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        prodOrder: prodOrder ?? this.prodOrder,
        packet: packet ?? this.packet,
      );
  @override
  String toString() {
    return (StringBuffer('ProductionResult(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('prodOrder: $prodOrder, ')
          ..write('packet: $packet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(prodOrder.hashCode, packet.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductionResult &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.prodOrder == this.prodOrder &&
          other.packet == this.packet);
}

class ProductionResultsCompanion extends UpdateCompanion<ProductionResult> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> prodOrder;
  final Value<int> packet;
  const ProductionResultsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.prodOrder = const Value.absent(),
    this.packet = const Value.absent(),
  });
  ProductionResultsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int prodOrder,
    required int packet,
  })  : uuid = Value(uuid),
        prodOrder = Value(prodOrder),
        packet = Value(packet);
  static Insertable<ProductionResult> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? prodOrder,
    Expression<int>? packet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (prodOrder != null) 'prod_order': prodOrder,
      if (packet != null) 'packet': packet,
    });
  }

  ProductionResultsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? prodOrder,
      Value<int>? packet}) {
    return ProductionResultsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      prodOrder: prodOrder ?? this.prodOrder,
      packet: packet ?? this.packet,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (prodOrder.present) {
      map['prod_order'] = Variable<int>(prodOrder.value);
    }
    if (packet.present) {
      map['packet'] = Variable<int>(packet.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionResultsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('prodOrder: $prodOrder, ')
          ..write('packet: $packet')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _prodOrderMeta = const VerificationMeta('prodOrder');
  @override
  late final GeneratedIntColumn prodOrder = _constructProdOrder();
  GeneratedIntColumn _constructProdOrder() {
    return GeneratedIntColumn('prod_order', $tableName, false,
        $customConstraints: 'REFERENCES production_orders(id)');
  }

  final VerificationMeta _packetMeta = const VerificationMeta('packet');
  @override
  late final GeneratedIntColumn packet = _constructPacket();
  GeneratedIntColumn _constructPacket() {
    return GeneratedIntColumn('packet', $tableName, false,
        $customConstraints: 'REFERENCES packets(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, prodOrder, packet];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('prod_order')) {
      context.handle(_prodOrderMeta,
          prodOrder.isAcceptableOrUnknown(data['prod_order']!, _prodOrderMeta));
    } else if (isInserting) {
      context.missing(_prodOrderMeta);
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
  ProductionResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductionResult.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductionResultsTable createAlias(String alias) {
    return $ProductionResultsTable(_db, alias);
  }
}

class Delivery extends DataClass implements Insertable<Delivery> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// picture count
  final int pictureCount;

  /// foreign key -> user
  final int user;
  Delivery(
      {required this.id,
      required this.uuid,
      required this.pictureCount,
      required this.user});
  factory Delivery.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Delivery(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      pictureCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture_count'])!,
      user: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['picture_count'] = Variable<int>(pictureCount);
    map['user'] = Variable<int>(user);
    return map;
  }

  DeliveriesCompanion toCompanion(bool nullToAbsent) {
    return DeliveriesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      pictureCount: Value(pictureCount),
      user: Value(user),
    );
  }

  factory Delivery.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Delivery(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      pictureCount: serializer.fromJson<int>(json['pictureCount']),
      user: serializer.fromJson<int>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'pictureCount': serializer.toJson<int>(pictureCount),
      'user': serializer.toJson<int>(user),
    };
  }

  Delivery copyWith({int? id, String? uuid, int? pictureCount, int? user}) =>
      Delivery(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        pictureCount: pictureCount ?? this.pictureCount,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('Delivery(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('pictureCount: $pictureCount, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(pictureCount.hashCode, user.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Delivery &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.pictureCount == this.pictureCount &&
          other.user == this.user);
}

class DeliveriesCompanion extends UpdateCompanion<Delivery> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> pictureCount;
  final Value<int> user;
  const DeliveriesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.pictureCount = const Value.absent(),
    this.user = const Value.absent(),
  });
  DeliveriesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int pictureCount,
    required int user,
  })  : uuid = Value(uuid),
        pictureCount = Value(pictureCount),
        user = Value(user);
  static Insertable<Delivery> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? pictureCount,
    Expression<int>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (pictureCount != null) 'picture_count': pictureCount,
      if (user != null) 'user': user,
    });
  }

  DeliveriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? pictureCount,
      Value<int>? user}) {
    return DeliveriesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      pictureCount: pictureCount ?? this.pictureCount,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (pictureCount.present) {
      map['picture_count'] = Variable<int>(pictureCount.value);
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
          ..write('uuid: $uuid, ')
          ..write('pictureCount: $pictureCount, ')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _pictureCountMeta =
      const VerificationMeta('pictureCount');
  @override
  late final GeneratedIntColumn pictureCount = _constructPictureCount();
  GeneratedIntColumn _constructPictureCount() {
    return GeneratedIntColumn(
      'picture_count',
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
  List<GeneratedColumn> get $columns => [id, uuid, pictureCount, user];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('picture_count')) {
      context.handle(
          _pictureCountMeta,
          pictureCount.isAcceptableOrUnknown(
              data['picture_count']!, _pictureCountMeta));
    } else if (isInserting) {
      context.missing(_pictureCountMeta);
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
    return Delivery.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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

  /// globaly unique id used for synchronizing
  final String uuid;

  /// foreign key -> delivery
  final int delivery;

  /// foreign key -> packets
  final int packet;
  DeliveryPosition(
      {required this.id,
      required this.uuid,
      required this.delivery,
      required this.packet});
  factory DeliveryPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DeliveryPosition(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      delivery: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery'])!,
      packet: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}packet'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['delivery'] = Variable<int>(delivery);
    map['packet'] = Variable<int>(packet);
    return map;
  }

  DeliveryPositionsCompanion toCompanion(bool nullToAbsent) {
    return DeliveryPositionsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      delivery: Value(delivery),
      packet: Value(packet),
    );
  }

  factory DeliveryPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DeliveryPosition(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      delivery: serializer.fromJson<int>(json['delivery']),
      packet: serializer.fromJson<int>(json['packet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'delivery': serializer.toJson<int>(delivery),
      'packet': serializer.toJson<int>(packet),
    };
  }

  DeliveryPosition copyWith(
          {int? id, String? uuid, int? delivery, int? packet}) =>
      DeliveryPosition(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        delivery: delivery ?? this.delivery,
        packet: packet ?? this.packet,
      );
  @override
  String toString() {
    return (StringBuffer('DeliveryPosition(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('delivery: $delivery, ')
          ..write('packet: $packet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(delivery.hashCode, packet.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeliveryPosition &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.delivery == this.delivery &&
          other.packet == this.packet);
}

class DeliveryPositionsCompanion extends UpdateCompanion<DeliveryPosition> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> delivery;
  final Value<int> packet;
  const DeliveryPositionsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.delivery = const Value.absent(),
    this.packet = const Value.absent(),
  });
  DeliveryPositionsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int delivery,
    required int packet,
  })  : uuid = Value(uuid),
        delivery = Value(delivery),
        packet = Value(packet);
  static Insertable<DeliveryPosition> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? delivery,
    Expression<int>? packet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (delivery != null) 'delivery': delivery,
      if (packet != null) 'packet': packet,
    });
  }

  DeliveryPositionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? delivery,
      Value<int>? packet}) {
    return DeliveryPositionsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
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
          ..write('uuid: $uuid, ')
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

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
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
  List<GeneratedColumn> get $columns => [id, uuid, delivery, packet];
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
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
    return DeliveryPosition.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DeliveryPositionsTable createAlias(String alias) {
    return $DeliveryPositionsTable(_db, alias);
  }
}

class Dispatch extends DataClass implements Insertable<Dispatch> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// foreign key -> order
  final int orderID;
  Dispatch({required this.id, required this.uuid, required this.orderID});
  factory Dispatch.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Dispatch(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      orderID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order_i_d'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order_i_d'] = Variable<int>(orderID);
    return map;
  }

  DispatchesCompanion toCompanion(bool nullToAbsent) {
    return DispatchesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      orderID: Value(orderID),
    );
  }

  factory Dispatch.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Dispatch(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      orderID: serializer.fromJson<int>(json['orderID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'orderID': serializer.toJson<int>(orderID),
    };
  }

  Dispatch copyWith({int? id, String? uuid, int? orderID}) => Dispatch(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        orderID: orderID ?? this.orderID,
      );
  @override
  String toString() {
    return (StringBuffer('Dispatch(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderID: $orderID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(uuid.hashCode, orderID.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dispatch &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.orderID == this.orderID);
}

class DispatchesCompanion extends UpdateCompanion<Dispatch> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> orderID;
  const DispatchesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.orderID = const Value.absent(),
  });
  DispatchesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int orderID,
  })  : uuid = Value(uuid),
        orderID = Value(orderID);
  static Insertable<Dispatch> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? orderID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (orderID != null) 'order_i_d': orderID,
    });
  }

  DispatchesCompanion copyWith(
      {Value<int>? id, Value<String>? uuid, Value<int>? orderID}) {
    return DispatchesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      orderID: orderID ?? this.orderID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (orderID.present) {
      map['order_i_d'] = Variable<int>(orderID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DispatchesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderID: $orderID')
          ..write(')'))
        .toString();
  }
}

class $DispatchesTable extends Dispatches
    with TableInfo<$DispatchesTable, Dispatch> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DispatchesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _orderIDMeta = const VerificationMeta('orderID');
  @override
  late final GeneratedIntColumn orderID = _constructOrderID();
  GeneratedIntColumn _constructOrderID() {
    return GeneratedIntColumn('order_i_d', $tableName, false,
        $customConstraints: 'REFERENCES orders(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, orderID];
  @override
  $DispatchesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dispatches';
  @override
  final String actualTableName = 'dispatches';
  @override
  VerificationContext validateIntegrity(Insertable<Dispatch> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('order_i_d')) {
      context.handle(_orderIDMeta,
          orderID.isAcceptableOrUnknown(data['order_i_d']!, _orderIDMeta));
    } else if (isInserting) {
      context.missing(_orderIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dispatch map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Dispatch.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DispatchesTable createAlias(String alias) {
    return $DispatchesTable(_db, alias);
  }
}

class DispatchPosition extends DataClass
    implements Insertable<DispatchPosition> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// foreign key -> dispatch
  final int dispatch;

  /// foreign key -> packets
  final int packet;
  DispatchPosition(
      {required this.id,
      required this.uuid,
      required this.dispatch,
      required this.packet});
  factory DispatchPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DispatchPosition(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      dispatch: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dispatch'])!,
      packet: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}packet'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['dispatch'] = Variable<int>(dispatch);
    map['packet'] = Variable<int>(packet);
    return map;
  }

  DispatchPositionsCompanion toCompanion(bool nullToAbsent) {
    return DispatchPositionsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      dispatch: Value(dispatch),
      packet: Value(packet),
    );
  }

  factory DispatchPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DispatchPosition(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      dispatch: serializer.fromJson<int>(json['dispatch']),
      packet: serializer.fromJson<int>(json['packet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'dispatch': serializer.toJson<int>(dispatch),
      'packet': serializer.toJson<int>(packet),
    };
  }

  DispatchPosition copyWith(
          {int? id, String? uuid, int? dispatch, int? packet}) =>
      DispatchPosition(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        dispatch: dispatch ?? this.dispatch,
        packet: packet ?? this.packet,
      );
  @override
  String toString() {
    return (StringBuffer('DispatchPosition(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('dispatch: $dispatch, ')
          ..write('packet: $packet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(dispatch.hashCode, packet.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DispatchPosition &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.dispatch == this.dispatch &&
          other.packet == this.packet);
}

class DispatchPositionsCompanion extends UpdateCompanion<DispatchPosition> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> dispatch;
  final Value<int> packet;
  const DispatchPositionsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.dispatch = const Value.absent(),
    this.packet = const Value.absent(),
  });
  DispatchPositionsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int dispatch,
    required int packet,
  })  : uuid = Value(uuid),
        dispatch = Value(dispatch),
        packet = Value(packet);
  static Insertable<DispatchPosition> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? dispatch,
    Expression<int>? packet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (dispatch != null) 'dispatch': dispatch,
      if (packet != null) 'packet': packet,
    });
  }

  DispatchPositionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? dispatch,
      Value<int>? packet}) {
    return DispatchPositionsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      dispatch: dispatch ?? this.dispatch,
      packet: packet ?? this.packet,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (dispatch.present) {
      map['dispatch'] = Variable<int>(dispatch.value);
    }
    if (packet.present) {
      map['packet'] = Variable<int>(packet.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DispatchPositionsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('dispatch: $dispatch, ')
          ..write('packet: $packet')
          ..write(')'))
        .toString();
  }
}

class $DispatchPositionsTable extends DispatchPositions
    with TableInfo<$DispatchPositionsTable, DispatchPosition> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DispatchPositionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _dispatchMeta = const VerificationMeta('dispatch');
  @override
  late final GeneratedIntColumn dispatch = _constructDispatch();
  GeneratedIntColumn _constructDispatch() {
    return GeneratedIntColumn('dispatch', $tableName, false,
        $customConstraints: 'REFERENCES dispatches(id)');
  }

  final VerificationMeta _packetMeta = const VerificationMeta('packet');
  @override
  late final GeneratedIntColumn packet = _constructPacket();
  GeneratedIntColumn _constructPacket() {
    return GeneratedIntColumn('packet', $tableName, false,
        $customConstraints: 'REFERENCES packets(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, dispatch, packet];
  @override
  $DispatchPositionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dispatch_positions';
  @override
  final String actualTableName = 'dispatch_positions';
  @override
  VerificationContext validateIntegrity(Insertable<DispatchPosition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('dispatch')) {
      context.handle(_dispatchMeta,
          dispatch.isAcceptableOrUnknown(data['dispatch']!, _dispatchMeta));
    } else if (isInserting) {
      context.missing(_dispatchMeta);
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
  DispatchPosition map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DispatchPosition.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DispatchPositionsTable createAlias(String alias) {
    return $DispatchPositionsTable(_db, alias);
  }
}

class DeliveryImage extends DataClass implements Insertable<DeliveryImage> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// file path
  final String filePath;

  /// foreign key -> delivery
  final int delivery;
  DeliveryImage(
      {required this.id,
      required this.uuid,
      required this.filePath,
      required this.delivery});
  factory DeliveryImage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DeliveryImage(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      filePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}file_path'])!,
      delivery: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['file_path'] = Variable<String>(filePath);
    map['delivery'] = Variable<int>(delivery);
    return map;
  }

  DeliveryImagesCompanion toCompanion(bool nullToAbsent) {
    return DeliveryImagesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      filePath: Value(filePath),
      delivery: Value(delivery),
    );
  }

  factory DeliveryImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DeliveryImage(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      filePath: serializer.fromJson<String>(json['filePath']),
      delivery: serializer.fromJson<int>(json['delivery']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'filePath': serializer.toJson<String>(filePath),
      'delivery': serializer.toJson<int>(delivery),
    };
  }

  DeliveryImage copyWith(
          {int? id, String? uuid, String? filePath, int? delivery}) =>
      DeliveryImage(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        filePath: filePath ?? this.filePath,
        delivery: delivery ?? this.delivery,
      );
  @override
  String toString() {
    return (StringBuffer('DeliveryImage(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('filePath: $filePath, ')
          ..write('delivery: $delivery')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(uuid.hashCode, $mrjc(filePath.hashCode, delivery.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeliveryImage &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.filePath == this.filePath &&
          other.delivery == this.delivery);
}

class DeliveryImagesCompanion extends UpdateCompanion<DeliveryImage> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> filePath;
  final Value<int> delivery;
  const DeliveryImagesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.filePath = const Value.absent(),
    this.delivery = const Value.absent(),
  });
  DeliveryImagesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String filePath,
    required int delivery,
  })  : uuid = Value(uuid),
        filePath = Value(filePath),
        delivery = Value(delivery);
  static Insertable<DeliveryImage> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? filePath,
    Expression<int>? delivery,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (filePath != null) 'file_path': filePath,
      if (delivery != null) 'delivery': delivery,
    });
  }

  DeliveryImagesCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? filePath,
      Value<int>? delivery}) {
    return DeliveryImagesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      filePath: filePath ?? this.filePath,
      delivery: delivery ?? this.delivery,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (delivery.present) {
      map['delivery'] = Variable<int>(delivery.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryImagesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('filePath: $filePath, ')
          ..write('delivery: $delivery')
          ..write(')'))
        .toString();
  }
}

class $DeliveryImagesTable extends DeliveryImages
    with TableInfo<$DeliveryImagesTable, DeliveryImage> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DeliveryImagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _filePathMeta = const VerificationMeta('filePath');
  @override
  late final GeneratedTextColumn filePath = _constructFilePath();
  GeneratedTextColumn _constructFilePath() {
    return GeneratedTextColumn(
      'file_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deliveryMeta = const VerificationMeta('delivery');
  @override
  late final GeneratedIntColumn delivery = _constructDelivery();
  GeneratedIntColumn _constructDelivery() {
    return GeneratedIntColumn('delivery', $tableName, false,
        $customConstraints: 'REFERENCES deliveries(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid, filePath, delivery];
  @override
  $DeliveryImagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'delivery_images';
  @override
  final String actualTableName = 'delivery_images';
  @override
  VerificationContext validateIntegrity(Insertable<DeliveryImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('delivery')) {
      context.handle(_deliveryMeta,
          delivery.isAcceptableOrUnknown(data['delivery']!, _deliveryMeta));
    } else if (isInserting) {
      context.missing(_deliveryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeliveryImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DeliveryImage.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DeliveryImagesTable createAlias(String alias) {
    return $DeliveryImagesTable(_db, alias);
  }
}

class Inventory extends DataClass implements Insertable<Inventory> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;
  Inventory({required this.id, required this.uuid});
  factory Inventory.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Inventory(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    return map;
  }

  InventoriesCompanion toCompanion(bool nullToAbsent) {
    return InventoriesCompanion(
      id: Value(id),
      uuid: Value(uuid),
    );
  }

  factory Inventory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Inventory(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
    };
  }

  Inventory copyWith({int? id, String? uuid}) => Inventory(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
      );
  @override
  String toString() {
    return (StringBuffer('Inventory(')
          ..write('id: $id, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, uuid.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Inventory && other.id == this.id && other.uuid == this.uuid);
}

class InventoriesCompanion extends UpdateCompanion<Inventory> {
  final Value<int> id;
  final Value<String> uuid;
  const InventoriesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
  });
  InventoriesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
  }) : uuid = Value(uuid);
  static Insertable<Inventory> custom({
    Expression<int>? id,
    Expression<String>? uuid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
    });
  }

  InventoriesCompanion copyWith({Value<int>? id, Value<String>? uuid}) {
    return InventoriesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoriesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }
}

class $InventoriesTable extends Inventories
    with TableInfo<$InventoriesTable, Inventory> {
  final GeneratedDatabase _db;
  final String? _alias;
  $InventoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, uuid];
  @override
  $InventoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'inventories';
  @override
  final String actualTableName = 'inventories';
  @override
  VerificationContext validateIntegrity(Insertable<Inventory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Inventory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Inventory.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InventoriesTable createAlias(String alias) {
    return $InventoriesTable(_db, alias);
  }
}

class InventoryPosition extends DataClass
    implements Insertable<InventoryPosition> {
  /// primary key
  final int id;

  /// globaly unique id used for synchronizing
  final String uuid;

  /// foreign key -> inventory
  final int inventory;

  /// foreign key -> packets
  final int packet;

  /// quantity
  final double quantity;
  InventoryPosition(
      {required this.id,
      required this.uuid,
      required this.inventory,
      required this.packet,
      required this.quantity});
  factory InventoryPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return InventoryPosition(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      inventory: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}inventory'])!,
      packet: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}packet'])!,
      quantity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['inventory'] = Variable<int>(inventory);
    map['packet'] = Variable<int>(packet);
    map['quantity'] = Variable<double>(quantity);
    return map;
  }

  InventoryPositionsCompanion toCompanion(bool nullToAbsent) {
    return InventoryPositionsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      inventory: Value(inventory),
      packet: Value(packet),
      quantity: Value(quantity),
    );
  }

  factory InventoryPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InventoryPosition(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      inventory: serializer.fromJson<int>(json['inventory']),
      packet: serializer.fromJson<int>(json['packet']),
      quantity: serializer.fromJson<double>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'inventory': serializer.toJson<int>(inventory),
      'packet': serializer.toJson<int>(packet),
      'quantity': serializer.toJson<double>(quantity),
    };
  }

  InventoryPosition copyWith(
          {int? id,
          String? uuid,
          int? inventory,
          int? packet,
          double? quantity}) =>
      InventoryPosition(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        inventory: inventory ?? this.inventory,
        packet: packet ?? this.packet,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryPosition(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('inventory: $inventory, ')
          ..write('packet: $packet, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          uuid.hashCode,
          $mrjc(
              inventory.hashCode, $mrjc(packet.hashCode, quantity.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryPosition &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.inventory == this.inventory &&
          other.packet == this.packet &&
          other.quantity == this.quantity);
}

class InventoryPositionsCompanion extends UpdateCompanion<InventoryPosition> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> inventory;
  final Value<int> packet;
  final Value<double> quantity;
  const InventoryPositionsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.inventory = const Value.absent(),
    this.packet = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  InventoryPositionsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int inventory,
    required int packet,
    required double quantity,
  })  : uuid = Value(uuid),
        inventory = Value(inventory),
        packet = Value(packet),
        quantity = Value(quantity);
  static Insertable<InventoryPosition> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? inventory,
    Expression<int>? packet,
    Expression<double>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (inventory != null) 'inventory': inventory,
      if (packet != null) 'packet': packet,
      if (quantity != null) 'quantity': quantity,
    });
  }

  InventoryPositionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<int>? inventory,
      Value<int>? packet,
      Value<double>? quantity}) {
    return InventoryPositionsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      inventory: inventory ?? this.inventory,
      packet: packet ?? this.packet,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (inventory.present) {
      map['inventory'] = Variable<int>(inventory.value);
    }
    if (packet.present) {
      map['packet'] = Variable<int>(packet.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryPositionsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('inventory: $inventory, ')
          ..write('packet: $packet, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $InventoryPositionsTable extends InventoryPositions
    with TableInfo<$InventoryPositionsTable, InventoryPosition> {
  final GeneratedDatabase _db;
  final String? _alias;
  $InventoryPositionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedTextColumn uuid = _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _inventoryMeta = const VerificationMeta('inventory');
  @override
  late final GeneratedIntColumn inventory = _constructInventory();
  GeneratedIntColumn _constructInventory() {
    return GeneratedIntColumn('inventory', $tableName, false,
        $customConstraints: 'REFERENCES inventories(id)');
  }

  final VerificationMeta _packetMeta = const VerificationMeta('packet');
  @override
  late final GeneratedIntColumn packet = _constructPacket();
  GeneratedIntColumn _constructPacket() {
    return GeneratedIntColumn('packet', $tableName, false,
        $customConstraints: 'REFERENCES packets(id)');
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

  @override
  List<GeneratedColumn> get $columns => [id, uuid, inventory, packet, quantity];
  @override
  $InventoryPositionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'inventory_positions';
  @override
  final String actualTableName = 'inventory_positions';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryPosition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('inventory')) {
      context.handle(_inventoryMeta,
          inventory.isAcceptableOrUnknown(data['inventory']!, _inventoryMeta));
    } else if (isInserting) {
      context.missing(_inventoryMeta);
    }
    if (data.containsKey('packet')) {
      context.handle(_packetMeta,
          packet.isAcceptableOrUnknown(data['packet']!, _packetMeta));
    } else if (isInserting) {
      context.missing(_packetMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryPosition map(Map<String, dynamic> data, {String? tablePrefix}) {
    return InventoryPosition.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InventoryPositionsTable createAlias(String alias) {
    return $InventoryPositionsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $SynchroUpdatesTable synchroUpdates = $SynchroUpdatesTable(this);
  late final $SystemVariablesTable systemVariables =
      $SystemVariablesTable(this);
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
  late final $DispatchesTable dispatches = $DispatchesTable(this);
  late final $DispatchPositionsTable dispatchPositions =
      $DispatchPositionsTable(this);
  late final $DeliveryImagesTable deliveryImages = $DeliveryImagesTable(this);
  late final $InventoriesTable inventories = $InventoriesTable(this);
  late final $InventoryPositionsTable inventoryPositions =
      $InventoryPositionsTable(this);
  late final SynchroUpdatesDao synchroUpdatesDao =
      SynchroUpdatesDao(this as Database);
  late final SystemVariablesDao systemVariablesDao =
      SystemVariablesDao(this as Database);
  late final UsersDao usersDao = UsersDao(this as Database);
  late final PacketsDao packetsDao = PacketsDao(this as Database);
  late final ProductsDao productsDao = ProductsDao(this as Database);
  late final OrdersDao ordersDao = OrdersDao(this as Database);
  late final ProductionDao productionDao = ProductionDao(this as Database);
  late final ProductionMaterialsDao productionMaterialsDao =
      ProductionMaterialsDao(this as Database);
  late final ProductionResultsDao productionResultsDao =
      ProductionResultsDao(this as Database);
  late final DeliveriesDao deliveriesDao = DeliveriesDao(this as Database);
  late final DeliveryPositionsDao deliveryPositionsDao =
      DeliveryPositionsDao(this as Database);
  late final DispatchesDao dispatchesDao = DispatchesDao(this as Database);
  late final DispatchPositionsDao dispatchPositionsDao =
      DispatchPositionsDao(this as Database);
  late final DeliveryImagesDao deliveryImagesDao =
      DeliveryImagesDao(this as Database);
  late final InventoriesDao inventoriesDao = InventoriesDao(this as Database);
  late final InventoryPositionsDao inventoryPositionsDao =
      InventoryPositionsDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        synchroUpdates,
        systemVariables,
        users,
        packets,
        products,
        orders,
        orderPositions,
        productionOrders,
        productionMaterials,
        productionResults,
        deliveries,
        deliveryPositions,
        dispatches,
        dispatchPositions,
        deliveryImages,
        inventories,
        inventoryPositions
      ];
}
