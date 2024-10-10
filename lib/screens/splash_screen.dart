import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/main-image.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE2F163),
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
                const SizedBox(height: 10),
                SvgPicture.asset(
                  'lib/assets/logofb.svg',
                  width: 182.37,
                  height: 84.76,
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  'lib/assets/FITBODY.svg',
                  width: 100,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
