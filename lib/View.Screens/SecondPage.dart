import 'package:flutter/material.dart';
import 'package:planets_app/Models/Planets_Model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    Planets data = ModalRoute.of(context)!.settings.arguments as Planets;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(""),fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}
