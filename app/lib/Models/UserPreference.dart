import 'package:app/Models/Preference.dart';

class UserPreference {
    UserPreference({
        required this.id,
        required this.userId,
        required this.preferences,
    });

    int id;
    int userId;
    List<Preference> preferences;

    factory UserPreference.fromJson(Map<String, dynamic> json) => UserPreference(
        id: json["id"],
        userId: json["userId"],
        preferences: List<Preference>.from(json["preferences"].map((x) => Preference.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "preferences": List<dynamic>.from(preferences.map((x) => x.toJson())),
    };
}
