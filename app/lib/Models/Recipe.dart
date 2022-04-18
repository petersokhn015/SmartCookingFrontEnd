class Recipe {
  late int id;
  late String name;
  late String imageURL;

  Recipe({required this.id, required this.name, required this.imageURL});

  factory Recipe.fromMap(Map<String, dynamic> json) =>
      Recipe(id: json["id"], name: json["name"], imageURL: json["imageURL"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "name": name, "imageURL": imageURL};
}
