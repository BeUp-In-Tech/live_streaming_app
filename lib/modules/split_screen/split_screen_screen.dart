import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_gradients.dart';
import '../home/widgets/home_logo.dart';

import 'split_screen_controller.dart';
import 'widgets/stream_card.dart';
import 'widgets/add_stream_card.dart';
import 'widgets/audio_focus_section.dart';

class SplitScreenScreen extends StatelessWidget {
  const SplitScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplitScreenController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isLandscape = constraints.maxWidth > constraints.maxHeight;

              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 110),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeLogo(),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: controller.streams.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isLandscape ? 4 : 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: isLandscape ? 1.1 : .8,
                        ),
                        itemBuilder: (_, index) {
                          if (index == controller.streams.length) {
                            return const AddStreamCard();
                          }

                          final stream = controller.streams[index];

                          return StreamCard(
                            title: stream["title"]!,
                            desc: stream["desc"]!,
                            image: stream["image"]!,
                            isLive: index == 0,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "AUDIO FOCUS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AudioFocusSection(),
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
