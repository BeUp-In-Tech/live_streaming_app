import 'package:flutter/material.dart';
import '../../../core/widgets/glass_container.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return GlassContainer(
      borderRadius: 14,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [

          const Icon(Icons.search, color: Colors.white70),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: "Search channels, movies, or sports...",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),

                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

        ],
      ),
    );
  }
}