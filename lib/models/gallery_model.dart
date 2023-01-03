import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GalleryModel extends Equatable {
  final int id;
  final String url;

  GalleryModel({
    required this.id,
    this.url = '',
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json['id'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };

  @override
  List<Object?> get props => [
        id,
        url,
      ];
}
