import 'package:gym_controller/domain/entities/register_entity.dart';
import 'package:gym_controller/infrastructure/models/register_model.dart';

class RegisterMapper {
  static RegisterEntity toRegisterEntity(RegisterModel model) {
    return RegisterEntity(
      imageUrl: model.imageUrl,
      name: model.name,
      reps: model.reps,
      series: model.series,
      weight: model.weight,
      weightType: model.weightType,
    );
  }

  static RegisterModel toRegisterModel(RegisterEntity entity) {
    return RegisterModel(
      imageUrl: entity.imageUrl,
      name: entity.name,
      reps: entity.reps,
      series: entity.series,
      weight: entity.weight,
      weightType: entity.weightType,
      userEmail: "",
    );
  }
}
