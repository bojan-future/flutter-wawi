import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class GenericController<E extends HiveObject> extends ChangeNotifier {
  Box<E> _db;

  GenericController(Box<E> db) {
    _db = db;
  }

  // getters
  List<E> get all => _db.values;

  // create
  void add(E item) {
    _db.add(item);
    notifyListeners();
  }

  void update(E item) {
    item.save();
    notifyListeners();
  }

  // delete
  void delete(E item) {
    item.delete();
    notifyListeners();
  }
}
