import 'package:flutter/material.dart';
import '../../../core/widgets/glass_container.dart';

class AddStreamCard extends StatelessWidget {
  const AddStreamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blueAccent.withValues(alpha: .6),
        ),
      ),
      child: GlassContainer(
        borderRadius: 16,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Add Stream",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
