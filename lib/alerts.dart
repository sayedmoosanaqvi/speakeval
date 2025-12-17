import 'package:flutter/material.dart';
import 'package:my_first_app/feedback.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/login.dart';
import 'package:my_first_app/toast_message.dart';

class AppAlert {
  static Future<void> showAlert(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text("Yes"),
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog only
            },
            child: const Text("No"),
          ),
        ],
      ),
    );
  }

  static Future<void> showAlert2(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Redirect"),
        content: const Text("You are Leaving Application"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            child: const Text("Confirm"),
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog only
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  static Future<void> showAlert3(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Notifications"),
        content: const Text("You are Enabling Email Notifications"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const Home()),
              // );
              ToastMessage.showToast("Success", Colors.red);
            },
            child: const Text("Confirm"),
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog only
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
  static Future<void> showAlert4(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Review Your Feedback"),
        content: const Text("Feedback Submission"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FeedBack()),
              );
              ToastMessage.showToast("Success", Colors.red);
            },
            child: const Text("Submit"),
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog only
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
