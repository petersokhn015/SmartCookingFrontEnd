import 'package:app/Models/Preference.dart';
import 'package:app/Models/UserPreference.dart';
import 'package:app/Services/PreferenceService.dart';
import 'package:app/Services/UserServices.dart';
import 'package:app/Utils/Strings.dart';
import 'package:flutter/material.dart';

class PreferenceProvider extends ChangeNotifier {
  PreferenceService preferenceService = PreferenceService();
  UserServices userServices = UserServices();
  Map<String, String> userPreferences = {};

  Map<String, bool> diet = {
    "Vegan": false,
    "Ketogenic": false,
    "Gluten Free": false,
    "Pescetarian": false,
    "Vegetarian": false
  };

  Map<String, bool> intolerance = {
    "Egg": false,
    "Dairy": false,
    "Gluten": false,
    "Peanut": false,
    "Sesame": false
  };

  Map<String, bool> mealtype = {
    "Breakfast": false,
    "Dessert": false,
    "Appetizer": false,
    "Main Course": false,
    "Side Dish": false
  };

  Map<String, bool> cuisinetype = {
    "American": false,
    "African": false,
    "Japanese": false,
    "Mexican": false,
    "Nordic": false
  };

  setUserPreferences(String username) {
    getUserPreferences(username).then(
      (value) {
        fetchPreferences(value);
      },
    );
  }

  Future<List<Preference>> getUserPreferences(String username) async {
    List<Preference> prefs =
        await preferenceService.getUserPreferences(username);
    return prefs;
  }

  UserPreferences() {
    diet.forEach((key, value) {
      if (value == true) {
        userPreferences[userprefs_Diet] = key;
      }
    });

    intolerance.forEach((key, value) {
      if (value == true) {
        userPreferences[userprefs_Intolerance] = key;
      }
    });

    mealtype.forEach((key, value) {
      if (value == true) {
        userPreferences[userprefs_MealType] = key;
      }
    });

    cuisinetype.forEach((key, value) {
      if (value == true) {
        userPreferences[userprefs_CuisineType] = key;
      }
    });
    notifyListeners();
  }

  setDiet(String dietType, bool? dietValue) {
    diet.forEach((key, value) {
      if (key == dietType) {
        diet[key] = dietValue!;
      }
    });
    notifyListeners();
  }

  setIntolerance(String intoleranceType, bool? intoleranceValue) {
    intolerance.forEach((key, value) {
      if (key == intoleranceType) {
        intolerance[key] = intoleranceValue!;
      }
    });
    notifyListeners();
  }

  setMealtype(String mealtypeType, bool? mealtypeValue) {
    mealtype.forEach((key, value) {
      if (key == mealtypeType) {
        mealtype[key] = mealtypeValue!;
      }
    });
    notifyListeners();
  }

  setCuisineType(String cuisinetypeType, bool? cuisinetypeValue) {
    cuisinetype.forEach((key, value) {
      if (key == cuisinetypeType) {
        cuisinetype[key] = cuisinetypeValue!;
      }
    });
    notifyListeners();
  }

  fetchPreferences(List<Preference> Preferences) {
    Preferences.forEach((element) {
      if (element.preferenceName == userprefs_Diet) {
        diet.forEach((key, value) {
          if (key == element.preferenceValue) {
            diet[key] = true;
          } else {
            diet[key] = false;
          }
        });
      } else if (element.preferenceName == userprefs_Intolerance) {
        intolerance.forEach((key, value) {
          if (key == element.preferenceValue) {
            intolerance[key] = true;
          } else {
            intolerance[key] = false;
          }
        });
      } else if (element.preferenceName == userprefs_MealType) {
        mealtype.forEach((key, value) {
          if (key == element.preferenceValue) {
            mealtype[key] = true;
          } else {
            mealtype[key] = false;
          }
        });
      } else {
        cuisinetype.forEach((key, value) {
          if (key == element.preferenceValue) {
            cuisinetype[key] = true;
          } else {
            cuisinetype[key] = false;
          }
        });
      }
    });
    notifyListeners();
  }
}
