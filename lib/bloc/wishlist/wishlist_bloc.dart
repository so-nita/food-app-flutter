// import 'package:app_food/bloc/wishlist/wishlist_event.dart';
// import 'package:app_food/bloc/wishlist/wishlist_state.dart';
// import 'package:app_food/model/wishlist_model.dart';
// import 'package:bloc/bloc.dart';

// class WishlistBloc extends Bloc<WishlistEvent, WishListState> {
//   WishlistBloc() : super(WishlistLoadingState()) {
//     on<WishlistEvent>((event, emit) async {
//       if (state is WishlistLoadedState) {}
//     });
//     // ignore: unused_element
//     Stream<WishListState> mapEventToState(WishlistEvent event) async* {
//       if (event is WishlistStartEvent) {
//         yield* _mapStartWishlistToState();
//       } else if (event is WishlistAddEvent) {
//         yield* _mapAddWishlistToState(event, state);
//       } else if (event is WishlistDeletEevent) {
//         yield* _mapDeleteWishlistToState(event, state);
//       }
//     }
//   }
//   Stream<WishListState> _mapStartWishlistToState() async* {
//     yield WishlistLoadingState();
//     try {
//       yield WishlistLoadingState();
//     } catch (_) {}
//   }

//   Stream<WishListState> _mapAddWishlistToState(
//       WishlistAddEvent state, WishListState event) async* {
//     yield WishlistLoadingState();
//     try {
//       yield WishlistLoadedState(
//           wishlist: Wishlist(products: List.from(state.product.p)));
//     } catch (_) {}
//   }

//   Stream<WishListState> _mapDeleteWishlistToState(
//       WishlistDeletEevent event, WishListState state) async* {
//     yield WishlistLoadingState();
//     try {
//       yield WishlistLoadingState();
//     } catch (_) {}
//   }
// }
