import 'package:cafe/features/home/presentation/widget/settigns_card.dart';
import 'package:cafe/routes/app_router.dart';
import 'package:cafe/routes/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class SettignsPages extends StatelessWidget {
  const SettignsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettginsCard(
          onTap: () {
            AppRouter.router.goNamed(Pages.profile.screenName);
          },
          pathIcon: 'assets/Profile.svg',
          title: 'Профиль',
        ),
        SettginsCard(
          pathIcon: 'assets/Confendiality.svg',
          title: 'Политика конфиденциальности',
        ),
        SettginsCard(
          pathIcon: 'assets/Agreement_02.svg',
          title: 'Пользовательское соглашение',
        ),
        SettginsCard(
          onTap: () async {
            final InAppReview inAppReview = InAppReview.instance;
            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            }
          },
          pathIcon: 'assets/Star.svg',
          title: 'Оценить приложение',
        ),
      ],
    );
  }
}
