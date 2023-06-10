import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planets_app/Controllers/Theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Theme_Provider theme_providerTrue = Provider.of(context);
    Theme_Provider theme_providerFalse = Provider.of(context, listen: false);

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
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: h * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.025,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: h * 0.04,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: h * 0.036,
                    foregroundImage:
                        AssetImage("assets/images/homepage/sarkar.jpg"),
                  ),
                ),
                SizedBox(
                  width: w * 0.035,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Jaynesh Sarkar",
                        style: TextStyle(
                          fontSize: h * 0.022,
                          letterSpacing: 1,
                          color: (theme_providerTrue.t1.isDark)
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "\njaynesh_sarkar_6060",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: h * 0.015,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w * 0.15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
            SizedBox(
              height: h * 0.03,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xff464646),
                child: Icon(Icons.dark_mode),
              ),
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Switch(
                value: theme_providerTrue.t1.isDark,
                onChanged: (val) {
                  theme_providerFalse.changeTheme();
                },
              ),
            ),
            ListTile(
              title: Text(
                "Profile",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Icon(Icons.people_alt),
              ),
              title: Text(
                "Edit Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.key),
              ),
              title: Text(
                "Change Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text(
                "Notifications",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.notifications),
              ),
              title: Text(
                "Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Switch(
                value: theme_providerTrue.t1.notification,
                onChanged: (val) {
                  theme_providerTrue.changeNotification();
                },
              ),
            ),
            ListTile(
              title: Text(
                "Regional",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.language),
              ),
              title: Text(
                "Language",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.logout),
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "App ver 2.0.1",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
