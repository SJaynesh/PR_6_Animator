import 'package:planets_app/Componets/FavoritePage.dart';
import 'package:planets_app/Componets/HomePage.dart';
import 'package:planets_app/Componets/NotificationPage.dart';
import 'package:planets_app/Componets/SearchPage.dart';
import 'package:planets_app/Componets/SettingsPage.dart';

String jsonPath = "assets/json/planets.json";
String friendPath = "assets/images/homepage/";

List Friends = [
  {
    "name": "Darshan Sutriya",
    "name2": "darshan_sutriya_20",
    "image": friendPath + "darshan.jpg",
  },
  {
    "name": "Keval Kothiya",
    "name2": "keval_kothiya_10",
    "image": friendPath + "keval.jpg",
  },
  {
    "name": "Romik Sutriya",
    "name2": "romik_sutriya_40",
    "image": friendPath + "romik.jpg",
  },
  {
    "name": "Neel Maniya",
    "name2": "neel_maniya_50",
    "image": friendPath + "neel.jpg",
  },
];

List Pages = [
  NotificationPage(),
  FavoritePage(),
  HomePage(),
  SearchPage(),
  SettingsPage(),
];

bool? isFavorite;
