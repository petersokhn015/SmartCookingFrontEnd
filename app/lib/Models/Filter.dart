import 'dart:convert';

class Filter {
  Filter({
    required this.query,
    required this.mealType,
    required this.diet,
    required this.intolerances,
    required this.cuisineTypes,
    required this.maxCookTime,
  });

  late String query;
  late String mealType;
  late String diet;
  late List<String> intolerances;
  late List<String> cuisineTypes;
  late int maxCookTime;

  factory Filter.fromMap(Map<String, dynamic> json) => Filter(
        query: json["query"],
        mealType: json["mealType"],
        diet: json["diet"],
        intolerances: List<String>.from(json["intolerances"].map((x) => x)),
        cuisineTypes: List<String>.from(json["cuisineTypes"].map((x) => x)),
        maxCookTime: json["maxCookTime"],
      );

  Map<String, dynamic> toMap() => {
        "query": query,
        "mealType": mealType,
        "diet": diet,
        "intolerances": List<dynamic>.from(intolerances.map((x) => x)),
        "cuisineTypes": List<dynamic>.from(cuisineTypes.map((x) => x)),
        "maxCookTime": maxCookTime,
      };

  Filter filterFromJson(String str) => Filter.fromMap(json.decode(str));

  String filterToJson(Filter data) => json.encode(data.toMap());
}
