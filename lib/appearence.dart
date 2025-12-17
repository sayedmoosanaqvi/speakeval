import 'package:flutter/material.dart';
import 'package:my_first_app/alerts.dart';
class Appearence extends StatelessWidget {
  const Appearence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding inside the card
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // CircleAvatar(
                //   radius: 40,
                //   backgroundImage: AssetImage('assets/images/email.png'),
                //   // backgroundColor: Colors.black,
                // ),
                Icon(Icons.mark_email_unread),
                Text("Enable Email Notifciations"),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    AppAlert.showAlert3(context);
                  },
                  child: const Text("Enable", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}