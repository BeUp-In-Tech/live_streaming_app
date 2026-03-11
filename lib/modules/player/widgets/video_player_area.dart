import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../player_controller.dart';

class VideoPlayerArea extends StatelessWidget {
  final bool isLandscape;

  const VideoPlayerArea({super.key, required this.isLandscape});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayerController>();

    return GetBuilder<PlayerController>(
      builder: (_) {
        if (!controller.videoController.value.isInitialized) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: controller.videoController.value.aspectRatio,
              child: VideoPlayer(controller.videoController),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.fast_rewind,
                      color: Colors.white, size: 40),
                  onPressed: controller.rewind,
                ),
                const SizedBox(width: 20),
                Obx(() => GestureDetector(
                      onTap: controller.togglePlay,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(
                          controller.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    )),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.fast_forward,
                      color: Colors.white, size: 40),
                  onPressed: controller.forward,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
