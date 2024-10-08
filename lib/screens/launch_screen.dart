import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key}); // Usando 'super.key' para converter 'key' em super parâmetro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/onboarding');
          },
          child: const Text('Iniciar Onboarding'), // Usando 'const' aqui
        ),
      ),
    );
  }
}
