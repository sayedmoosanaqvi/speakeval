import 'package:flutter/material.dart';
import 'package:my_first_app/alerts.dart';

class Security extends StatelessWidget {
  const Security({super.key});

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
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_sharp),
                    labelText: "Enter CUrrent Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: BorderSide.none
                    ),

                    filled: true,
                    // fillColor: Colors.grey[200],
                  ),
                ),

                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: "New Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: BorderSide.none
                    ),

                    filled: true,
                    // fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: BorderSide.none
                    ),

                    filled: true,
                    // fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Enter Email To Verify",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: BorderSide.none
                    ),

                    filled: true,
                    // fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    AppAlert.showAlert2(context);
                  },
                  child: const Text("Verify", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
