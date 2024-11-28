import '../utils/helpers/network_exceptions_types.dart';

class AppErrorMessages {
  static const Map<NetworkExceptionType, String> networkExceptionMessages = {
    NetworkExceptionType.backend:
        "Backend error occurred. Please try again later.",
    NetworkExceptionType.unauthorized:
        "Unauthorized access. Please log in again.",
    NetworkExceptionType.forbidden:
        "You do not have permission to access this resource.",
    NetworkExceptionType.notFound: "Requested resource not found.",
    NetworkExceptionType.conflict: "A conflict occurred with the request.",
    NetworkExceptionType.internal:
        "Internal server error. Please try again later.",
    NetworkExceptionType.serviceUnavailable:
        "Service is currently unavailable. Try again later.",
    NetworkExceptionType.timeout: "The request timed out. Please try again.",
    NetworkExceptionType.noInternet:
        "No internet connection. Check your network settings.",
    NetworkExceptionType.unknown:
        "An unknown error occurred. Please try again.",
    NetworkExceptionType.success: "Request succeeded.",
    NetworkExceptionType.noContent:
        "Request succeeded, but there is no content to display.",
    NetworkExceptionType.badRequest:
        "Bad request. Please check your input and try again.",
    NetworkExceptionType.connectionTimeout:
        "Connection timed out. Please try reconnecting.",
    NetworkExceptionType.cancel: "Request was canceled.",
    NetworkExceptionType.receiveTimeout: "The server took too long to respond.",
    NetworkExceptionType.sendTimeout: "The request took too long to send.",
    NetworkExceptionType.noInternetConnection:
        "No internet connection. Check your settings.",
    NetworkExceptionType.badCertificate:
        "Bad certificate. Secure connection failed.",
  };
}
