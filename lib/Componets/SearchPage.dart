import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/Theme_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Theme_Provider theme_providerTrue = Provider.of(context);

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
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
