import 'package:cafe/features/home/presentation/widget/button_item.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BasketPages extends StatelessWidget {
  const BasketPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '3 товара на сумму 1390 ₽',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColor.text1),
                  ),
                  SvgPicture.asset(
                    'assets/Trash.svg',
                    width: 20,
                    height: 22,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ...List.generate(3, (index) => null).map(
              (e) => Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.clear,
                    ),
                  ),
                ),
                height: 88.h,
                margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Row(
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
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Салат с обжаренной свининой'),
                        Text('440 ₽'),
                        Spacer(),
                        ButtonItem(cost: 440),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 20,
                left: 16,
                right: 16,
              ),
              child: Text('Добавить к заказу?'),
            ),
            Container(
              height: 205.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7D7D7D).withOpacity(0.3),
                    spreadRadius: 16,
                    blurRadius: 16,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: 109.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 0,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          'Суп-пюре с мидиями',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Spacer(),
                        Text(
                          '330 г',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: AppColor.text2),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 70.h)
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Оформить заказ'),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
