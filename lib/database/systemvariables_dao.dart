import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'systemvariables_dao.g.dart';

@UseDao(tables: [SystemVariables])

/// users functionality extension for database
class SystemVariablesDao extends DatabaseAccessor<Database>
    with _$SystemVariablesDaoMixin {
  ///
  SystemVariablesDao(Database db) : super(db);

  /// retrieve value with given key
  Future<String> get(String name) async {
    return (select(systemVariables)..where((v) => v.name.equals(name)))
        .getSingleOrNull()
        .then((variable) {
      if (variable == null) {
        return '';
      }

      return variable.value;
    });
  }

  /// set given key to the given value
  Future<void> set(String name, String value) async {
    into(systemVariables).insert(
        SystemVariablesCompanion(name: Value(name), value: Value(value)),
        mode: InsertMode.replace);
  }
}
