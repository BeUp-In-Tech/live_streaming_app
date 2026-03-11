import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_gradients.dart';
import '../home/widgets/home_logo.dart';

import 'settings_controller.dart';
import 'widgets/device_info_card.dart';
import 'widgets/refresh_playlist_card.dart';
import 'widgets/stream_quality_card.dart';
import 'widgets/support_cards.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {

              final isLandscape =
                  constraints.maxWidth > constraints.maxHeight;

              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 110),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const HomeLogo(),

                    const SizedBox(height: 25),

                    const Text(
                      "DEVICE & ACCOUNT",
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 13,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const DeviceInfoCard(),

                    const SizedBox(height: 14),

                    const RefreshPlaylistCard(),

                    const SizedBox(height: 25),

                    const Text(
                      "PLAYBACK & VISUALS",
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 13,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const StreamQualityCard(),

                    const SizedBox(height: 25),

                    const Text(
                      "SUPPORT",
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 13,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Expanded(
                      child: SupportCards(
                        isLandscape: isLandscape,
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
