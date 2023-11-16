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
      required double price,
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

@freezed
class CartsResponse with _$CartsResponse, SerializeJson {
  CartsResponse._();

  factory CartsResponse(
      {required List<Cart> carts,
      required int total,
      required int skip,
      required int limit}) = _CartsResponse;

  factory CartsResponse.fromJson(Map<String, dynamic> json) =>
      _$CartsResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Cart with _$Cart, SerializeJson {
  Cart._();

  factory Cart(
      {required int id,
      required int total,
      required double discountedTotal,
      required int totalProducts,
      required int totalQuantity,
      required List<CartProduct> products}) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  factory Cart.empty() {
    return Cart(
        id: 0,
        total: 0,
        discountedTotal: 0,
        totalProducts: 0,
        totalQuantity: 0,
        products: []);
  }
}

@freezed
class CartProduct with _$CartProduct, SerializeJson {
  CartProduct._();

  factory CartProduct(
      {required int id,
      required String title,
      required double price,
      required double discountPercentage,
      required double discountedPrice,
      required int quantity,
      required String thumbnail}) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  factory CartProduct.fromProduct(Product product, int quantity) {
    return CartProduct(
        id: product.id,
        title: product.title,
        price: product.price,
        discountPercentage: product.discountPercentage,
        quantity: quantity,
        thumbnail: product.thumbnail,
        discountedPrice:
            product.price - product.price * (product.discountPercentage / 100));
  }
}

mixin SerializeJson {
  Map<String, dynamic> toJson();
}
