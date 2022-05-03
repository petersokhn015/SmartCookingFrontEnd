class Preference {
    Preference({
        required this.preferenceName,
        required this.preferenceValue,
    });

    String preferenceName;
    String preferenceValue;

    factory Preference.fromMap(Map<String, dynamic> json) =>
      Preference(preferenceName: json["preferenceName"], preferenceValue: json["preferenceValue"]);

  Map<String, dynamic> toMap() => {"preferenceName": preferenceName, "preferenceValue": preferenceValue};

    factory Preference.fromJson(Map<String, dynamic> json) => Preference(
        preferenceName: json["preferenceName"],
        preferenceValue: json["preferenceValue"],
    );

    Map<String, dynamic> toJson() => {
        "preferenceName": preferenceName,
        "preferenceValue": preferenceValue,
    };
}