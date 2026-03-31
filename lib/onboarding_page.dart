import 'package:flutter/material.dart';
import 'home_page.dart'; // arahkan ke halaman berikutnya

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C0F0D),

      body: Column(
        children: [

          /// ================= GAMBAR ATAS =================
          Expanded(
            flex: 5,
            child: Image.asset(
              "assets/images/onboarding.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// ================= BAGIAN BAWAH =================
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// TITLE
                  const Text(
                    "Time for a coffee break....",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// SUBTITLE
                  const Text(
                    "Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// INDICATOR (3 DOT)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      indicator(false),
                      indicator(false),
                      indicator(true),
                    ],
                  ),

                  const SizedBox(height: 28),

                  /// BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8892E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// INDICATOR WIDGET
  static Widget indicator(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}