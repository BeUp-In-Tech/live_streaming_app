import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/glass_container.dart';
import '../../player/player_screen.dart';

class ChannelCard extends StatelessWidget {
  final String title;
  final String logo;

  const ChannelCard({
    super.key,
    required this.title,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PlayerScreen(channelName: title));
      },
      child: GlassContainer(
        borderRadius: 16,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                logo,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
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
}
