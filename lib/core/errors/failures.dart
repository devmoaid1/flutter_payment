sealed class Failure {
  final String message;
  const Failure({required this.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
