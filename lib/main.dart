import 'package:flutter/material.dart';
import 'package:planets_app/View.Screens/HomePage.dart';
import 'package:planets_app/View.Screens/SplachScreen.dart';

void main() {

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:  {
        "/" : (context) => SplachScreen(),
        "HomePage" : (context) => HomePage(),
      },
    ),
  );
}