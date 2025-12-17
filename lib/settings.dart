import 'package:flutter/material.dart';
import 'package:my_first_app/appearence.dart';
import 'package:my_first_app/edit_profile.dart';
import 'package:my_first_app/faqs.dart';
import 'package:my_first_app/notifications.dart';
import 'package:my_first_app/security.dart';
import 'package:my_first_app/toast_message.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'Account',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Security'),
              subtitle: const Text('Update password or manage devices.'),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color.fromARGB(137, 9, 2, 2),
              ),
              onTap: () {
                ToastMessage.showToast("Succesfully", Colors.orange);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Security()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_off_outlined),
              title: const Text('Profile Settings'),
              subtitle: const Text('Edit Your Profile'),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color.fromARGB(137, 9, 2, 2),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
                ToastMessage.showToast("Succesfully", Colors.orange);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                "App Preferences",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Appearence'),
              subtitle: const Text('Change App Theme'),
              trailing: const Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Appearence()),
                );
                ToastMessage.showToast("Succesfully", Colors.orange);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notification_important),
              title: const Text('Notifications'),
              subtitle: const Text('MAnage Notifications'),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color.fromARGB(137, 9, 2, 2),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
                ToastMessage.showToast("Succesfully", Colors.orange);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                "Support and Legal",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('Faqs'),
              subtitle: const Text('Find Answers to Questions'),
              trailing: const Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Faqs()),
                );
                ToastMessage.showToast("Succesfully", Colors.orange);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_sharp),
              title: const Text('About speakEval'),
              subtitle: const Text('view version and legal Information'),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color.fromARGB(137, 9, 2, 2),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/support');
              },
            ),
            const Divider(height: 30, color: Colors.black),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('Logout from AllDevices'),
              trailing: const Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
