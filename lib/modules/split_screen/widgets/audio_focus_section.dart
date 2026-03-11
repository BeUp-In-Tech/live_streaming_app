import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../split_screen_controller.dart';

class AudioFocusSection extends StatelessWidget {
  const AudioFocusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplitScreenController>();

    return Obx(() {
      final count = controller.streams.length;

      return Row(
        children: List.generate(count, (index) {
          final selected = controller.selectedAudio.value == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => controller.selectAudio(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selected ? Colors.blueAccent : Colors.white12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      selected ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Stream ${index + 1}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
