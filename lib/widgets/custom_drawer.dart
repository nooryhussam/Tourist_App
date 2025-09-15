import 'package:flutter/material.dart';
import 'package:my_governate_app/about/about_screen.dart';
import 'package:my_governate_app/help_and_support/help_and_support.dart';
import 'package:my_governate_app/logout/logout_dialog.dart';
import 'package:my_governate_app/map_screen/map_screen.dart';
import 'package:my_governate_app/widgets/custom_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xff5A91F7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 23, bottom: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 45,
                        child: Image.asset("assets/images/myProfile.png")),

                    const SizedBox(
                      height: 10,
                    ),
                    //data must come from firebase
                    const Text(
                      "Ahmed Ezz",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    const Text(
                      "Damietta",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const MapScreen();
                },
              ));
            },
            child: const CustomListTile(
                title: "Map",
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                )),
          ),
          const Divider(
            color: Color(0xffD4D6DD),
            endIndent: 10,
            indent: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AboutScreen();
                },
              ));
            },
            child: const CustomListTile(
                title: "About",
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                )),
          ),
          const Divider(
            color: Color(0xffD4D6DD),
            endIndent: 10,
            indent: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HelpSupportPage();
                },
              ));
            },
            child: const CustomListTile(
                title: "Help & Support",
                icon: Icon(
                  Icons.question_mark_outlined,
                  color: Colors.white,
                )),
          ),
          const Divider(
            color: Color(0xffD4D6DD),
            endIndent: 10,
            indent: 10,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const LogoutDialog();
                },
              );
            },
            child: const CustomListTile(
                title: "Logout",
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
