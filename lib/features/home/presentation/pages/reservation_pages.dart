import 'package:cafe/features/home/presentation/widget/custom_text_field.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationPages extends StatelessWidget {
  const ReservationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
      ),
      children: [
        const CustomTextField(
          label: 'Имя',
        ),
        const CustomTextField(
          label: 'Телефон',
        ),
        const CustomTextField(
          label: 'Эл. почта',
        ),
        const CustomTextField(
          label: 'Дата',
          type: TextFieldType.date,
        ),
        const CustomTextField(
          label: 'Время',
          type: TextFieldType.time,
        ),
        const CustomTextField(
          label: 'Количество гостей',
          type: TextFieldType.gost,
        ),
        const CustomTextField(
          label: 'Комментарий (не обязательно)',
          minLines: 6,
          maxLines: 6,
        ),
        SizedBox(height: 20.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.secondary2,
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.info_outline),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  'Для подтверждения брони мы свяжемся с вами по телефону или электронной почте. Пожалуйста, дождитесь подтверджения бронирования.',
                  style: Theme.of(context).textTheme.headlineMedium,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Отправить'),
        )
      ],
    );
  }
}
