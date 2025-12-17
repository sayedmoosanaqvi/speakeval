import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
import 'package:url_launcher/url_launcher.dart';
class LearningResource extends StatelessWidget {
  const LearningResource({super.key});

   Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text(" English Pronunciation Practice"),
              subtitle: const Text("YouTube playlist for daily speaking exercises"),
              trailing: const Icon(Icons.play_circle_fill, color: Colors.black),
              onTap: () {
                openLink("https://youtu.be/HAnw168huqA?si=56G7tE36o_EwbJto");
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text(" Improve English Fluency"),
              subtitle: const Text("Learn to speak naturally and confidently"),
              trailing: const Icon(Icons.play_circle_fill, color: Colors.black),
              onTap: () {
                openLink("https://youtu.be/WVZH_PQUtz8?si=heItMeXmlwLpltGs");
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text(" IELTS Speaking Tips"),
              subtitle: const Text("Master IELTS speaking tasks with confidence"),
              trailing: const Icon(Icons.play_circle_fill, color: Colors.black),
              onTap: () {
                openLink("https://youtu.be/k4715CJ0Ii8?si=BNvccNNiNFcCtAD2");
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text(" Vocabulary and Accent Training"),
              subtitle: const Text("Expand your vocabulary and improve pronunciation"),
              trailing: const Icon(Icons.play_circle_fill, color: Colors.black),
              onTap: () {
                openLink("https://youtu.be/7bEStwqNPqU?si=xgyp_nWkf0CbuCdz");
              },
            ),
          ),
        ],
      ),
    );
  }
}