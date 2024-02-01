import 'package:cafe/features/home/presentation/bloc/category_menu_bloc.dart';
import 'package:cafe/features/home/presentation/widget/category_menu.dart';
import 'package:cafe/routes/app_router.dart';
import 'package:cafe/routes/routes_utils.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MenuPages extends StatelessWidget {
  const MenuPages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          sliver: SliverAppBar(
            flexibleSpace: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<CategoryMenuBloc, CategoryMenuState>(
                builder: (context, state) {
                  int index = 0;
                  return switch (state) {
                    CategoryMenuSuccess(:final categoryList) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: categoryList
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(
                                    left: ++index == 1 ? 16.0 : 0,
                                    right: index != 0 ? 8 : 0),
                                child: CardCategory(
                                  isCheck: e.isCheck,
                                  name: e.name,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    _ => const SizedBox(),
                  };
                },
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 242.h,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 7.w,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  AppRouter.router.goNamed(Pages.itemMenu.screenName);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
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
                      child: Image.asset('assets/Image.png'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Салат с обжаренной свининой',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '330 г',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.text2),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.5,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColor.clear,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '440 ₽',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: AppColor.accentActive),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                'assets/Plus.svg',
                                colorFilter: const ColorFilter.mode(
                                  AppColor.accentActive,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
