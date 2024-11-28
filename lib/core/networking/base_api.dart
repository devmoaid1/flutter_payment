abstract interface class BaseApi {
  Future<T> post<T>(
      {required String url,
      Object? data,
      required Map<String, dynamic> body,
      required T Function(Map<String, dynamic> json) fromJson,
      Map<String, dynamic>? queryParameters});
}
