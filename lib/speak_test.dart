import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/toast_message.dart';

// NEW: Firestore Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import '../helpers/firestore_service.dart';
import '../models/evaluation_model.dart';

class SpeakEvaluationPage extends StatefulWidget {
  const SpeakEvaluationPage({super.key});

  @override
  State<SpeakEvaluationPage> createState() => _SpeakEvaluationPageState();
}

class _SpeakEvaluationPageState extends State<SpeakEvaluationPage> {
  final _titleController = TextEditingController();
  final _remarksController = TextEditingController();
  final _scoreController = TextEditingController();

  // NEW: Initialize FirestoreService (Removed DBHelper)
  final FirestoreService _firestoreService = FirestoreService();

  void _saveEvaluation() async {
    // Basic validation
    if (_titleController.text.isEmpty) {
      ToastMessage.showToast("Title is required", Colors.redAccent);
      return;
    }

    // 1. Create the Evaluation Model instance
    final evaluation = Evaluation(
      type: 'Speaking',
      title: _titleController.text,
      remarks: _remarksController.text,
      date: DateTime.now(), // Firestore service handles conversion to Timestamp
      score: double.tryParse(_scoreController.text) ?? 0.0,
    );

    try {
      // 2. Insert into Firestore
      final id = await _firestoreService.insertEvaluation(evaluation);

      // 3. Success Handling
      if (id.isNotEmpty) {
        ToastMessage.showToast("Saved to Cloud successfully!", Colors.green);
        // Navigate to the list page to see your data
        Navigator.pushNamed(context, '/evaluation_page');
      }
    } on FirebaseException catch (e) {
      // This will catch the 'permission-denied' error if rules are wrong
      print("❌ Firestore Error: ${e.code} - ${e.message}");
      ToastMessage.showToast("Cloud Save Failed: ${e.code}", Colors.redAccent);
    } catch (e) {
      print("❌ General Error: $e");
      ToastMessage.showToast("An unexpected error occurred", Colors.redAccent);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _remarksController.dispose();
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speaking Evaluation"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _remarksController,
                decoration: const InputDecoration(
                  labelText: "Remarks (optional)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _scoreController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Score",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveEvaluation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Save to Cloud",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}