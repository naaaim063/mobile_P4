import 'package:flutter/material.dart';
import 'package:mockupnew/HomePage.dart';
import 'OnboardingPage.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const OnboardingPage(),
      routes: {
        "/home": (context) => const HomePage()
      },
    );
  }
}
