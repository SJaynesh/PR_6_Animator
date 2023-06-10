import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planets_app/Controllers/Favorite_provider.dart';
import 'package:planets_app/Models/Planets_Model.dart';
import 'package:provider/provider.dart';

import '../Controllers/Theme_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
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
  void dispose() {
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    Planets data = ModalRoute.of(context)!.settings.arguments as Planets;
    Theme_Provider theme_providerTrue = Provider.of(context);
   Favorite_Provider favorite_providerFalse =
        Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: data.hero,
          child: Container(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: h,
                          width: w,
                        ),
                        AnimatedBuilder(
                          animation: animationController,
                          child: Image.asset(data.image),
                          builder: (context, widget) => Transform.rotate(
                            angle: animationController.value,
                            child: widget,
                          ),
                        ),
                        Positioned(
                          top: 200,
                          child: Container(
                            height: h * 0.9,
                            width: w * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white54.withOpacity(0.4),
                                ),
                                BoxShadow(
                                  color: Color(0xff353467).withOpacity(0.7),
                                  spreadRadius: -5.0,
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: data.name,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: h * 0.055,
                                                  letterSpacing: 1,
                                                  color: (theme_providerTrue
                                                          .t1.isDark)
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text: "\nSolar System",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: h * 0.03,
                                                  letterSpacing: 1,
                                                  color: (theme_providerTrue
                                                          .t1.isDark)
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          favorite_providerFalse
                                              .addFavoriteValue(data);
                                        },
                                        icon: (data.favorite)
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : Icon(
                                                Icons.favorite_border,
                                              ),
                                      ),
                                      Text(
                                        data.temperature,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Color(0xffe4714d),
                                            fontSize: h * 0.023,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120),
                                    child: Divider(
                                      color: Colors.grey.withOpacity(0.5),
                                      thickness: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 150),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: h * 0.04,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Description",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: h * 0.025,
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.03,
                                          ),
                                          Text(
                                            data.description,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: h * 0.02,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: h * 0.035,
                                          ),
                                          Divider(
                                            color: Colors.grey.withOpacity(0.5),
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Details",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: h * 0.025,
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Surface Area :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  ${data.surfaceArea}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.018,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "Distance from the Sun :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.0215,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  ${data.distance}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.015,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Diameter :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  ${data.diameter}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.018,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Gravity :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "  ${data.gravity}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.018,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Velocity :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  ${data.velocity}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.018,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Leanth Of Year :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  ${data.leanthOfYear}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.018,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Leanth Of Day :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  ${data.leanthOfDay}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.018,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Number Of Moons :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffFFD700),
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  ${data.numberOfMoons}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xffe4714d),
                                                          fontSize: h * 0.018,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Divider(
                                            color: Colors.grey.withOpacity(0.5),
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: h * 0.025,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Gallery",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: h * 0.025,
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Container(
                                            height: h * 0.4,
                                            width: w,
                                            child: GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 15,
                                                      mainAxisSpacing: 20),
                                              itemCount: data.images.length,
                                              itemBuilder: (context, i) =>
                                                  Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        data.images[i]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: h * 0.2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
