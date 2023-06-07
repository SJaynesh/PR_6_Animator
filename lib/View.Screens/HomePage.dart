import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homepage/bgGalaxy.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
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
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: h * 0.01,
                          letterSpacing: 1,
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
                  children: [
                    Text(
                      "Fly with\nstars ✨",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.03
                      ),
                    ),
                    Image.asset("assets/images/homepage/"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
