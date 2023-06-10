import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planets_app/Models/LocalJsonData_Model.dart';
import 'package:planets_app/Models/Planets_Model.dart';
import 'package:planets_app/Utills/Atributes.dart';

class LocalJsonData_Provider extends ChangeNotifier {
  LocalJsonData_Model l1 = LocalJsonData_Model(data: "", PlanetsList: []);

  Future<void> LoadJsonData() async {
    l1.data = await rootBundle.loadString(jsonPath);

    List decondList = jsonDecode(l1.data);

    l1.PlanetsList = decondList.map((e) => Planets.fromJson(e)).toList();
    notifyListeners();
  }
}
