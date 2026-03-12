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
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.tv_off,
                  size: 60,
                  color: Colors.white54,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Channel unavailable",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: controller.initializePlayer,
                  child: const Text("Retry"),
                )
              ],
            ),
          );
        }

        if (!controller.videoController.value.isInitialized) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GestureDetector(
          onTap: controller.showPlayerControls,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: controller.videoController.value.aspectRatio,
                child: VideoPlayer(controller.videoController),
              ),
              Obx(() => AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: controller.showControls.value ? 1 : 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.fast_rewind,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: controller.rewind,
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
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
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const Icon(
                            Icons.fast_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: controller.forward,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
