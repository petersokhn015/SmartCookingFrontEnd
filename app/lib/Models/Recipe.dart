class Recipe {
  late int id;
  late String title;
  late String imageURL;

  Recipe({required this.id, required this.title, required this.imageURL});

  factory Recipe.fromMap(Map<String, dynamic> json) =>
      Recipe(id: json["id"], title: json["name"], imageURL: json["imageURL"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "name": title, "imageURL": imageURL};
}
