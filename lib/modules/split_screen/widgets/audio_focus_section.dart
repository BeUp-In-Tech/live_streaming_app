import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/glass_container.dart';
import '../split_screen_controller.dart';

class AudioFocusSection extends StatelessWidget {
  const AudioFocusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplitScreenController>();

    final items = ["Stream 1", "Stream 2", "Stream 3"];

    return Obx(() => Row(
          children: List.generate(items.length, (index) {
            final selected = controller.selectedAudio.value == index;

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => controller.selectAudio(index),
                  child: GlassContainer(
                    borderRadius: 12,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
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
                          items[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
