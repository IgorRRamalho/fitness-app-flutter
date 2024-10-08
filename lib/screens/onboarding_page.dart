import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  // O parâmetro 'key' agora é um super parâmetro
  const OnboardingPage({
    super.key, // Aqui é onde você converte o parâmetro 'key' para um super parâmetro
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl), // Carregar imagem
        Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold), // 'const' aqui
        ),
        const SizedBox(height: 16), // 'const' aqui
        Text(
          description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
