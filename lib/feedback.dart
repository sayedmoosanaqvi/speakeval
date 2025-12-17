import 'package:flutter/material.dart';
import 'package:my_first_app/alerts.dart';
import 'package:my_first_app/home.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});
    Future<void> sendEmailToFeedback({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {'subject': subject, 'body': body},
    );

    // Use LaunchMode.externalApplication
    if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
      throw 'Not Found Email Provider';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
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
                    labelText: "Name",
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
                    labelText: "Email",
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
                    labelText: "Enter Your Message",
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
                    sendEmailToFeedback(
                        toEmail: "feedback@speakeval.com",
                        subject: "Feedback",
                        body: "I Rate The Application",
                      );
                    AppAlert.showAlert4(context);
                    
                    
                  },
                  child: const Text(
                    "Send Feedback",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
