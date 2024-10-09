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
          itemCount: 3,
          itemBuilder: (context, index) {
            return OnboardingPage(
              title: _getTitle(index),
              imageUrl: _getImageUrl(index),
              iconPath: _getIconPath(index),
              onPressed: _nextOrGetStarted,
              currentIndex: _currentPage,
            );
          },
        ),
      ),
    );
  }

  void _nextOrGetStarted() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Start Your Journey Towards A More Active Lifestyle';
      case 1:
        return 'Find Nutrition Tips That Fit Your Lifestyle';
      case 2:
      default:
        return 'A Community For You, Challenge Yourself';
    }
  }

  String _getImageUrl(int index) {
    switch (index) {
      case 0:
        return 'lib/assets/image1.png';
      case 1:
        return 'lib/assets/image2.png';
      case 2:
      default:
        return 'lib/assets/image3.png';
    }
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return 'lib/assets/icon1.svg';
      case 1:
        return 'lib/assets/icon2.svg';
      case 2:
      default:
        return 'lib/assets/icon3.svg';
    }
  }
}
