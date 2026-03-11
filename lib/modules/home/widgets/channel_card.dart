import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/glass_container.dart';
import '../../player/player_screen.dart';

class ChannelCard extends StatelessWidget {
  final String title;
  final String logo;
  final String url;

  const ChannelCard({
    super.key,
    required this.title,
    required this.logo,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final hasLogo = logo.isNotEmpty;

    return GestureDetector(
      onTap: () {
        Get.to(() => PlayerScreen(
              channelName: title,
              streamUrl: url,
            ));
      },
      child: GlassContainer(
        borderRadius: 16,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withValues(alpha: .06),
                        Colors.white.withValues(alpha: .02),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (hasLogo)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.network(
                              logo,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) =>
                                  _thumbnailPlaceholder(),
                            ),
                          ),
                        )
                      else
                        _thumbnailPlaceholder(),
                      const Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          size: 38,
                          color: Colors.white70,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "LIVE",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _thumbnailPlaceholder() {
    return Container(
      alignment: Alignment.center,
      child: const Icon(
        Icons.tv,
        color: Colors.white70,
        size: 36,
      ),
    );
  }
}
