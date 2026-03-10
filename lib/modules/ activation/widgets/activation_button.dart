import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ActivationButton extends StatelessWidget {

  final VoidCallback onTap;

  const ActivationButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onTap,
        child: const Text(
          "Connect Device",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}