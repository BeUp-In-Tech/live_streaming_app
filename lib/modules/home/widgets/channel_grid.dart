import 'package:flutter/material.dart';
import '../home_controller.dart';
import 'package:get/get.dart';
import 'channel_card.dart';

class ChannelGrid extends StatelessWidget {

  final bool isLandscape;

  const ChannelGrid({super.key, required this.isLandscape});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<HomeController>();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.channels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLandscape ? 4 : 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
        itemBuilder: (_, index) {

          final channel = controller.channels[index];

          return ChannelCard(
            title: channel["name"] as String,
            logo: channel["logo"] as String,
          );
        }
    );
  }
}