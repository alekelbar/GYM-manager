import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  static const name = "login-view";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
