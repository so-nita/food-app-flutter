import 'package:equatable/equatable.dart';
import '../../model/wishlist_model.dart';

abstract class WishListState extends Equatable {
  @override
  List<Object?> get props => [];
}

//class WishlistLoadingState extends WishListState {}

// ignore: must_be_immutable
class WishlistLoadedState extends WishListState {
  Wishlist wishlist;
  WishlistLoadedState({this.wishlist = const Wishlist()});
  @override
  List<Object?> get props => [wishlist];
}

class WishlistErrorState extends WishListState {}
