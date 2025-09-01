import 'package:bloc/bloc.dart';
import 'package:food_app/model/category_model.dart';
import 'package:food_app/repository/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(CategoryLoadingState()) {
    // Get Category
    on<CategoryLoadingEvent>((event, emit) async {
      try {
        List<Category> categories = await _categoryRepository.getAllCategory();
        emit(CategoryLoadedState(categories));
      } catch (e) {
        //print(e);
        emit(CategoryErrorState(error: e.toString()));
      }
    });
  }
}
