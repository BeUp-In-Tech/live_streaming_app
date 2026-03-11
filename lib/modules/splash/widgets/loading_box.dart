import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/glass_container.dart';
import '../splash_controller.dart';

class LoadingBox extends StatelessWidget {
  const LoadingBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();

    return GlassContainer(
      child: Obx(() {
        final percent = (controller.progress.value * 100).toInt();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Initializing streams...",
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  "$percent%",
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: controller.progress.value,
                minHeight: 6,
                backgroundColor: AppColors.primary400,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
        );
      }),
    );
  }
}
