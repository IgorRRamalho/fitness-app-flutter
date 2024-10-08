import 'package:flutter/material.dart';
import 'screens/launch_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/setpassword_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const Map<String, Widget> _routes = {
    '/splash': SplashScreen(),
    '/onboarding': OnboardingScreen(),
    '/login': LoginScreen(),
    '/signup': SignUpScreen(),
    '/forgotPassword': ForgotPasswordScreen(),
    '/setPassword': SetPasswordScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBody App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LaunchScreen(),
      onGenerateRoute: _generateRoute,
    );
  }

  Route? _generateRoute(RouteSettings settings) {
    final Widget? page = _routes[settings.name];
    if (page != null) {
      return _createRoute(page);
    }
    return null;
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

        final opacityAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

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
