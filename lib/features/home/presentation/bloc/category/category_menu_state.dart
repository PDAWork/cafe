part of 'category_menu_bloc.dart';

@immutable
sealed class CategoryMenuState {}

final class CategoryMenuInitial extends CategoryMenuState {}

final class CategoryMenuLoad extends CategoryMenuState {}

final class CategoryMenuSuccess extends CategoryMenuState {
  final List<CategoryEntity> categoryList;

  CategoryMenuSuccess({required this.categoryList});
}
