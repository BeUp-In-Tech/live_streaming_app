import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/glass_container.dart';
import '../settings_controller.dart';

class SupportCards extends StatelessWidget {
  final bool isLandscape;

  const SupportCards({
    super.key,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isLandscape ? 4 : 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.3,
      children: [
        GestureDetector(
          onTap: () {
            Get.snackbar(
              "Help Center",
              "This feature is currently not available",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black87,
              colorText: Colors.white,
            );
          },
          child: const GlassContainer(
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
        ),
        Obx(() => GlassContainer(
              borderRadius: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email_outlined,
                      color: Colors.cyanAccent, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    controller.userEmail.value.isEmpty
                        ? "Loading..."
                        : controller.userEmail.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
