import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_controller/presentation/bloc/auth/auth_bloc.dart';
import 'package:gym_controller/presentation/pages/home/home_view.dart';

class LoginView extends StatelessWidget {
  static const name = "login-view";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! UnAutenticated) const HomeView();

        return Scaffold(
          appBar: AppBar(
            title: const Text("login"),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        "https://img.icons8.com/?size=512&id=17949&format=png",
                        width: 45,
                        height: 45,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Iniciar sesión con google",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
