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
      home: LaunchScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/onboarding':
            return _createRoute(const OnboardingScreen());
          case '/login':
            return _createRoute(const LoginScreen());
          case '/signup':
            return _createRoute(const SignUpScreen());
          case '/forgotPassword':
            return _createRoute(const ForgotPasswordScreen());
          default:
            return null;
        }
      },
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Começa de baixo
        const end = Offset.zero; // Termina na posição original
        const curve = Curves.easeInOut; // Suaviza a animação

        final tween = Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, // Curva suave
          ),
        );

        // Aumentando a duração da animação
        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: opacityAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500), // Aumenta a duração da animação
    );
  }
}
