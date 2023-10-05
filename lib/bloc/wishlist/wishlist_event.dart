import 'package:app_food/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
  @override
  List<Object?> get props => [];
}

class WishlistStartEvent extends WishlistEvent {}

class WishlistAddEvent extends WishlistEvent {
  final Product product;
  const WishlistAddEvent(this.product);
  @override
  List<Object?> get props => [product];
}

class WishlistDeletEevent extends WishlistEvent {
  late final Product product;
  @override
  List<Object?> get props => [product];
}
