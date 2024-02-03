import 'package:cafe/dj/service.dart';
import 'package:cafe/features/home/presentation/bloc/category_menu_bloc.dart';
import 'package:cafe/features/home/presentation/ui/home_screen.dart';
import 'package:cafe/features/home/presentation/ui/item_menu_screen.dart';
import 'package:cafe/features/home/presentation/ui/profile_screen.dart';
import 'package:cafe/features/welcome/presentation/ui/welcome_screen.dart';
import 'package:cafe/routes/routes_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Pages.welcome.screenPath,
        name: Pages.welcome.screenName,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
          path: Pages.home.screenPath,
          name: Pages.home.screenName,
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    service<CategoryMenuBloc>()..add(InitCategoryMenuEvent()),
                child: HomeScreen(),
              ),
          routes: [
            GoRoute(
              path: Pages.itemMenu.screenPath,
              name: Pages.itemMenu.screenName,
              builder: (context, state) => const ItemMenuScreen(),
            ),
            GoRoute(
              path: Pages.profile.screenPath,
              name: Pages.profile.screenName,
              builder: (context, state) => const ProfileScreen(),
            )
          ])
    ],
  );
}
