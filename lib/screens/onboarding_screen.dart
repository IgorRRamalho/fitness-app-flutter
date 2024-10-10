import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _titles = [
    'Start Your Journey Towards A More Active Lifestyle',
    'Find Nutrition Tips That Fit Your Lifestyle',
    'A Community For You, Challenge Yourself',
  ];

  final List<String> _imageUrls = [
    'lib/assets/image1.png',
    'lib/assets/image2.png',
    'lib/assets/image3.png',
  ];

  final List<String> _iconPaths = [
    'lib/assets/icon1.svg',
    'lib/assets/icon2.svg',
    'lib/assets/icon3.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentPage > 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOutCubic,
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _titles.length,
          itemBuilder: (context, index) {
            return OnboardingPage(
              title: _titles[index],
              imageUrl: _imageUrls[index],
              iconPath: _iconPaths[index],
              onPressed: _nextOrGetStarted,
              currentIndex: _currentPage,
            );
          },
        ),
      ),
    );
  }

  void _nextOrGetStarted() {
    if (_currentPage < _titles.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }
}
