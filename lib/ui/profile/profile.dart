import 'package:flutter/material.dart';
import 'package:insura_ease/ui/profile/settings.dart';

import '../widgets/my_drawer.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(), // Adding MyDrawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            Text(
              "John Doe",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "johndoe@example.com",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 20),
            Divider(color: Theme.of(context).colorScheme.secondary),
            ListTile(
              leading: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: const Text("Settings"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: const Text("Logout"),
              onTap: () {
                // Handle logout here
              },
            ),
          ],
        ),
      ),
    );
  }
}
