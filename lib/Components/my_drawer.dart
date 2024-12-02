import 'package:flutter/material.dart';
import 'package:food_delivery_app/Components/my_drawer_tile.dart';
import 'package:food_delivery_app/Screens/login_screen.dart';
import 'package:food_delivery_app/services/auth_service.dart';

import '../Screens/setting_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout(){
    final _authService = AuthService();
    _authService.logOutAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: <Widget>[
          //Logo icon
          Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Icon(Icons.apple, size:60, color: Theme.of(context).colorScheme.inversePrimary,)),
          Padding(
              padding: EdgeInsets.all(25.0),
              child: Divider(thickness: 0.5, height: 10,color: Theme.of(context).colorScheme.secondary,)),
          //Home tile
          MyDrawerTile(text: "Favourite", icon: Icons.favorite, ontap: (){}),
          //Profile
          MyDrawerTile(text: "Profile", icon: Icons.person, ontap: () {}),
          //Settings
          MyDrawerTile(text: "Settings", icon: Icons.settings, ontap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          }),
          const Spacer(),
          //Logout
          MyDrawerTile(text: "Logout", icon: Icons.login_rounded, ontap: (){
            logout();
          }),
          SizedBox(height: 25,)

        ],
      ),
    );
  }
}
