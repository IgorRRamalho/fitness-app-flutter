import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String iconPath;
  final VoidCallback onPressed;
  final int currentIndex;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.iconPath,
    required this.onPressed,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: RepaintBoundary(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFB3A0FF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: 43,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFFE2F163),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 30 / 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  _buildIndicator(),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.purple,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        height: 27 / 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 5,
          width: 24,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
