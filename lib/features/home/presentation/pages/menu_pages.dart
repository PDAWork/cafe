import 'package:cafe/features/home/presentation/bloc/category/category_menu_bloc.dart';
import 'package:cafe/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:cafe/features/home/presentation/widget/button_item.dart';
import 'package:cafe/features/home/presentation/widget/category_menu.dart';
import 'package:cafe/routes/app_router.dart';
import 'package:cafe/routes/routes_utils.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuPages extends StatelessWidget {
  const MenuPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccess) {
            context
                .read<CategoryMenuBloc>()
                .add(InitCategoryMenuEvent(category: state.category));
          }
        },
        child: switch (context.watch<HomeBloc>().state) {
          HomeInitial() || HomeLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          HomeSuccess(:final itemMenu) => Column(
              children: [
                Container(
                  height: 28.h,
                  margin: const EdgeInsets.only(bottom: 26),
                  child: BlocBuilder<CategoryMenuBloc, CategoryMenuState>(
                    builder: (context, state) {
                      return switch (state) {
                        CategoryMenuSuccess(:final categoryList) =>
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 16.0 : 0,
                                  right:
                                      index == categoryList.length ? 16.0 : 8,
                                ),
                                child: CardCategory(
                                  isCheck: categoryList[index].isCheck,
                                  name: categoryList[index].name,
                                ),
                              );
                            },
                          ),
                        _ => const SizedBox(),
                      };
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 257.h,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 7.w,
                      ),
                      itemCount: itemMenu.length,
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
                                child: Image.asset(
                                  "assets/${itemMenu[index].path}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                itemMenu[index].title,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                '${itemMenu[index].weight} г',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColor.text2),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  ButtonItem(
                                    cost: itemMenu[index].cost,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          _ => const SizedBox(),
        });

    // CustomScrollView(
    //     slivers: [
    //       SliverPadding(
    //         padding: const EdgeInsets.only(
    //           top: 8,
    //         ),
    //         sliver: SliverAppBar(
    //           flexibleSpace: SingleChildScrollView(
    //             physics: const BouncingScrollPhysics(),
    //             padding: EdgeInsets.zero,
    //             scrollDirection: Axis.horizontal,
    //             child: BlocBuilder<CategoryMenuBloc, CategoryMenuState>(
    //               builder: (context, state) {
    //                 int index = 0;
    //                 return switch (state) {
    //                   CategoryMenuSuccess(:final categoryList) => Row(
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: categoryList
    //                           .map(
    //                             (e) => Padding(
    //                               padding: EdgeInsets.only(
    //                                   left: ++index == 1 ? 16.0 : 0,
    //                                   right: index != 0 ? 8 : 0),
    //                               child: CardCategory(
    //                                 isCheck: e.isCheck,
    //                                 name: e.name,
    //                               ),
    //                             ),
    //                           )
    //                           .toList(),
    //                     ),
    //                   _ => const SizedBox(),
    //                 };
    //               },
    //             ),
    //           ),
    //         ),
    //       ),
    //       SliverPadding(
    //         padding: const EdgeInsets.only(left: 16, right: 16),
    //         sliver: SliverGrid.builder(
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             mainAxisExtent: 257.h,
    //             mainAxisSpacing: 20.h,
    //             crossAxisSpacing: 7.w,
    //           ),
    //           itemCount: itemMenu.length,
    //           itemBuilder: (context, index) {
    //             return InkWell(
    //               onTap: () {
    //                 AppRouter.router.goNamed(Pages.itemMenu.screenName);
    //               },
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 crossAxisAlignment: CrossAxisAlignment.stretch,
    //                 children: [
    //                   Container(
    //                     clipBehavior: Clip.antiAlias,
    //                     decoration: ShapeDecoration(
    //                       gradient: LinearGradient(
    //                         begin: const Alignment(-0.00, -1.00),
    //                         end: const Alignment(0, 1),
    //                         colors: [
    //                           const Color(0xFFD1CFD2).withOpacity(0.33),
    //                           const Color(0xFFD1CFD2).withOpacity(0.5),
    //                           const Color(0xFFD1CFD2).withOpacity(1)
    //                         ],
    //                       ),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(12),
    //                       ),
    //                     ),
    //                     child: Image.asset(
    //                       "assets/${itemMenu[index].path}",
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 8.h,
    //                   ),
    //                   Text(
    //                     itemMenu[index].title,
    //                     style: Theme.of(context).textTheme.bodySmall,
    //                   ),
    //                   SizedBox(
    //                     height: 4.h,
    //                   ),
    //                   Text(
    //                     '${itemMenu[index].weight} г',
    //                     style: Theme.of(context)
    //                         .textTheme
    //                         .bodySmall!
    //                         .copyWith(color: AppColor.text2),
    //                   ),
    //                   SizedBox(height: 8.h),
    //                   Row(
    //                     children: [
    //                       ButtonItem(
    //                         cost: itemMenu[index].cost,
    //                       ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       )
    //     ],
    //   ),
  }
}
