
import 'package:flutter/material.dart';

import '../../services/auth/auth_service.dart';

import '../profile/settings.dart';
import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});



  void logout() async{
    //get auth service
    final _authService = AuthService();


    //logout user
    await _authService.logout();



  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home
          MyDrawerTile(text: 'H O M E', icon: Icons.home, onTap: () => Navigator.pop(context), ),
          MyDrawerTile(text: 'S E T T I N G S', icon: Icons.settings, onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));


          }),
          const Spacer(),
          MyDrawerTile(text: 'L O G O U T', icon: Icons.login, onTap: (){
            logout;

          }),
          const SizedBox(height: 25,),

          //settings

          //list_tile
        ],
      ),
    );
  }
}
