import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/glass_container.dart';
import '../settings_controller.dart';

class DeviceInfoCard extends StatelessWidget {
  const DeviceInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return GlassContainer(
      borderRadius: 16,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.devices, color: Colors.cyanAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Device Information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: controller.copyDeviceId,
                  child: Text(
                    "Unique ID: ${controller.deviceId}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ),
                const Text(
                  "Status: Active",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: controller.copyDeviceId,
            child: GlassContainer(
              borderRadius: 10,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.copy, size: 14, color: Colors.white70),
                  SizedBox(width: 4),
                  Text(
                    "Copy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
