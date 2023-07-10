import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_controller/presentation/pages/pages.dart';

class HomeView extends StatelessWidget {
  static const String name = "home-view";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(
          child: FaIcon(
            FontAwesomeIcons.heartPulse,
            color: Colors.red,
            semanticLabel: "Training for life",
            size: 30,
          ),
        ),
        title: const Text("GYM controller"),
        actions: [
          const TextButton(
            onPressed: null,
            child: Row(
              children: [
                FaIcon(
                  Icons.light_mode,
                  color: Colors.black87,
                  size: 30,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => context.pushNamed(LoginView.name),
            child: const Row(
              children: [
                FaIcon(
                  Icons.login,
                  color: Colors.black87,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: const _HomeFloatActionButton(),
    );
  }
}

class _HomeFloatActionButton extends StatelessWidget {
  const _HomeFloatActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const FaIcon(FontAwesomeIcons.plus),
    );
  }
}
