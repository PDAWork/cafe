import 'package:flutter/material.dart';
import 'features/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const App(), // Wrap your app
  //   ),
  // );
  runApp(const App());
}
