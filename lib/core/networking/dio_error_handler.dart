import 'package:dio/dio.dart';

import '../errors/error_messages.dart';
import '../errors/exceptions.dart';

import '../utils/helpers/network_exceptions_types.dart';

class DioErrorHandler {
  const DioErrorHandler._();

  static AppException handle(dynamic e) {
    if (e is DioException) {
      return _handleDioError(e);
    } else {
      return ServerException(
        type: NetworkExceptionType.unknown,
      );
    }
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerException(
            type: NetworkExceptionType.connectionTimeout,
            code: error.response?.statusCode,
            message: AppErrorMessages.networkExceptionMessages[
                NetworkExceptionType.connectionTimeout]!);
      case DioExceptionType.cancel:
        return ServerException(
            type: NetworkExceptionType.cancel,
            message: AppErrorMessages
                .networkExceptionMessages[NetworkExceptionType.cancel]!);
      case DioExceptionType.connectionError:
        return ServerException(
            type: NetworkExceptionType.noInternetConnection,
            message: AppErrorMessages.networkExceptionMessages[
                NetworkExceptionType.noInternetConnection]!);
      case DioExceptionType.badCertificate:
        return ServerException(
            type: NetworkExceptionType.badCertificate,
            message: AppErrorMessages.networkExceptionMessages[
                NetworkExceptionType.badCertificate]!);
      case DioExceptionType.unknown:
        return ServerException(
            type: NetworkExceptionType.unknown,
            message: AppErrorMessages
                .networkExceptionMessages[NetworkExceptionType.unknown]!);
      default:
        return ServerException(
            type: NetworkExceptionType.unknown,
            message: AppErrorMessages
                .networkExceptionMessages[NetworkExceptionType.unknown]!);
    }
  }
}
