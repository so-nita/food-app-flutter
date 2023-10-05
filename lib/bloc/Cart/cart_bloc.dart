import 'package:app_food/model/cart.dart';
import 'package:app_food/repository/cart_repository.dart';
import 'package:bloc/bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _repository = CartRepository();
  CartBloc() : super(CartInitialState()) {
    on<CartEvent>((event, emit) {
      add(CartInitialEvent());
      // emit(CartItemLoadedState(cartproduct, productData))
    });

    @override
    Stream<Cart> mapEvenToState(CartEvent event) async* {
      if (event is CartInitialEvent) {
        var productData = await _repository.getShopItems();
        var cartData = await _repository.getCartItems();
        CartItemLoadedState(productData: productData, cartData: cartData);
      }
    }
  }
}
