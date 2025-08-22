import 'package:flutter/material.dart';
import '../Animation/fade_animation.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true; // for show/hide password

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: isDark
              ? const LinearGradient(
                  // Dark gradient
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0D47A1), // Deep Blue
                    Color(0xFF880E4F), // Dark Pink (Wine)
                    Color(0xFF4A148C), // Deep Purple
                  ],
                )
              : LinearGradient(
                  // Light gradient
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.lightBlueAccent.shade200,
                    const Color(0xFFFFC1CC), // light pink
                    const Color(0xFFB39DDB), // light purple
                  ],
                ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 200),
              Container(
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        0.5,
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: theme.textTheme.bodyLarge!.color,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      FadeAnimation(
                        0.6,
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: isDark
                                    ? Colors.black26
                                    : const Color.fromRGBO(225, 245, 254, 1.0),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              _buildTextField(
                                hint: "Email",
                                icon: Icons.mail,
                                isPassword: false,
                                theme: theme,
                              ),
                              _buildTextField(
                                hint: "Password",
                                icon: Icons.lock,
                                isPassword: true,
                                theme: theme,
                              ),
                              _buildTextField(
                                hint: "Confirm Password",
                                icon: Icons.lock,
                                isPassword: true,
                                theme: theme,
                              ),
                              _buildTextField(
                                hint: "Phone Number",
                                icon: Icons.phone,
                                isPassword: false,
                                theme: theme,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      FadeAnimation(
                        0.7,
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: theme.colorScheme.primary,
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      FadeAnimation(
                        0.8,
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: theme.textTheme.bodyMedium!.color
                                        ?.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required bool isPassword,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
      ),
      child: TextField(
        obscureText: isPassword ? _obscureText : false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: theme.iconTheme.color),
          hintText: hint,
          hintStyle: TextStyle(color: theme.hintColor),
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: theme.iconTheme.color,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
