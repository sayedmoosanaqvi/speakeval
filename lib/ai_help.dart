import 'dart:convert';
import 'package:http/http.dart' as http;

class AIHelper {
  static const String apiKey = "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"; // paste yours here

  static Future<String> getAIResponse(String prompt) async {
    final url = Uri.parse("https://openrouter.ai/api/v1/chat/completions");

    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a grammar correction assistant."},
            {"role": "user", "content": prompt}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["choices"][0]["message"]["content"];
      } else {
        return "Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      return "Failed to connect: $e";
    }
  }
}
