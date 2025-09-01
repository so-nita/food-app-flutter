import 'package:equatable/equatable.dart';
import 'package:food_app/model/product_model.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitialEvent extends CartEvent {
  CartInitialEvent();
  @override
  List<Object?> get props => [];
}

class ItemAddingCartEvent extends CartEvent {
  final List<Product> cartProduct;

  ItemAddingCartEvent(this.cartProduct);
}

class ItemAddedCartEvent extends CartEvent {
  final List<Product> cartProduct;

  ItemAddedCartEvent(this.cartProduct);
}

class ItemDeleteCartEvent extends CartEvent {
  final List<Product> cartProduct;

  ItemDeleteCartEvent(this.cartProduct);
}
