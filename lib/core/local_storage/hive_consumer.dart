import 'package:flutter_payment/core/local_storage/local_storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConsumer implements LocalStorageService {
  @override
  Future<T?> getData<T>(String key) async {
    _checkIfBoxIsOpen(key);
    return Hive.box<T>(key).get(key);
  }

  @override
  Future<void> removeData<T>(String key) async {
    _checkIfBoxIsOpen(key);
    await Hive.box<T>(key).delete(key);
  }

  @override
  Future<void> setData<T>(String key, T value) async {
    _checkIfBoxIsOpen(key);
    await Hive.box<T>(key).add(value);
  }

  Future<void> _checkIfBoxIsOpen<T>(String key) async {
    if (!Hive.isBoxOpen(key)) {
      await Hive.openBox<T>(key);
    }
  }

  @override
  Future<void> addData<T>(String key, T value) async {
    _checkIfBoxIsOpen(key);
    await Hive.box<T>(key).add(value);
  }
}
