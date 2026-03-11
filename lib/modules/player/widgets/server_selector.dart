import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/glass_container.dart';
import '../player_controller.dart';

class ServerSelector extends StatelessWidget {
  const ServerSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayerController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() => Row(
            children: [
              GestureDetector(
                onTap: () => controller.changeServer(0),
                child: GlassContainer(
                  borderRadius: 20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Text(
                    controller.selectedServer.value == 0
                        ? "✓ Server 1"
                        : "Server 1",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => controller.changeServer(1),
                child: GlassContainer(
                  borderRadius: 20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Text(
                    controller.selectedServer.value == 1
                        ? "✓ Server 2"
                        : "Server 2",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
