import 'package:flutter/material.dart';

// Screens import here
import 'package:project_ecommerce/splash_screen.dart';
import 'package:project_ecommerce/Authentication/login_screen.dart';
import 'package:project_ecommerce/Authentication/signup_screen.dart';
import 'package:project_ecommerce/Authentication/forgot_password_screen.dart';
import 'package:project_ecommerce/home_screen.dart';
// import '../screens/cart/cart_screen.dart';
// import '../screens/profile/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  // static const String cart = '/cart';
  // static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    home: (context) => const HomeScreen(),
    // cart: (context) => const CartScreen(),
    // profile: (context) => const ProfileScreen(),
  };
}
