import 'package:flutter/material.dart';

class CustomStatusBar extends StatelessWidget {
  const CustomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Time
          Container(
            width: 54,
            height: 21,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/left-side.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          // Right side - Battery, WiFi, Signal
          Container(
            width: 67,
            height: 11,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/right-side.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}