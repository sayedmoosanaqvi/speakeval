import 'package:flutter/material.dart';
import 'package:my_first_app/toast_message.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
                    prefixIcon: Icon(Icons.display_settings),
                    labelText: "Enter Display Name",
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
                    prefixIcon: Icon(Icons.details_rounded),
                    labelText: "Bio",
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
                    labelText: "Enter A backup Email",
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
                    ToastMessage.showToast("Added Information", Colors.red);
                  },
                  child: const Text("Submit", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
