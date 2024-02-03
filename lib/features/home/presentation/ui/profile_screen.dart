import 'package:cafe/features/home/presentation/widget/custom_text_field.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        foregroundColor: AppColor.base5,
        title: Text(
          'Мои данные',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomTextField(label: 'Имя'),
            CustomTextField(label: 'Телефон'),
            CustomTextField(label: 'Эл. почта'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                          backgroundColor:
                              const MaterialStatePropertyAll(AppColor.base3),
                          foregroundColor:
                              const MaterialStatePropertyAll(AppColor.text1),
                        ),
                    onPressed: () {},
                    child: const Text('Отмена'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Сохранить'),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
