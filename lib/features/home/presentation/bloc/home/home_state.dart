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
  final List<ItemMenuEntity> _saveItemMenu;
  HomeSuccess(
    this._saveItemMenu, {
    required this.itemMenu,
    required this.category,
  });

  HomeSuccess copyWith({
    List<ItemMenuEntity>? itemMenu,
    List<CategoryEntity>? category,
  }) {
    return HomeSuccess(
      _saveItemMenu,
      itemMenu: itemMenu ?? this.itemMenu,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [itemMenu, category];
}

final class HomeError extends HomeState {
  @override
  List<Object?> get props => [];
}
