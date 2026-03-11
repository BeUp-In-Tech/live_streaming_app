import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_gradients.dart';
import 'player_controller.dart';

import 'widgets/player_header.dart';
import 'widgets/server_selector.dart';
import 'widgets/video_player_area.dart';
import 'widgets/player_controls.dart';

class PlayerScreen extends StatelessWidget {
  final String channelName;
  final String streamUrl;

  const PlayerScreen({
    super.key,
    required this.channelName,
    required this.streamUrl,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(PlayerController(streamUrl));

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;

          if (isLandscape) {
            return Stack(
              children: [
                VideoPlayerArea(
                  isLandscape: true,
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: PlayerControls(),
                ),
              ],
            );
          }

          return Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.background,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  PlayerHeader(channelName: channelName),
                  const SizedBox(height: 10),
                  const ServerSelector(),
                  Expanded(
                    child: VideoPlayerArea(
                      isLandscape: false,
                    ),
                  ),
                  const PlayerControls(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
