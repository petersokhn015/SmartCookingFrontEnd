class Filter {
  Filter({
    required this.query,
    required this.mealType,
    required this.diet,
    required this.intolerances,
    required this.cuisineTypes,
    required this.maxCookTime,
  });

  final String query;
  final String mealType;
  final String diet;
  final List<String> intolerances;
  final List<String> cuisineTypes;
  final int maxCookTime;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        query: json["query"],
        mealType: json["mealType"],
        diet: json["diet"],
        intolerances: List<String>.from(json["intolerances"].map((x) => x)),
        cuisineTypes: List<String>.from(json["cuisineTypes"].map((x) => x)),
        maxCookTime: json["maxCookTime"],
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "mealType": mealType,
        "diet": diet,
        "intolerances": List<dynamic>.from(intolerances.map((x) => x)),
        "cuisineTypes": List<dynamic>.from(cuisineTypes.map((x) => x)),
        "maxCookTime": maxCookTime,
      };

  Filter filterFromJson(String str) => Filter.fromJson(json.decode(str));

  String filterToJson(Filter data) => json.encode(data.toJson());
}
