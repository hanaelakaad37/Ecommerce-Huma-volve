import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    super.id,
    super.email,
    super.password,
    super.name,
    super.role,
    super.avatar,
    super.creationAt,
    super.updatedAt,
  });

  factory SignUpModel.fromJson(dynamic json) {
    return SignUpModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      role: json['role'],
      avatar: json['avatar'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
