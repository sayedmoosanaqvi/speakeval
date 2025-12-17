import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  Future<void> sendWhatsApp(String number, String message) async {
    final Uri whatsappUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: number, // e.g., "923030061600"
      queryParameters: {'text': message},
    );

    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      throw 'WhatsApp not found on this device';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                Card(
                  elevation: 2,
                  margin: EdgeInsets.all(12.0),
                  child: ExpansionTile(
                    title: Text("1. How to Get Started"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "To start using SpeakEval, first create an account or log in, then go to the Evaluation section and begin your first speaking test.",
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.all(12.0),
                  child: ExpansionTile(
                    title: Text("2. How to Record Your Voice"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Press the microphone button on the Speak Test screen, speak clearly, and wait until the app stops recording automatically.",
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.all(12.0),
                  child: ExpansionTile(
                    title: Text("3. How to View Your Results"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Once your test is complete, open the Evaluation page to view your score, accuracy, and performance analysis.",
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.all(12.0),
                  child: ExpansionTile(
                    title: Text("4. Troubleshooting Audio Issues"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "If your mic isn’t working, ensure microphone permissions are enabled in your phone settings and restart the app.",
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.all(12.0),
                  child: ExpansionTile(
                    title: Text("5. How to Contact Support"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "For any issues or suggestions, email us at support@speakeval.com. We’ll respond as soon as possible.",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔹 The Help Me button outside the cards
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                await sendWhatsApp("923030061600", "Need Help!");
              },
              icon: const Icon(Icons.chat),
              label: const Text("Help Me"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                // padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
