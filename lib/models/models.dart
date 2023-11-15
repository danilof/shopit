import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class UsersResponse with _$UsersResponse, SerializeJson {
  UsersResponse._();

  factory UsersResponse(
      {required List<User> users,
      required int total,
      required int skip,
      required int limit}) = _UsersResponse;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
}

@freezed
class User with _$User, SerializeJson {
  User._();

  factory User({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String image,
    required String username,
    required String password,
    String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AuthUser with _$AuthUser, SerializeJson {
  AuthUser._();

  factory AuthUser({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String image,
    required String username,
    required String token,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}

@freezed
class ProductsResponse with _$ProductsResponse, SerializeJson {
  ProductsResponse._();

  factory ProductsResponse(
      {required List<Product> products,
      required int total,
      required int skip,
      required int limit}) = _ProductsResponse;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}

@freezed
class Product with _$Product, SerializeJson {
  Product._();

  factory Product(
      {required int id,
      required String title,
      required String description,
      required int price,
      required double discountPercentage,
      required double rating,
      required int stock,
      required String brand,
      required String category,
      required String thumbnail,
      required List<String> images}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

mixin SerializeJson {
  Map<String, dynamic> toJson();
}
