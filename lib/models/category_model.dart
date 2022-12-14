import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    this.name = '',
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
