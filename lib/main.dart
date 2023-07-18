import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/config/router/app_router.dart';
import 'package:gym_app/config/theme/theme_config.dart';
import 'package:gym_app/firebase_options.dart';
import 'package:gym_app/infrastructure/datasources/firebase_auth_datasource_impl.dart';
import 'package:gym_app/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:gym_app/presentation/bloc/auth/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final repository = FirebaseAuthRepositoryImpl(
    datasource: FirebaseAuthDatasourceImpl(),
  );

  runApp(BlocProvider(
    create: (context) => AuthBloc(repository: repository),
    child: const MyApp(),
  ));
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
