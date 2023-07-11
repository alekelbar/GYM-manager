enum WeightType { kg, lb }

class RegisterModel {
  final String imageUrl;
  final String name;
  final String weight;
  final WeightType weightType;
  final String reps;
  final String series;
  final String userEmail;

  RegisterModel({
    required this.imageUrl,
    required this.name,
    required this.weight,
    required this.reps,
    required this.series,
    required this.weightType,
    required this.userEmail,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      reps: json['reps'],
      series: json['series'],
      weight: json['weight'],
      weightType: json['weightType'],
      userEmail: json['userEmail'],
    );
  }

  static Map<String, dynamic> toJson(RegisterModel model) {
    return {
      "imageUrl": model.imageUrl,
      'name': model.name,
      'weight': model.weight,
      "reps": model.reps,
      "series": model.series,
      "weightType": model.weightType,
      "userEmail": model.userEmail,
    };
  }
}
