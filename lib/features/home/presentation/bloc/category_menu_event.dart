part of 'category_menu_bloc.dart';

@immutable
sealed class CategoryMenuEvent {}

final class OnSelectCategoryMenuEvent extends CategoryMenuEvent {
  final String name;
  final bool isCheck;

  OnSelectCategoryMenuEvent({required this.isCheck, required this.name});
}

final class InitCategoryMenuEvent extends CategoryMenuEvent {}
