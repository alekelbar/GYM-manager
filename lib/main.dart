import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_controller/config/router/app_router.dart';
import 'package:gym_controller/config/theme/theme_config.dart';
import 'package:gym_controller/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'GYM controller',
      theme: ThemeConfig().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
