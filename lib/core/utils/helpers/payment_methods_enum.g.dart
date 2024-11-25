// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentMethodsAdapter extends TypeAdapter<PaymentMethods> {
  @override
  final int typeId = 1;

  @override
  PaymentMethods read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 6:
        return PaymentMethods.visa;
      case 7:
        return PaymentMethods.mastercard;
      case 8:
        return PaymentMethods.paypal;
      default:
        return PaymentMethods.visa;
    }
  }

  @override
  void write(BinaryWriter writer, PaymentMethods obj) {
    switch (obj) {
      case PaymentMethods.visa:
        writer.writeByte(6);
        break;
      case PaymentMethods.mastercard:
        writer.writeByte(7);
        break;
      case PaymentMethods.paypal:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentMethodsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
