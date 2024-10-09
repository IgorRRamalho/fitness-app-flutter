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
    // Redireciona para a tela de onboarding após 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323), // Define o fundo da tela
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo SVG
            SvgPicture.asset(
              'lib/assets/logofb.svg', // Caminho para o arquivo SVG da logo
              width: 136,
              height: 63,
            ),
            const SizedBox(height: 20), // Espaço entre a logo e o nome
            // Nome SVG
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
