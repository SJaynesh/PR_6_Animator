import 'package:flutter/material.dart';
import 'package:planets_app/Models/Theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Theme_Provider extends ChangeNotifier {
  Theme_Model t1;

  Theme_Provider({required this.t1});

  changeTheme() async {
    t1.isDark = !t1.isDark;

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setBool("isDark", t1.isDark);

    notifyListeners();
  }

  changeNotification() async {
    t1.notification = !t1.notification;
    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setBool("isNotification", t1.notification);

    notifyListeners();
  }
}
