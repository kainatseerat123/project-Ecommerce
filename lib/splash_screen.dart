import 'dart:async';
import 'package:flutter/material.dart';
import 'Authentication/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [
                    Color(0xFF0D47A1), // Deep Blue
                    Color(0xFF880E4F), // Dark Pink (Wine)
                    Color(0xFF4A148C), // Deep Purple
                  ]
                : [
                    Colors.lightBlueAccent.shade200,
                    const Color(0xFFFFC1CC),
                    const Color(0xFFB39DDB),
                  ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.jpeg',
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
