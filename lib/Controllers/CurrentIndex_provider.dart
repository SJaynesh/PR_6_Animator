import 'package:flutter/material.dart';
import 'package:planets_app/Models/CurrentIndex_model.dart';

class CurrentIndex_Provider extends ChangeNotifier {
  CurrentIndex_model c1 = CurrentIndex_model(current_index: 2);

  changeCurrentIndex(int i) {
    c1.current_index = i;
    notifyListeners();
  }
}
