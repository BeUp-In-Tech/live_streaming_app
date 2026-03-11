import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/glass_container.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 32,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 80,
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Uzza ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Max",
                  style: TextStyle(
                    color: AppColors.primary400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "PREMIUM STREAMING",
            style: TextStyle(
              letterSpacing: 3,
              fontSize: 12,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}
