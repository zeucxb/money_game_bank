import 'package:hive/hive.dart';

class LocalStorageAdapter {
  final Box _box;

  LocalStorageAdapter(this._box);

  int nextId() => _box.length;

  List<T> list<T>() => _box.values.toList();

  Future<void> save(value) async => await _box.put(nextId(), value);

  Future<void> update(int id, value) async => await _box.putAt(id, value);

  Future<void> delete(int id) async => await _box.delete(id);

  Future<void> deleteAll() async => await _box.clear();
}
