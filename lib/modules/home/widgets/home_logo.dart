import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 32,
        ),
        const SizedBox(width: 10),
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
                  color: AppColors.primary500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
