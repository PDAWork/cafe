import 'package:cafe/features/home/presentation/pages/menu_pages.dart';
import 'package:cafe/features/home/presentation/pages/reservation_pages.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _pages = [
    const MenuPages(),
    const ReservationPages(),
    const Center(child: Text('Корзина')),
    const Center(child: Text('Настройки')),
  ];
  final List<String> titleAppBar = [
    'Меню',
    'Бронирование сталов',
    'Корзина',
    'Настройки'
  ];

  final ValueNotifier<int> _value = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _value,
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            titleAppBar[value],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _value.value = index;
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _value.value,
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
                  value == 0 ? AppColor.primary : AppColor.base5,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Меню',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/Agreement_02.svg',
                colorFilter: ColorFilter.mode(
                  value == 1 ? AppColor.primary : AppColor.base5,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Бронь',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/Basket.svg',
                colorFilter: ColorFilter.mode(
                  value == 2 ? AppColor.primary : AppColor.base5,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/Settings.svg',
                colorFilter: ColorFilter.mode(
                  value == 3 ? AppColor.primary : AppColor.base5,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Настройки',
            ),
          ],
        ),
        body: _pages[value],
      ),
    );
  }
}
