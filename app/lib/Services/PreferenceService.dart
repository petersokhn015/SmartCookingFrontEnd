import 'package:app/Models/Preference.dart';
import 'package:app/Models/UserPreference.dart';
import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class PreferenceService {
  Dio _dio = Dio();

  Future<List<Preference>> getUserPreferences(String username) async {
    List<Preference> userPreferences = [];
    try {
      Response response =
          await _dio.get(UserEndpoint + "GetPreferenceOfUser/" + username);

      if (response.statusCode == 200) {
        var data = response.data as List;
        userPreferences =
            data.map<Preference>((e) => Preference.fromMap(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return userPreferences;
  }

  Future<bool?> addPreferences(int userId, Map<String, String> test2) async {
    bool? isAdded = false;
    List<Preference> preferences = [];
    try {
      test2.forEach((key, value) {
        preferences
            .add(Preference(preferenceName: key, preferenceValue: value));
      });

      UserPreference userPreference =
          UserPreference(id: 1, userId: userId, preferences: preferences);
      Response response = await _dio.post(PreferencesEndpoint + "Preference",
          data: userPreference.toJson());

      if (response.statusCode == 200) {
        isAdded = true;
      }
    } catch (e) {
      print(e);
    }
    return isAdded;
  }
}
