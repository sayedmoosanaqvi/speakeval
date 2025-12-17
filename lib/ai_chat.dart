import 'package:flutter/material.dart';
import 'ai_help.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String _response = "";
  bool _loading = false;

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    setState(() => _loading = true);

    final result = await AIHelper.getAIResponse(_controller.text);

    setState(() {
      _response = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Assistant"),
      centerTitle: true,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,),
      
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 40,),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Ask me anything...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                 minimumSize: const Size(double.infinity, 50), 
              ),
              child: const Text("Get Response",),
            ),
            const SizedBox(height: 20),
            if (_loading) const CircularProgressIndicator(),
            if (_response.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _response,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
