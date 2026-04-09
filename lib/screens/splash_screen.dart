import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/app_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading and navigate to Home Screen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Logo text centered
          Center(
            child: Text(
              'Foodgo',
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic, // to simulate the logo font
                color: AppColors.white,
                letterSpacing: -1.5,
              ),
            ),
          ),
          
          // Bottom burgers
          Positioned(
            left: -30,
            bottom: -20,
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(
                'assets/splash_burgers.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
