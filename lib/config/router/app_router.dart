import 'package:go_router/go_router.dart';
import 'package:gym_app/presentation/pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
      name: HomeView.name,
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
      name: LoginView.name,
    ),
    GoRoute(
      path: '/add_register',
      builder: (context, state) => const AddRegisterScreen(),
      name: AddRegisterScreen.name,
    ),
  ],
);
