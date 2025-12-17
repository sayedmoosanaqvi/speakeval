import 'package:flutter/material.dart';
import 'package:my_first_app/add_evaluation.dart';
import 'package:my_first_app/ai_chat.dart';
// import 'package:my_first_app/ai_help.dart';
// import 'package:my_first_app/alerts.dart';
import 'package:my_first_app/custom_drawer.dart';
import 'package:my_first_app/evaluation_page.dart';
import 'package:my_first_app/favourites.dart';
import 'package:my_first_app/intro_slider.dart';
import 'package:my_first_app/learning_resource.dart';
import 'package:my_first_app/reading_resources.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SpeakEval"),
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
         IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesPage()),
    );
  },
  icon: const Icon(Icons.favorite, color: Colors.redAccent),
),
        ],
      ),
      drawer: CustomDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Card(
              color: Colors.grey[200],
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading:
                    const Icon(Icons.school, color: Colors.black, size: 32),
                title: const Text(
                  "Learning Resources",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Access speaking tips and TOEFL practice materials",
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LearningResource()),
                  );
                },
              ),
            ),
            Card(
              color: Colors.grey[200],
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading:
                    const Icon(Icons.school, color: Colors.black, size: 32),
                title: const Text(
                  "Reading Resources",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Access speaking tips and TOEFL practice materials",
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReadingResources()),
                  );
                },
              ),
            ),
            
            Card(
              color: Colors.grey[200],
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading:
                    const Icon(Icons.saved_search, color: Colors.black, size: 32),
                title: const Text(
                  "View Saved Evaluations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Access Saved Progress"),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EvaluationsPage()),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            const SimpleIntroSlider(),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // ✅ Two floating buttons using a Stack
      floatingActionButton: Stack(
        children: [
          // Add Evaluation button (your existing one)
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: "addEval",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AddEvaluationPage()),
                );
              },
              backgroundColor: Colors.black,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),

          // ✅ New AI Assistant button (just above)
          Positioned(
            bottom: 80,
            right: 0,
            child: FloatingActionButton(
              heroTag: "aiButton",
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AIChatScreen()),
                );
              },
              tooltip: "AI Grammar Assistant",
              child: Icon(Icons.smart_toy_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
