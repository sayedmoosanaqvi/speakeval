// main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// REMOVE THIS LINE: import 'package:my_first_app/helpers/db_helpers.dart';
import 'package:my_first_app/add_evaluation.dart';
import 'package:my_first_app/evaluation_page.dart';
import 'package:my_first_app/login.dart';
import 'package:my_first_app/speak_test.dart';
import 'package:my_first_app/splash_screen.dart';

void main() async {
  // ✅ Required before Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PlayFairDisplay'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/add_evaluation': (context) => AddEvaluationPage(),
        '/speak_test': (context) => SpeakEvaluationPage(),
        '/evaluation_page': (context) => EvaluationsPage(),
      },
    );
  }
}
