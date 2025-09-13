import 'package:flutter/material.dart';
import 'package:my_governate_app/help_and_support/help_and_support.dart';
import 'package:my_governate_app/map_screen/map_screen.dart';
import 'package:my_governate_app/widgets/custom_list_tile.dart';
import 'package:my_governate_app/services/auth_service.dart';
import 'package:my_governate_app/models/user_model.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final AuthService _authService = AuthService();
  UserModel? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userData = await _authService.getCurrentUserData();
    if (mounted) {
      setState(() {
        _currentUser = userData;
      });
    }
  }

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
                    child: Image.asset("assets/images/myProfile.png"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _currentUser?.name ?? "user",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    _currentUser?.city ?? "city",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          const CustomListTile(
            title: "Profile",
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
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
                  return const MapScreen();
                },
              ));
            },
            child: const CustomListTile(
              title: "Map",
              icon: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            color: Color(0xffD4D6DD),
            endIndent: 10,
            indent: 10,
          ),
          const CustomListTile(
            title: "About",
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
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
              ),
            ),
          ),
          const Divider(
            color: Color(0xffD4D6DD),
            endIndent: 10,
            indent: 10,
          ),
          const CustomListTile(
            title: "Logout",
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
