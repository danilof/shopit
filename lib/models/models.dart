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

mixin SerializeJson {
  Map<String, dynamic> toJson();
}
