import 'package:flutter/material.dart';
import 'package:planets_app/Models/Planets_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Favorite_model.dart';

class Favorite_Provider extends ChangeNotifier {
  Favorite_model f1;

  Favorite_Provider({required this.f1});

  addFavoriteValue(Planets data) async {
    data.favorite = !data.favorite;

    f1.favorite = data.favorite;

    if (f1.favorite) {
      f1.favorite = true;

      f1.favoriteName.add(data.name);
      f1.favoriteImage.add(data.image);
      f1.favoriteDescription.add(data.description);

      SharedPreferences Pref = await SharedPreferences.getInstance();

      Pref.setStringList("FavoriteName", f1.favoriteName);
      Pref.setStringList("FavoriteImage", f1.favoriteImage);
      Pref.setStringList("FavoriteDescription", f1.favoriteDescription);
    } else {
      f1.favorite = false;
      f1.favoriteName.remove(data.name);
      f1.favoriteImage.remove(data.image);
      f1.favoriteDescription.remove(data.description);

      SharedPreferences Pref = await SharedPreferences.getInstance();

      Pref.setStringList("FavoriteName", f1.favoriteName);
      Pref.setStringList("FavoriteImage", f1.favoriteImage);
      Pref.setStringList("FavoriteDescription", f1.favoriteDescription);
    }
    notifyListeners();
  }

  removeFavoriteValue(int i) async {
    f1.favoriteName.removeAt(i);
    f1.favoriteImage.removeAt(i);
    f1.favoriteDescription.removeAt(i);

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setStringList("FavoriteName", f1.favoriteName);
    Pref.setStringList("FavoriteImage", f1.favoriteImage);
    Pref.setStringList("FavoriteDescription", f1.favoriteDescription);
    notifyListeners();
  }
}
