import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

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
          style: const TextStyle(fontSize: 24),
        ),

        const Icon(
          Icons.search,
          color: Colors.white,
        )

      ],
    );
  }
}