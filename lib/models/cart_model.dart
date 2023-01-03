import 'package:equatable/equatable.dart';
import 'package:shamo_frontend/models/product_model.dart';

class CartModel extends Equatable {
  final int id;
  final ProductModel product;
  int quantity;

  CartModel({
    required this.id,
    required this.product,
    this.quantity = 0,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        product: ProductModel.fromJson(json['product']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product,
        'quantity': quantity,
      };

  double getTotalPrice() {
    return product.price * quantity;
  }

  @override
  List<Object?> get props => [
        id,
        product,
        quantity,
      ];
}
