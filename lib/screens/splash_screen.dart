import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_button.dart';
import '../widgets/status_bar.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Status Bar
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomStatusBar(),
              ),
              
              // Logo - centered
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left: 35,
                right: 35,
                child: Center(
                  child: Container(
                    width: 359,
                    height: 88,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo3.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              
              // Get Started Button
              Positioned(
                bottom: 48,
                left: 55,
                right: 55,
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetStartedScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}