import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacementNamed('/splash'); // Navega para a nova SplashScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/logofb.svg',
              width: 136,
              height: 63,
            ),
            const SizedBox(height: 20),
            SvgPicture.asset(
              'lib/assets/FITBODY.svg',
              width: 170,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
