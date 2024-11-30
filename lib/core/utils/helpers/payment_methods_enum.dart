import 'package:hive/hive.dart';
part 'payment_methods_enum.g.dart';

@HiveType(typeId: 1)
enum PaymentMethods {
  @HiveField(10)
  creditCard,
  @HiveField(8)
  paypal
}
