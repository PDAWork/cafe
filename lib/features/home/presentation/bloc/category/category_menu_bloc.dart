import 'package:bloc/bloc.dart';
import 'package:cafe/features/home/domain/entity/category_entity.dart';
import 'package:meta/meta.dart';

part 'category_menu_event.dart';
part 'category_menu_state.dart';

class CategoryMenuBloc extends Bloc<CategoryMenuEvent, CategoryMenuState> {
  CategoryMenuBloc() : super(CategoryMenuInitial()) {
    on<CategoryMenuEvent>((event, emit) {});
    on<OnSelectCategoryMenuEvent>((event, emit) {
      List<CategoryEntity> list = [];
      if (state is CategoryMenuSuccess) {
        list = (state as CategoryMenuSuccess).categoryList;
      }
      emit(CategoryMenuLoad());
      list
          .firstWhere(
            (element) => element.name == event.name,
          )
          .isCheck = event.isCheck;
      emit(CategoryMenuSuccess(categoryList: list));
    });
    on<InitCategoryMenuEvent>((event, emit) {
      emit(CategoryMenuSuccess(categoryList: event.category));
    });
  }
}
