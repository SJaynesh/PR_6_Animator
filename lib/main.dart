import 'package:flutter/material.dart';
import 'package:planets_app/Controllers/LocalJsonData_Provider.dart';
import 'package:planets_app/View.Screens/HomePage.dart';
import 'package:planets_app/View.Screens/SecondPage.dart';
import 'package:planets_app/View.Screens/SplachScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LocalJsonData_Provider()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplachScreen(),
          "HomePage": (context) => HomePage(),
          "SecondPage": (context) => SecondPage(),
        },
      ),
    ),
  );
}
