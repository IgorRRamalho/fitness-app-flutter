import 'package:flutter/material.dart';
import 'screens/launch_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/splash_screen.dart'; // Importa a nova SplashScreen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: LaunchScreen(), // A tela inicial agora será LaunchScreen
      onGenerateRoute: _generateRoute,
    );
  }

  Route? _generateRoute(RouteSettings settings) {
    final routes = <String, Widget>{
      '/splash': const SplashScreen(), // Nova rota para a SplashScreen
      '/onboarding': const OnboardingScreen(),
      '/login': const LoginScreen(),
      '/signup': const SignUpScreen(),
      '/forgotPassword': const ForgotPasswordScreen(),
    };

    Widget? page = routes[settings.name];
    if (page != null) {
      return _createRoute(page);
    }
    return null;
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ));

        final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        );

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: opacityAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}
