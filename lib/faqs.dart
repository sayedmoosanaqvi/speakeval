import 'package:flutter/material.dart';
class Faqs extends StatelessWidget {
  const Faqs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            
            elevation: 2,
            margin: EdgeInsets.all(12.0),
            child:ExpansionTile(title: Text("1. What is SpeakEval"),
            children: [
             Padding(padding: EdgeInsets.all(12.0),
             child: Text("SpeakEval is an AI-powered app that helps you evaluate your spoken English skills accurately and efficiently"),)
            ],
            ),
            
            
            
          ),
           Card(
            
            elevation: 2,
            margin: EdgeInsets.all(12.0),
            child:ExpansionTile(title: Text("2. How can I start SpeakEval"),
            children: [
             Padding(padding: EdgeInsets.all(12.0),
             child: Text("You can start by signing up, logging in, and following the steps on the Home screen to begin evaluation"),)
            ],
            ),
            
            
            
          ),
           Card(
            
            elevation: 2,
            margin: EdgeInsets.all(12.0),
            child:ExpansionTile(title: Text("3. Does my Progress Saved"),
            children: [
             Padding(padding: EdgeInsets.all(12.0),
             child: Text("Yes, your progress and results are automatically saved for future reference"),)
            ],
            ),
            
            
            
          ),
           Card(
            
            elevation: 2,
            margin: EdgeInsets.all(12.0),
            child:ExpansionTile(title: Text("4. Can SpeakEval works Offline"),
            children: [
             Padding(padding: EdgeInsets.all(12.0),
             child: Text("No, SpeakEval requires an internet connection to analyze your voice using AI."),)
            ],
            ),
            
            
            
          ),
           Card(
            
            elevation: 2,
            margin: EdgeInsets.all(12.0),
            child:ExpansionTile(title: Text("How Do I Contact speakEval"),
            children: [
             Padding(padding: EdgeInsets.all(12.0),
             child: Text("For help or queries, please email support@speakeval.com."),)
            ],
            ),
            
            
            
          ),
        ],
      ),
    );
  }
}