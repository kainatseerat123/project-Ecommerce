import 'package:flutter/material.dart';
import '../Animation/fade_animation.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset link has been sent to $email")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: isDark
                ? const [
              Color(0xFF0D47A1), // Deep Blue
              Color(0xFF880E4F), // Dark Pink/Wine
              Color(0xFF4A148C), // Deep Purple
            ]
                : [
              Colors.lightBlueAccent.shade200,
              const Color(0xFFFFC1CC), // light pink
              const Color(0xFFB39DDB), // light purple
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 200),
              Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black.withOpacity(0.7)
                      : const Color(0xCCFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        FadeAnimation(
                          1,
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        FadeAnimation(
                          1.1,
                          Text(
                            "Enter Your Email to Reset Password",
                            style: TextStyle(
                              color:
                              isDark ? Colors.white70 : Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Email Input Box
                        FadeAnimation(
                          1.2,
                          Container(
                            decoration: BoxDecoration(
                              color: isDark ? Colors.grey[850] : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                if (!isDark)
                                  const BoxShadow(
                                    color: Color.fromRGBO(225, 245, 254, 1.0),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color:
                                      isDark ? Colors.white : Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: isDark
                                              ? Colors.white70
                                              : Colors.grey),
                                      prefixIcon: Icon(Icons.mail,
                                          color: isDark
                                              ? Colors.white70
                                              : Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your email";
                                      }
                                      if (!value.contains("@")) {
                                        return "Enter a valid email";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 50),

                        //  Reset Password Button
                        FadeAnimation(
                          1.3,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _resetPassword,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDark
                                    ? Colors.deepPurple
                                    : Colors.lightBlueAccent.shade200,
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Text(
                                "Reset Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 240),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
