import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/glass_container.dart';
import '../settings_controller.dart';

class StreamQualityCard extends StatelessWidget {
  const StreamQualityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: controller.qualities.map((q) {
                return ListTile(
                  title: Text(
                    q,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    controller.changeQuality(q);
                    Get.back();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
      child: GlassContainer(
        borderRadius: 16,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.hd, color: Colors.cyanAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Stream Quality",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Obx(() => Text(
                        "Current: ${controller.streamQuality.value}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      )),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white54)
          ],
        ),
      ),
    );
  }
}
