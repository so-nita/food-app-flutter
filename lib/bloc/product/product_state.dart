import 'package:equatable/equatable.dart';
import '../../model/product_model.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  ProductLoadedState(this.products);
  final List<Product> products;

  @override
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
