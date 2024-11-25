import 'package:hive/hive.dart';
part 'payment_methods_enum.g.dart';

@HiveType(typeId: 1)
enum PaymentMethods {
  @HiveField(6)
  visa,
  @HiveField(7)
  mastercard,
  @HiveField(8)
  paypal
}
