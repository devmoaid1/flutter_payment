abstract class LocalStorageService {
  Future<T?> getData<T>(String key);
  Future<void> setData<T>(String key, T value);
  Future<void> addData<T>(String key, T value);
  Future<void> removeData<T>(String key);
}
