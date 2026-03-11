import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:android_intent_plus/android_intent.dart';

class PlayerHeader extends StatelessWidget {
  final String channelName;

  const PlayerHeader({
    super.key,
    required this.channelName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              backgroundColor: Colors.white12,
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                channelName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "LIVE • 1080P 60FPS",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              if (Platform.isAndroid) {
                const intent = AndroidIntent(
                  action: 'android.settings.CAST_SETTINGS',
                );

                await intent.launch();
              } else {
                Get.snackbar(
                  "Cast",
                  "Cast settings only available on Android",
                  backgroundColor: Colors.black87,
                  colorText: Colors.white,
                );
              }
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white12,
              child: Icon(Icons.cast, color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => showPlayerSettings(context),
            child: const CircleAvatar(
              backgroundColor: Colors.white12,
              child: Icon(Icons.settings, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void showPlayerSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withValues(alpha: .08),
            border: Border.all(
              color: Colors.white.withValues(alpha: .15),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const Text(
                      "Player Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 25),
                    _settingTile(
                      icon: Icons.hd,
                      title: "Quality",
                      value: "1080p",
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _settingTile(
                      icon: Icons.subtitles,
                      title: "Subtitles",
                      value: "Off",
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _settingTile(
                      icon: Icons.speed,
                      title: "Playback Speed",
                      value: "1.0x",
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white.withValues(alpha: .05),
          border: Border.all(
            color: Colors.white.withValues(alpha: .1),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white54,
            )
          ],
        ),
      ),
    );
  }
}
