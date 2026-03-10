import 'package:flutter/material.dart';

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({super.key});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [

            Image.network(
              "https://plus.unsplash.com/premium_photo-1685118419397-c8ed456734ec?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,

              /// Shows while image loading
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;

                return Container(
                  color: Colors.white12,
                );
              },

              /// If network fails
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.white12,
                  child: const Icon(
                    Icons.sports_soccer,
                    color: Colors.white54,
                    size: 40,
                  ),
                );
              },
            ),

            Positioned(
              left: 20,
              top: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "LIVE NOW",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const Positioned(
              left: 20,
              bottom: 20,
              right: 20,
              child: Text(
                "Premier League:\nManchester Utd vs Liverpool",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}