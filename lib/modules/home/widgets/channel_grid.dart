import 'package:flutter/material.dart';
import '../home_controller.dart';
import 'package:get/get.dart';
import 'channel_card.dart';

class ChannelGrid extends StatelessWidget {
  final bool isLandscape;
  final int? limit;

  const ChannelGrid({
    super.key,
    required this.isLandscape,
    this.limit,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final channelsWithLogo = controller.filteredChannels
          .where((c) => (c["logo"] ?? "").toString().isNotEmpty)
          .toList();

      final channels = limit != null
          ? channelsWithLogo.take(limit!).toList()
          : channelsWithLogo;

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: channels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isLandscape ? 4 : 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (_, index) {
          final channel = channels[index];

          return ChannelCard(
            title: channel["name"] ?? "",
            logo: channel["logo"] ?? "",
            url: channel["url"] ?? "",
          );
        },
      );
    });
  }
}
