import 'package:flutter/material.dart';
import 'Config/app_route.dart';
import 'Config/app_theme.dart';
import 'splash_screen.dart'; //

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,

      // 👇 System-based Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // 👇 Routing Setup
      initialRoute: AppRoutes.splash,
      routes: {
        ...AppRoutes.routes,
        // fallback: agar AppRoutes me splash define na ho to
        '/': (context) => const SplashScreen(),
      },
    );
  }
}
