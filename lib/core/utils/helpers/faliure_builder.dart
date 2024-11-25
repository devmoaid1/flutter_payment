import '../../errors/exceptions.dart';
import '../../errors/failures.dart';

class FaliureBuilder {
  FaliureBuilder();

  Failure build(
    CacheException exc,
  ) {
    if (exc is DataExistsCacheException) {
      return const CacheFailure(
          message:
              'Payment method already exists'); // Default for DataExistsCacheException
    } else {
      return CacheFailure(message: exc.message); // Default for other exceptions
    }
  }
}
