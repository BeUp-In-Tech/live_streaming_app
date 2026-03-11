import 'package:flutter/material.dart';
import '../../../core/widgets/glass_container.dart';

class SupportCards extends StatelessWidget {
  final bool isLandscape;

  const SupportCards({
    super.key,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isLandscape ? 4 : 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.3,
      children: const [
        GlassContainer(
          borderRadius: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.help_outline, color: Colors.cyanAccent, size: 32),
              SizedBox(height: 8),
              Text(
                "Help Center",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        GlassContainer(
          borderRadius: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email_outlined, color: Colors.cyanAccent, size: 32),
              SizedBox(height: 8),
              Text(
                "Contact Us",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
