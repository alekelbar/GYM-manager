import 'package:gym_controller/infrastructure/models/register_model.dart';

class RegisterEntity {
  final String imageUrl;
  final String name;
  final String weight;
  final WeightType weightType;
  final String reps;
  final String series;
  String? id;

  RegisterEntity({
    required this.imageUrl,
    required this.name,
    required this.weight,
    required this.reps,
    required this.series,
    required this.weightType,
  });

  String getSeries() {
    final toNum = int.parse(series);
    if (toNum != 1) return "$series series";
    return "$series serie";
  }

  String getReps() {
    final toNum = int.parse(reps);
    if (toNum != 1) return "$reps repeticiones";
    return "$reps repetición";
  }
}
