import 'package:flutter/material.dart';

class LiveSectionTitle extends StatelessWidget {
  const LiveSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "LIVE NOW",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontSize: 16,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.red),
          ),
          child: const Text(
            "LIVE",
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }
}
