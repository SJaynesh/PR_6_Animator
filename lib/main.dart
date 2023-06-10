import 'package:flutter/material.dart';
import 'package:planets_app/Controllers/CurrentIndex_provider.dart';
import 'package:planets_app/Controllers/Favorite_provider.dart';
import 'package:planets_app/Controllers/LocalJsonData_Provider.dart';
import 'package:planets_app/Controllers/Theme_provider.dart';
import 'package:planets_app/Models/Favorite_model.dart';
import 'package:planets_app/Models/Theme_model.dart';
import 'package:planets_app/View.Screens/FirstPage.dart';
import 'package:planets_app/View.Screens/SecondPage.dart';
import 'package:planets_app/View.Screens/SplachScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controllers/Connectivity_Provider.dart';
import 'Globals/Global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences Pref = await SharedPreferences.getInstance();
  bool isDark = Pref.getBool("isDark") ?? false;
  bool isNotification = Pref.getBool("isNotification") ?? false;
  List<String> favoriteName = Pref.getStringList("FavoriteName") ?? [];
  List<String> favoriteImage = Pref.getStringList("FavoriteImage") ?? [];
  List<String> favoriteDescription =
      Pref.getStringList("FavoriteDescription") ?? [];
  bool isFavorite = Pref.getBool("isFavorite") ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalJsonData_Provider()),
        ChangeNotifierProvider(
            create: (context) => Theme_Provider(
                t1: Theme_Model(isDark: isDark, notification: isNotification))),
        ChangeNotifierProvider(
            create: (context) => Favorite_Provider(
                f1: Favorite_model(
                    favoriteName: favoriteName,
                    favoriteImage: favoriteImage,
                    favoriteDescription: favoriteDescription,
                    favorite: isFavorite))),
        ChangeNotifierProvider(create: (context) => Connectivity_Provider()),
        ChangeNotifierProvider(create: (context) => CurrentIndex_Provider()),
      ],
      builder: (context, child) => MaterialApp(
        theme: Global.ligth_Theme,
        darkTheme: Global.dark_Theme,
        themeMode: (Provider.of<Theme_Provider>(context).t1.isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplachScreen(),
          "FirstPage": (context) => FirstPage(),
          "SecondPage": (context) => SecondPage(),
        },
      ),
    ),
  );
}
