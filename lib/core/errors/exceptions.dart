sealed class AppException {
  final String message;
  const AppException(this.message);
}

class CacheException extends AppException {
  const CacheException(super.message);
}
