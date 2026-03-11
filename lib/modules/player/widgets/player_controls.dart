import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../player_controller.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayerController>();

    return GetBuilder<PlayerController>(
      builder: (_) {
        if (!controller.videoController.value.isInitialized) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              VideoProgressIndicator(
                controller.videoController,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.white,
                  bufferedColor: Colors.white30,
                  backgroundColor: Colors.white12,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: controller.toggleMute,
                    child: Icon(
                      controller.isMuted.value
                          ? Icons.volume_off
                          : Icons.volume_up,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: controller.toggleCaptions,
                    child: Icon(
                      controller.captionsEnabled.value
                          ? Icons.closed_caption
                          : Icons.closed_caption_off,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: controller.toggleFullscreen,
                    child: Icon(
                      controller.isFullscreen.value
                          ? Icons.fullscreen_exit
                          : Icons.fullscreen,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
