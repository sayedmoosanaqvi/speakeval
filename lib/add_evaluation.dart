import 'package:flutter/material.dart';
import 'package:my_first_app/toast_message.dart';

class AddEvaluationPage extends StatefulWidget {
  const AddEvaluationPage({super.key});

  @override
  State<AddEvaluationPage> createState() => _AddEvaluationPageState();
}

class _AddEvaluationPageState extends State<AddEvaluationPage> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Evaluation Type"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Choose your evaluation type:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              initialValue: selectedType,
              hint: const Text("Evaluation Types"),
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(
                  value: "speak",
                  child: Text("Speaking Evaluation"),
                ),
                DropdownMenuItem(value: "text", child: Text("Text Evaluation")),
                DropdownMenuItem(
                  value: "other",
                  child: Text("Other Evaluation"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                if (selectedType == null) {
                  ToastMessage.showToast(
                    "Please select a type first",
                    Colors.redAccent,
                  );
                  return;
                }

                final routes = {
                  "speak": '/speak_test',
                  "text": '/evaluation_page',
                  "other": '/evaluation_page',
                };

                Navigator.pushNamed(context, routes[selectedType]!);
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Continue"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/evaluation_page');
              },
              child: const Text("View Saved Evaluations"),
            ),
          ],
        ),
      ),
    );
  }
}
