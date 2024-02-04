part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeSuccess extends HomeState {
  final List<ItemMenuEntity> itemMenu;
  final List<CategoryEntity> category;

  HomeSuccess({
    required this.itemMenu,
    required this.category,
  });

  @override
  List<Object?> get props => [itemMenu];
}

final class HomeError extends HomeState {
  @override
  List<Object?> get props => [];
}
