class User {
  User({
    required this.id,
    required this.username,
    required this.password,
  });

  int id;
  String username;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
      };
}
