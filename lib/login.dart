import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_first_app/forget_password.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/toast_message.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        ToastMessage.showToast("Login Successful", Colors.green);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ToastMessage.showToast("No user found for that email.", Colors.red);
        } else if (e.code == 'wrong-password') {
          ToastMessage.showToast("Incorrect password.", Colors.red);
        } else {
          ToastMessage.showToast("Error: ${e.message}", Colors.red);
        }
      } catch (e) {
        ToastMessage.showToast("Unexpected error: $e", Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter Your Credentials",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        actions: [
          // Test button in AppBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: "Skip to Home (Testing Only)",
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: const Text(
                    "Test",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter email";
                    }
                    if (!value.contains("@")) {
                      return "Enter correct email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Password";
                    }
                    if (value.length < 6) {
                      return "Password must be at least six characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: _loginUser,
                  child: const Text(
                    "Click to Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const forgetPassword(),
                          ),
                        );
                      },
                      child: const Text("Reset"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
