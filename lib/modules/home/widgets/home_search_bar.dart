import 'package:flutter/material.dart';
import '../../../core/widgets/glass_container.dart';

class HomeSearchBar extends StatelessWidget {
  final Function(String)? onChanged;

  const HomeSearchBar({
    super.key,
    this.onChanged,
  });

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
              onChanged: onChanged,
              style: const TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: "Search channels...",
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
