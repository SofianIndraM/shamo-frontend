import 'package:equatable/equatable.dart';
import 'package:shamo_frontend/models/category_model.dart';
import 'package:shamo_frontend/models/gallery_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final double price;
  final String description;
  final String tags;
  final CategoryModel? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<GalleryModel>? galleries;

  ProductModel({
    this.id = 0,
    this.name = '',
    this.price = 0.0,
    this.description = '',
    this.tags = '',
    this.category,
    this.createdAt,
    this.galleries,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        tags: json['tags'],
        price: double.parse(json['price'].toString()),
        category: CategoryModel.fromJson(json['category']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        galleries: json['galleries']
            .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'tags': tags,
        'price': price,
        'category': category!.toJson(),
        'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
        'created_at': createdAt.toString(),
        'updated_at': updatedAt.toString(),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        tags,
        price,
        category,
        createdAt,
        updatedAt,
        galleries,
      ];
}

class UninitializedProductModel extends ProductModel {}
