import 'package:cafe/features/welcome/presentation/ui/welcome.dart';
import 'package:cafe/routes/routes_utils.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Pages.welcome.screenPath,
        name: Pages.welcome.screenName,
        builder: (context, state) => WelcomeScreen(),
      ),
    ],
  );
}
