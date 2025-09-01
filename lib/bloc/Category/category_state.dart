import 'package:equatable/equatable.dart';
import 'package:food_app/model/category_model.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingState extends CategoryState {
  CategoryLoadingState();
  @override
  List<Object?> get props => [];
}

class CategoryLoadState extends CategoryState {
  CategoryLoadState(this.categories);
  final List<Category> categories;

  @override
  List<Object?> get props => [categories];
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState(this.categories);
  final List<Category> categories;

  @override
  List<Object?> get props => [categories];
}

class CategoryErrorState extends CategoryState {
  final String error;
  CategoryErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

// class CategoryCreatingState extends CategoryState {
//   @override
//   List<Object?> get props => [];
// }

// class CategoryCreatedState extends CategoryState {
//   // final List<CategoryModel> categories;
//   CategoryCreatedState();
//   @override
//   List<Object?> get props => [];
// }

// class CategoryDeleteState extends CategoryState {
//   @override
//   List<Object?> get props => [];
// }


