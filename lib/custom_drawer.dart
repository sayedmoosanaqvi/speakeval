import 'package:flutter/material.dart';
import 'package:my_first_app/alerts.dart';
import 'package:my_first_app/contact.dart';
import 'package:my_first_app/feedback.dart';
import 'package:my_first_app/help.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/login.dart';
import 'package:my_first_app/settings.dart';
import 'package:my_first_app/support.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User 1"),
            accountEmail: Text("test@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/download.jpg"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),

            onTap: () {
               Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Support"),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Support()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text("Phone"),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
            
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },),
             ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text("Feedback"),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FeedBack()),
              );
            },),
             ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Help"),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
            },),
            ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),

            onTap: () {
              AppAlert.showAlert(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },),

            
           

        ],
      ),
      
    );
  }
}
