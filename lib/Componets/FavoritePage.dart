import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/Favorite_provider.dart';
import '../Controllers/Theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 10000,
      ),
      lowerBound: 0,
      upperBound: pi * 2,
    );

    animationController.repeat();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Theme_Provider theme_providerTrue = Provider.of(context);
    Favorite_Provider favorite_providerTrue = Provider.of(context);
    Favorite_Provider favorite_providerFalse =
        Provider.of(context, listen: false);

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: (theme_providerTrue.t1.isDark)
              ? DecorationImage(
                  image: AssetImage("assets/images/homepage/bgGalaxy.png"),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: AssetImage("assets/images/homepage/bgWhite.png"),
                  fit: BoxFit.cover,
                ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Favorite",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.035,
                  ),
                ),
              ),
              ...List.generate(
                favorite_providerTrue.f1.favoriteName.length,
                (i) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        leading: AnimatedBuilder(
                          animation: animationController,
                          child: Image.asset(
                            favorite_providerTrue.f1.favoriteImage[i],
                          ),
                          builder: (context, widget) => Transform.scale(
                            scale: 4.5,
                            child: Transform.rotate(
                              angle: animationController.value,
                              child: widget,
                            ),
                          ),
                        ),
                        title: Text(
                          favorite_providerTrue.f1.favoriteName[i],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: h * 0.035,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          favorite_providerTrue.f1.favoriteDescription[i],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: h * 0.018,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            favorite_providerFalse.removeFavoriteValue(i);
                          },
                          icon: Icon(
                            Icons.delete,
                            size: h * 0.03,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// ListView.builder(
// itemCount: favorite_providerTrue.f1.favoriteName.length,
// itemBuilder: (context, i) => ListTile(
// leading: AnimatedBuilder(
// animation: animationController,
// child: Image.asset(favorite_providerTrue.f1.favoriteImage[i],height: 200,),
// builder: (context, widget) => Transform.rotate(
// angle: animationController.value,
// child: widget,
// ),
// ),
// title: Text(
// favorite_providerTrue.f1.favoriteName[i],
// style: GoogleFonts.poppins(
// textStyle: TextStyle(
// fontSize: h * 0.03,
// fontWeight: FontWeight.bold,
// letterSpacing: 1,
// ),
// ),
// ),
// subtitle: Text(
// favorite_providerTrue.f1.favoriteDescription[i],
// style: GoogleFonts.poppins(
// textStyle: TextStyle(
// fontSize: h * 0.02,
// fontWeight: FontWeight.w500,
// letterSpacing: 1,
// ),
// ),
// ),
// ),
// ),
