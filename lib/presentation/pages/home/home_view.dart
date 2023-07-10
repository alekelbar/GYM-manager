import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_controller/data/register_mock.dart';
import 'package:gym_controller/domain/entities/register_entity.dart';
import 'package:gym_controller/presentation/bloc/auth/auth_bloc.dart';

class HomeView extends StatelessWidget {
  static const String name = "home-view";
  const HomeView({super.key});

  Future<void> signIn(BuildContext context) async {
    context.read<AuthBloc>().add(LoginEvent());
  }

  Future<void> signOut(BuildContext context) async {
    context.read<AuthBloc>().add(LogOutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
            title: state is Autenticated
                ? const Text("GYM Maganer")
                : const Text(""),
            actions: [
              TextButton(
                onPressed: state is Autenticated
                    ? () => signOut(context)
                    : () => signIn(context),
                child: Row(
                  children: [
                    FaIcon(
                      state is Autenticated ? Icons.logout : Icons.login,
                      color: Colors.black87,
                      size: 30,
                    ),
                  ],
                ),
              ),
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
            ],
          ),
          floatingActionButton:
              (state is Autenticated ? const _HomeFloatActionButton() : null),
          body: state is Autenticated
              ? const _AutenticatedHomeView()
              : const Center(
                  child: Text("Bienvenido"),
                ),
        );
      },
    );
  }
}

class _AutenticatedHomeView extends StatelessWidget {
  const _AutenticatedHomeView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: registerEntityMock.length,
      itemBuilder: (context, index) {
        final entity = registerEntityMock[index];
        return Column(
          children: [
            Image.network(
              entity.imageUrl,
              width: size.width * 0.6,
              height: size.height * 0.6,
            ),
            Text(
              '${entity.weight} ${entity.weightType == WeightType.kg ? "kg" : "lb"} ${entity.name}',
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${entity.getSeries()} de ${entity.getReps()}",
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      FaIcon(Icons.edit),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Editar"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      FaIcon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Eliminar",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      },
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
