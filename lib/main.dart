import 'package:flutter/material.dart';
import 'screens/launch_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBody App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LaunchScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
