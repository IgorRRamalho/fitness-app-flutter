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
    _navigateToSplashScreen();
  }

  void _navigateToSplashScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/splash');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo('lib/assets/logofb.svg', 136, 63),
          const SizedBox(height: 20),
          _buildLogo('lib/assets/FITBODY.svg', 170, 30),
        ],
      ),
    );
  }

  Widget _buildLogo(String assetPath, double width, double height) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
    );
  }
}
