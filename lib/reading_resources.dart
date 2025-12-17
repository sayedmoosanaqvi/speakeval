import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ReadingResources extends StatelessWidget {
  const ReadingResources({super.key});

   Future<void> openRLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text(" English Reading Exam"),
              subtitle: const Text("Web Based Testing"),
              trailing: const Icon(Icons.play_circle_fill, color: Colors.black),
              onTap: () {
                openRLink("https://www.examenglish.com/TOEFL/toefl_reading.htm");
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text(" Improve English Reading"),
              subtitle: const Text("Learn to Read naturally and confidently"),
              
              trailing: const Icon(Icons.play_circle_fill, color: Colors.black),
              onTap: () {
                openRLink("https://www.britishcouncil.org/english");
              },
            ),
          ),
          
        ],
      ),
    );
  }
}