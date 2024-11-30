import '../utils/helpers/network_exceptions_types.dart';

sealed class AppException {
  final String message;
  final int? code;
  const AppException({required this.message, this.code});
}

class ServerException extends AppException {
  final NetworkExceptionType type;
  ServerException(
      {required this.type, super.message = 'Network error', super.code});
}

class CacheException extends AppException {
  const CacheException({super.message = 'Cache error'});
}

class DataExistsCacheException extends CacheException {
  DataExistsCacheException({super.message});
}

// general exception for any payment processor error
class PaymentProcessorException extends AppException {
  const PaymentProcessorException({super.message = 'Payment error'});
}
