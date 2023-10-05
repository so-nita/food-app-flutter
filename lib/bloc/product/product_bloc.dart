import 'package:app_food/repository/product_repository.dart';
import 'package:bloc/bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductLoadingState()) {
    //Get
    on<ProductLoadingEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await repository.getAllProduct();
        // print('Product $products');
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
