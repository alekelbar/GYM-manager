import 'package:gym_controller/domain/entities/register_entity.dart';

final List<RegisterEntity> registerEntityMock = [
  RegisterEntity(
    weightType: WeightType.kg,
    imageUrl:
        "https://cdn.shopify.com/s/files/1/0269/5551/3900/files/Chest-Press-Machine_ab8cd29d-5698-4110-a938-098bda19b5fc_600x600.png?v=1621163108",
    name: "Press de Pecho",
    series: "4",
    reps: "12",
    weight: "10",
  ),
  RegisterEntity(
    weightType: WeightType.kg,
    imageUrl:
        "https://aztethic.com/wp-content/uploads/2018/04/03781301-Dumbbell-Rear-Fly_Shoulders-FIX_1080.gif",
    name: "Flys de Hombro",
    series: "4",
    reps: "12",
    weight: "10",
  ),
  RegisterEntity(
    weightType: WeightType.kg,
    imageUrl:
        "https://cdn.shopify.com/s/files/1/0269/5551/3900/files/Bodyweight-Squat_600x600.png?v=1653577860",
    name: "Sentadillas",
    series: "4",
    reps: "12",
    weight: "10",
  ),
];
