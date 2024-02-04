import 'package:cafe/di/service.dart';
import 'package:flutter/material.dart';
import 'features/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const App(), // Wrap your app
  //   ),
  // );
  runApp(const App());
}
