import 'package:cafe/routes/app_router.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemMenuScreen extends StatelessWidget {
  const ItemMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    width: 343.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(-0.00, -1.00),
                        end: const Alignment(0, 1),
                        colors: [
                          const Color(0xFFD1CFD2).withOpacity(0.33),
                          const Color(0xFFD1CFD2).withOpacity(0.5),
                          const Color(0xFFD1CFD2).withOpacity(1)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Image.asset(
                      'assets/Image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        AppRouter.router.pop();
                      },
                      icon: const Icon(
                        Icons.clear,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Салат и обжареной свининой',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    '330 г',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColor.text3),
                  ),
                  SizedBox(width: 16.h),
                  Text(
                    '216,6 ккал',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColor.text3),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Обжаренная свинина, салат «Айсберг», отварная фасоль, обжаренные шампиньоны, зелень, кунжут, соус «Бальзамик»',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColor.text1),
              ),
              SizedBox(height: 20.h),
              Text(
                'Пищевая ценность на 100г',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColor.text3),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const ItemInformationGramm(
                    title: "65,5",
                    subtitle: "Ккал",
                  ),
                  SizedBox(width: 34.w),
                  const ItemInformationGramm(
                    title: "6,6 г",
                    subtitle: "Белки",
                  ),
                  SizedBox(width: 34.w),
                  const ItemInformationGramm(
                    title: "1,8 г",
                    subtitle: "Жиры",
                  ),
                  SizedBox(width: 34.w),
                  const ItemInformationGramm(
                    title: "5,2 г",
                    subtitle: "Углеводы",
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('В корзину за 440 ₽'),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      'assets/Plus.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColor.base1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemInformationGramm extends StatelessWidget {
  const ItemInformationGramm({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: AppColor.text1),
        ),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: AppColor.text3),
        ),
      ],
    );
  }
}
