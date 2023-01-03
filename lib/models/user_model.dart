import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String username;
  final String profilePhotoUrl;
  String token;

  UserModel({
    required this.id,
    this.name = '',
    this.email = '',
    this.username = '',
    this.profilePhotoUrl = '',
    this.token = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        profilePhotoUrl: json['profile_photo_url'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'username': username,
        'profile_photo_url': profilePhotoUrl,
        'token': token,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        username,
        profilePhotoUrl,
        token,
      ];
}
