import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? name;
  final String? image;
  final double? price;

  const Product({this.name, this.image, this.price});

  @override
  String toString() {
    return 'Product(name: $name, image: $image, price: $price)';
  }

  @override
  List<Object?> get props => [name, image, price];
}
