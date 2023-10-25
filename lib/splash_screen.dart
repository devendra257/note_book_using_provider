import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Container(
            //   width: 500,
            //   height: 500,
            //   child: Lottie.asset(
            //     "assets/rive/book.riv",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
