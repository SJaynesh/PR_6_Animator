import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planets_app/Controllers/LocalJsonData_Provider.dart';
import 'package:planets_app/Utills/Atributes.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    LoadJsonData();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 5000,
      ),
      lowerBound: 0,
      upperBound: pi * 2,
    );

    animationController.repeat();
  }

  LoadJsonData() async {
    await Provider.of<LocalJsonData_Provider>(context, listen: false)
        .LoadJsonData();
  }

  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    LocalJsonData_Provider localJsonData_ProviderTrue = Provider.of(context);
    LocalJsonData_Provider localJsonData_ProviderFalse =
        Provider.of(context, listen: false);
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      backgroundColor: Color(0xff01203f),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SalomonBottomBar(
          backgroundColor: Color(0xff01203f),
          selectedItemColor: Color(0xff7623dc),
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          unselectedItemColor: Colors.white38,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.notifications_none),
              title: Text("Notifications"),
              selectedColor: Color(0xff116D6E),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.mail_outline),
              title: Text("Messages"),
              selectedColor: Color(0xff116D6E),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.home_filled),
              title: Text("Home"),
              selectedColor: Color(0xff116D6E),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Color(0xff116D6E),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
              selectedColor: Color(0xff116D6E),
            ),
          ],
        ),
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homepage/bgGalaxy.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                            foregroundImage:
                                AssetImage("assets/images/homepage/sarkar.jpg"),
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
                                color: Colors.white,
                                fontSize: h * 0.017,
                                letterSpacing: 1,
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
                          width: w * 0.028,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffc091f6),
                        ),
                        SizedBox(
                          width: w * 0.07,
                        ),
                        Container(
                          height: h * 0.05,
                          width: w * 0.27,
                          decoration: BoxDecoration(
                            color: Color(0xff400d60),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Fly with\nstars ✨",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                    fontSize: h * 0.03,
                                  ),
                                ),
                              ),
                              Container(
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
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: h * 0.02,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Transform.rotate(
                            angle: pi / 8,
                            child: Image.asset(
                              "assets/images/homepage/man.gif",
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
                            color: Colors.white,
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 30),
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         ...Provider.of<LocalJsonData_Provider>(context)
              //             .l1
              //             .PlanetsList
              //             .map(
              //               (e) => Container(
              //                 height: h * 0.3,
              //                 width: w * 0.7,
              //                 margin: EdgeInsets.all(5),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(40),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Colors.white54.withOpacity(0.4),
              //                     ),
              //                     BoxShadow(
              //                       color: Color(0xff353467).withOpacity(0.7),
              //                       spreadRadius: -5.0,
              //                       blurRadius: 20.0,
              //                     ),
              //                   ],
              //                 ),
              //                 child: Column(
              //                   children: [
              //                     Row(
              //                       children: [
              //                         AnimatedBuilder(
              //                           animation: animationController,
              //                           child: Image.asset(e.image,height: 100,),
              //                           builder: (context, widget) =>
              //                               Transform.rotate(
              //                             angle: animationController.value,
              //                                 child: widget,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             )
              //             .toList(),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  height: h * 0.3,
                  width: w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        localJsonData_ProviderFalse.l1.PlanetsList.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("SecondPage",
                            arguments:
                                localJsonData_ProviderFalse.l1.PlanetsList[i]);
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
                                  AnimatedBuilder(
                                    animation: animationController,
                                    child: Image.asset(
                                      localJsonData_ProviderTrue
                                          .l1.PlanetsList[i].image,
                                      height: h * 0.15,
                                    ),
                                    builder: (context, widget) =>
                                        Transform.rotate(
                                      angle: animationController.value,
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
                                              color: Colors.white,
                                              fontSize: h * 0.03,
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
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Container(
                                height: h * 0.1,
                                width: w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white54.withOpacity(0.4),
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
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: h * 0.025,
                                      fontWeight: FontWeight.w500,
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
                      color: Colors.white,
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
                          color: Colors.white,
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
                              color: Colors.white,
                              letterSpacing: 1,
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
      ),
    );
  }
}
