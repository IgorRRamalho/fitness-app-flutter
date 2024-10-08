import 'package:flutter/material.dart';
import 'onboarding_page.dart'; // Importar a página do onboarding

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key}); // O mesmo aqui, usando super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          // 'const' na lista
          OnboardingPage(
            title: 'Start Your Journey',
            description: 'A More Active Lifestyle',
            imageUrl: 'assets/image1.png',
          ),
          OnboardingPage(
            title: 'Find Nutrition Tips',
            description: 'That Fit Your Lifestyle',
            imageUrl: 'assets/image2.png',
          ),
          OnboardingPage(
            title: 'A Community for You',
            description: 'Challenge Yourself',
            imageUrl: 'assets/image3.png',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Get Started'), // 'const' aqui
        ),
      ),
    );
  }
}
