import 'package:cafe/routes/app_router.dart';
import 'package:cafe/routes/routes_utils.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.accentActive,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/illustration.png')),
          SizedBox(
            height: 4.h,
          ),
          Text(
            'Добро пожаловать',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColor.base1,
                ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Мы рады приветствовать вас в нашем приложении. Здесь вы можете забронировать столик, ознакомиться с меню и сделать заказ.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColor.base1),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                AppRouter.router.go(Pages.home.screenPath);
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(
                'Продолжить',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColor.base1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
