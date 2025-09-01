import 'package:equatable/equatable.dart';
import 'package:food_app/model/cart.dart';
import 'package:food_app/model/product_model.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitialState extends CartState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class CartItemLoadedState extends CartState {
  Cart productData;
  Cart cartData;

  CartItemLoadedState({required this.productData, required this.cartData});
  @override
  List<Object?> get props => [];
}

class CartItemLoadingState extends CartState {
  final Cart cart;
  final List<Product> cartProducts;

  CartItemLoadingState(this.cart, this.cartProducts);

  @override
  List<Object?> get props => [];
}

class CartItemDeleteingState extends CartState {
  final List<Product> cartProducts;

  CartItemDeleteingState(this.cartProducts);
}
