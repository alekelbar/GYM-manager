import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/infrastructure/models/register_model.dart';
import 'package:gym_app/presentation/helpers/get_image.dart';

class AddRegisterScreen extends StatelessWidget {
  static const name = "add-register-screen";

  const AddRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // weight types arr
    final weightTypes =
        WeightType.values.map((e) => e.toString().split('.').last);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Register"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton.filled(
            onPressed: () {},
            icon: const Icon(
              Icons.plus_one,
            ),
            iconSize: 25,
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton.filled(
            onPressed: () {
              _getImage(context);
            },
            icon: const Icon(
              Icons.image,
            ),
            iconSize: 25,
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            height: constraints.maxHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //  required this.name,
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    icon: FaIcon(FontAwesomeIcons.user),
                  ),
                ),
                //   required this.series,
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Series",
                    icon: FaIcon(FontAwesomeIcons.dumbbell),
                  ),
                ),
                //   required this.reps,
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Reps",
                    icon: FaIcon(FontAwesomeIcons.repeat),
                  ),
                ),
                //   required this.weight,
                Row(
                  children: [
                    const Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Weight",
                          icon: FaIcon(FontAwesomeIcons.weightScale),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: weightTypes.first,
                      onChanged: (value) {},
                      items: weightTypes.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                //   required this.weightType,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getImage(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          showCloseIcon: true,
          content: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => getImage(),
                  child: const Text("Galería"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => getImage(fromCam: true),
                  child: const Text("Camára"),
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 3),
        ),
      );
  }
}
