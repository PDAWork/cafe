part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeInitialEvent extends HomeEvent {}

final class HomeFilterEvent extends HomeEvent {
  final List<CategoryEntity> category;

  HomeFilterEvent({required this.category});
}
