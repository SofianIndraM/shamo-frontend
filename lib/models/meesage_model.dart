import 'package:equatable/equatable.dart';
import 'package:shamo_frontend/models/product_model.dart';

class MessageModel extends Equatable {
  final String message;
  final int userId;
  final String userName;
  final String userImage;
  final bool isFromUser;
  final ProductModel? product;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MessageModel({
    this.message = '',
    this.userId = 0,
    this.userImage = '',
    this.userName = '',
    this.isFromUser = false,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        userId: json['userId'],
        userImage: json['userImage'],
        userName: json['userName'],
        isFromUser: json['isFromUser'],
        product: json['product'].isEmpty
            ? UninitializedProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'userId': userId,
        'userImage': userImage,
        'userName': userName,
        'isFromUser': isFromUser,
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'created_at': createdAt.toString(),
        'updated_at': updatedAt.toString(),
      };

  @override
  List<Object?> get props => [
        message,
        userId,
        userImage,
        userName,
        isFromUser,
        product,
        createdAt,
        updatedAt,
      ];
}
