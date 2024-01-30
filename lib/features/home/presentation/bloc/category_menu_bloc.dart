import 'package:bloc/bloc.dart';
import 'package:cafe/features/home/domain/entity/category_menu.dart';
import 'package:meta/meta.dart';

part 'category_menu_event.dart';
part 'category_menu_state.dart';

class CategoryMenuBloc extends Bloc<CategoryMenuEvent, CategoryMenuState> {
  CategoryMenuBloc() : super(CategoryMenuInitial()) {
    on<CategoryMenuEvent>((event, emit) {});
    on<OnSelectCategoryMenuEvent>((event, emit) {
      final List<CategoryMenu> list = switch (state) {
        CategoryMenuSuccess(:final categoryList) => categoryList,
        _ => []
      };
      emit(CategoryMenuLoad());
      list.firstWhere((element) => element.name == event.name).isCheck =
          event.isCheck;
      emit(CategoryMenuSuccess(categoryList: list));
    });
    on<InitCategoryMenuEvent>((event, emit) {
      emit(CategoryMenuLoad());
      final categoryList = [
        CategoryMenu(name: 'Салаты'),
        CategoryMenu(name: 'Горячие блюда'),
        CategoryMenu(name: 'Десерты'),
        CategoryMenu(name: 'Напитки'),
        CategoryMenu(name: 'Пицца'),
        CategoryMenu(name: 'Блюда на углях'),
      ];

      emit(CategoryMenuSuccess(categoryList: categoryList));
    });
  }
}
