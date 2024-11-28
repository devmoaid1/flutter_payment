import 'package:equatable/equatable.dart';

class PaymentIntnetResponse extends Equatable {
  final String clientSecret;

  const PaymentIntnetResponse({required this.clientSecret});
  @override
  List<Object?> get props => [clientSecret];

  factory PaymentIntnetResponse.fromJson(Map<String, dynamic> json) {
    return PaymentIntnetResponse(clientSecret: json['client_secret']);
  }
}
