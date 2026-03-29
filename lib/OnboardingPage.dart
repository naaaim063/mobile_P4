import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(56, 36, 29, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// IMAGE FULL
          Expanded(
            child: Image.asset(
              "assets/welcome.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENT (baru dikasih padding)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: const [
                SizedBox(height: 15),
                Text(
                  "Time for a coffee break....",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          /// DOT
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [dot(true), dot(false), dot(false)],
          ),
          SizedBox(height: 20),

          /// BUTTON
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 25, right: 25),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9F1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
