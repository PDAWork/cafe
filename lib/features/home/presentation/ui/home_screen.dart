import 'package:cafe/features/home/presentation/cubit/home_tab_cubit.dart';
import 'package:cafe/features/home/presentation/pages/basket_pages.dart';
import 'package:cafe/features/home/presentation/pages/menu_pages.dart';
import 'package:cafe/features/home/presentation/pages/reservation_pages.dart';
import 'package:cafe/features/home/presentation/pages/settigns_pages.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select(
      (HomeTabCubit value) => value.state.tab,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedTab.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) =>
            context.read<HomeTabCubit>().setTab(HomeTab.values[index]),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedTab.index,
        backgroundColor: AppColor.base1,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.base5,
        selectedLabelStyle: Theme.of(context).textTheme.caption,
        unselectedLabelStyle: Theme.of(context).textTheme.caption,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/MenuFood.svg',
              colorFilter: ColorFilter.mode(
                selectedTab.index == 0 ? AppColor.primary : AppColor.base5,
                BlendMode.srcIn,
              ),
            ),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Agreement_02.svg',
              colorFilter: ColorFilter.mode(
                selectedTab.index == 1 ? AppColor.primary : AppColor.base5,
                BlendMode.srcIn,
              ),
            ),
            label: 'Бронь',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Basket.svg',
              colorFilter: ColorFilter.mode(
                selectedTab.index == 2 ? AppColor.primary : AppColor.base5,
                BlendMode.srcIn,
              ),
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Settings.svg',
              colorFilter: ColorFilter.mode(
                selectedTab.index == 3 ? AppColor.primary : AppColor.base5,
                BlendMode.srcIn,
              ),
            ),
            label: 'Настройки',
          ),
        ],
      ),
      // body: _pages[value],
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          MenuPages(),
          ReservationPages(),
          BasketPages(),
          SettignsPages(),
        ],
      ),
    );
  }
}
