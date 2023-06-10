import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planets_app/Controllers/Connectivity_Provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/LocalJsonData_Provider.dart';
import '../Controllers/Theme_provider.dart';
import '../Utills/Atributes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double begin = 0;
  double end = pi * 2;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    LoadJsonData();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 10000,
      ),
      lowerBound: 0,
      upperBound: pi * 2,
    );

    Provider.of<Connectivity_Provider>(context, listen: false)
        .ChackInternetConnectivity();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  LoadJsonData() async {
    await Provider.of<LocalJsonData_Provider>(context, listen: false)
        .LoadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonData_Provider localJsonData_ProviderTrue = Provider.of(context);
    LocalJsonData_Provider localJsonData_ProviderFalse =
        Provider.of(context, listen: false);

    Theme_Provider theme_providerTrue = Provider.of(context);
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return (Provider.of<Connectivity_Provider>(context).c1.status == "Waiting")
        ? Container(
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
            alignment: Alignment.center,
            child: Image.asset("assets/images/homepage/network.png"),
          )
        : Container(
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
                    padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.025,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: h * 0.03,
                              backgroundColor: Color(0xff3f2860),
                              child: CircleAvatar(
                                foregroundImage: AssetImage(
                                    "assets/images/homepage/sarkar.jpg"),
                              ),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Jaynesh Sarkar",
                                  style: TextStyle(
                                    fontSize: h * 0.017,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Text(
                                  "jaynesh_sarkar_6060",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: h * 0.01,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: w * 0.025,
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              color: Color(0xffc091f6),
                            ),
                            SizedBox(
                              width: w * 0.065,
                            ),
                            Container(
                              height: h * 0.05,
                              width: w * 0.27,
                              decoration: BoxDecoration(
                                color: Color(0xff400d60),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "12334",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/homepage/coin.png",
                                    height: h * 0.033,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Container(
                          height: h * 0.25,
                          width: w * 1,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Fly with\nstars ✨",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          letterSpacing: 1,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w500,
                                          fontSize: h * 0.03,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      animationController.forward();
                                    },
                                    onDoubleTap: () {
                                      animationController.reverse();
                                    },
                                    child: Container(
                                      height: h * 0.065,
                                      width: w * 0.25,
                                      decoration: BoxDecoration(
                                        color: Color(0xff3f3278),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 5,
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Fly",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: h * 0.02,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 20, right: 20, bottom: 20),
                                child: AnimatedBuilder(
                                  animation: animationController,
                                  child: Transform.rotate(
                                    angle: pi / 8,
                                    child: Image.asset(
                                      "assets/images/homepage/man.gif",
                                    ),
                                  ),
                                  builder: (context, widget) =>
                                      Transform.rotate(
                                    angle: animationController.value,
                                    child: widget,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        ListTile(
                          title: Text(
                            "Popular stars",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                fontSize: h * 0.02,
                              ),
                            ),
                          ),
                          trailing: Text(
                            "View all",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xffa2b4fd),
                                fontSize: h * 0.012,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: h * 0.3,
                      width: w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            localJsonData_ProviderFalse.l1.PlanetsList.length,
                        itemBuilder: (context, i) => Hero(
                          tag: localJsonData_ProviderFalse
                              .l1.PlanetsList[i].hero,
                          flightShuttleBuilder: (context, _, __, ___, ____) {
                            return Container(
                              height: h,
                              width: w,
                              decoration: BoxDecoration(
                                color: Color(0xff01203f),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/homepage/bgGalaxy.png"),
                                ),
                              ),
                              child: Image.asset(
                                localJsonData_ProviderFalse
                                    .l1.PlanetsList[i].image,
                                height: h * 0.1,
                              ),
                            );
                          },
                          child: Container(
                            height: h * 0.3,
                            width: w * 0.75,
                            margin: EdgeInsets.only(left: 15),
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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TweenAnimationBuilder(
                                        duration: Duration(milliseconds: 5000),
                                        curve: Curves.easeInOut,
                                        tween: Tween<double>(
                                            begin: begin, end: end),
                                        child: Image.asset(
                                          localJsonData_ProviderTrue
                                              .l1.PlanetsList[i].image,
                                          height: h * 0.15,
                                        ),
                                        onEnd: () {},
                                        builder: (context, degree, widget) =>
                                            Transform.rotate(
                                          angle: degree,
                                          child: widget,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: localJsonData_ProviderTrue
                                                  .l1.PlanetsList[i].name,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: h * 0.03,
                                                  color: (theme_providerTrue
                                                          .t1.isDark)
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "\n${localJsonData_ProviderTrue.l1.PlanetsList[i].temperature}",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: Color(0xff9383c7),
                                                  fontSize: h * 0.02,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "\n${localJsonData_ProviderTrue.l1.PlanetsList[i].velocity}",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: Color(0xff7277a1),
                                                  fontSize: h * 0.013,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          "SecondPage",
                                          arguments: localJsonData_ProviderFalse
                                              .l1.PlanetsList[i]);
                                    },
                                    child: Container(
                                      height: h * 0.1,
                                      width: w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white54.withOpacity(0.4),
                                          ),
                                          BoxShadow(
                                              color: Color(0xff6824a4),
                                              spreadRadius: 0.0,
                                              blurRadius: 20.0,
                                              offset: Offset(6, 5)),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Fly with star",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: h * 0.025,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Featured visitors",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: h * 0.02,
                        ),
                      ),
                    ),
                    trailing: Text(
                      "View all",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xffa2b4fd),
                          fontSize: h * 0.012,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  ...List.generate(
                    Friends.length,
                    (i) => Card(
                      color: Color(0xff353467).withOpacity(0.7),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            height: h * 0.055,
                            width: w * 0.14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(Friends[i]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            Friends[i]['name'],
                            style: TextStyle(
                              fontSize: h * 0.017,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            Friends[i]['name2'],
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: h * 0.014,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          trailing: Container(
                            height: h * 0.05,
                            width: w * 0.27,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white70,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white54.withOpacity(0.4),
                                ),
                                BoxShadow(
                                  color: Color(0xff353467).withOpacity(0.7),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Follow",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: h * 0.018,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
