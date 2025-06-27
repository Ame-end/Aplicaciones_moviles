class UserData {
  String? name;
  String? location;
  String? gender;
  String? age;
  String? ethnicGroup;
  String? education;
  String? maritalStatus;
  String? landOwnership;
  String? workSource;

  UserData({
    this.name,
    this.location,
    this.gender,
    this.age,
    this.ethnicGroup,
    this.education,
    this.maritalStatus,
    this.landOwnership,
    this.workSource,
  });
}

class Question {
  final String text;
  final String category;
  final String? imagePath;
  int? selectedValue; // <-- Agrega este campo mutable

  Question({
    required this.text,
    required this.category,
    this.imagePath,
    this.selectedValue, // <-- Permite inicializar si lo necesitas
  });
}

class SurveyResponse {
  Map<int, int> answers = {};
  String? comments;
}

//Asociar con categorias
class SurveyCategory {
  final String name;
  final List<Question> questions;
  final String? imagePath;

  SurveyCategory({required this.name, required this.questions, this.imagePath});
}

class SurveyData {
  final List<SurveyCategory> categories;
  final Map<String, String> userData;

  SurveyData({required this.categories, required this.userData});
}
