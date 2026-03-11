import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_controller.dart';
import '../../player/player_screen.dart';

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final channelsWithLogo = controller.channels
          .where((c) =>
              (c["logo"] ?? "").toString().trim().isNotEmpty &&
              (c["logo"] ?? "").toString().startsWith("http"))
          .toList();

      final channels = channelsWithLogo.take(5).toList();

      if (channels.isEmpty) {
        return const SizedBox(height: 180);
      }

      return SizedBox(
        height: 180,
        child: PageView.builder(
          itemCount: channels.length,
          controller: PageController(viewportFraction: .95),
          itemBuilder: (_, index) {
            final channel = channels[index];

            final name = channel["name"] ?? "Live Channel";
            final logo = channel["logo"] ?? "";
            final url = channel["url"] ?? "";

            return GestureDetector(
              onTap: () {
                Get.to(() => PlayerScreen(
                      channelName: name,
                      streamUrl: url,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        logo,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _fallbackBanner(),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black87,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      const Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          size: 50,
                          color: Colors.white70,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "LIVE NOW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        right: 20,
                        child: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _fallbackBanner() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F3D4C),
            Color(0xFF071F26),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
