import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
// import 'package:my_first_app/utils/launchers_urls.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  static Future<void> openDialer(String number) async {
    final Uri dialeruri = Uri(scheme: 'tel', path: number);

    if (!await launchUrl(dialeruri, mode: LaunchMode.externalApplication)) {
      throw 'Not Found phone Provider';
    }
  }

  Future<void> sendSms(String number, String message) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: number,
      queryParameters: {'body': message},
    );

    if (!await launchUrl(smsUri, mode: LaunchMode.externalApplication)) {
      throw 'Not Found phone Provider';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                openDialer("03030061600");
              },
              child: Text("Call Us"),
            ),
            TextButton(
              onPressed: () {
                sendSms(
                  "03030061600",
                  "Hello , I am a SpeakEval User and I need YOur Help",
                );
              },
              child: Text("Text Us"),
            ),
          ],
        ),
      ),
    );
  }
}
