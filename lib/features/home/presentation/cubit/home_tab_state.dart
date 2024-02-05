part of 'home_tab_cubit.dart';

enum HomeTab {
  menu(
    title: 'Меню',
  ),
  reservation(
    title: 'Бронирование сталов',
  ),
  basket(
    title: 'Корзина',
  ),
  settigns(
    title: 'Настройки',
  );

  const HomeTab({
    required this.title,
  });
  final String title;
}

final class HomeTabState extends Equatable {
  const HomeTabState({
    this.tab = HomeTab.menu,
  });

  final HomeTab tab;

  HomeTabState copyWith(HomeTab? tab) {
    return HomeTabState(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object> get props => [tab];
}
