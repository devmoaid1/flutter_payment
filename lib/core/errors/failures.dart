import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
} // for remote data

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class PaymentProcessorFailure extends Failure {
  const PaymentProcessorFailure({required super.message});
}
