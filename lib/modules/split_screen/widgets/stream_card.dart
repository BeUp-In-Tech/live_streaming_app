import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../core/widgets/glass_container.dart';
import '../../player/player_screen.dart';
import '../split_screen_controller.dart';

class StreamCard extends StatefulWidget {
  final String title;
  final String desc;
  final String image;
  final String url;
  final int index;

  const StreamCard({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    required this.url,
    required this.index,
  });

  @override
  State<StreamCard> createState() => _StreamCardState();
}

class _StreamCardState extends State<StreamCard> {
  late VideoPlayerController controller;
  bool ready = false;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        controller.play();
        controller.setVolume(0);
        setState(() => ready = true);
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splitController = Get.find<SplitScreenController>();

    return GestureDetector(
      onTap: () {
        Get.to(() => PlayerScreen(
              channelName: widget.title,
              streamUrl: widget.url,
            ));
      },
      onLongPress: () {
        Get.dialog(
          AlertDialog(
            backgroundColor: Colors.black87,
            title: const Text("Remove Stream",
                style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  splitController.removeStream(widget.index);
                  Get.back();
                },
                child: const Text("Remove"),
              ),
            ],
          ),
        );
      },
      child: GlassContainer(
        borderRadius: 16,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ready
                  ? VideoPlayer(controller)
                  : Container(
                      color: Colors.black38,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.desc,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
