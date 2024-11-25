import 'package:flutter_payment/core/errors/exceptions.dart';
import 'package:flutter_payment/core/local_storage/local_storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConsumer implements LocalStorageService {
  @override
  Future<T?> getData<T>(String key) async {
    try {
      _checkIfBoxIsOpen<T>(key);
      return Hive.box<T>(key).get(key);
    } catch (e) {
      throw const CacheException('Failed to get data');
    }
  }

  @override
  Future<void> removeData<T>(String key) async {
    try {
      _checkIfBoxIsOpen<T>(key);
      await Hive.box<T>(key).delete(key);
    } catch (e) {
      throw const CacheException('Failed to remove data');
    }
  }

  @override
  Future<void> setData<T>(String key, T value) async {
    try {
      _checkIfBoxIsOpen<T>(key);
      await Hive.box<T>(key).add(value);
    } catch (e) {
      throw const CacheException('Failed to set data');
    }
  }

  Future<void> _checkIfBoxIsOpen<T>(String key) async {
    if (!Hive.isBoxOpen(key)) {
      await Hive.openBox<T>(key);
    }
  }

  @override
  Future<void> addData<T>(String key, T value) async {
    try {
      _checkIfBoxIsOpen<T>(key);
      await Hive.box<T>(key).add(value);
    } catch (e) {
      throw const CacheException('Failed to add data');
    }
  }

  @override
  Future<List<T>> getDataList<T>(String key) async {
    try {
      _checkIfBoxIsOpen<T>(key);
      final box = Hive.box<T>(key);
      return box.values.toList();
    } catch (e) {
      throw const CacheException('Failed to add data');
    }
  }
}
