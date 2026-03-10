import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/theme/app_gradients.dart';
import '../home/widgets/home_search_bar.dart';
import 'channels_controller.dart';
import 'widgets/channels_header.dart';
import 'widgets/category_chips.dart';
import 'widgets/live_section_title.dart';
import 'widgets/channel_list_item.dart';

class ChannelsScreen extends StatelessWidget {
  const ChannelsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ChannelsController());

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

              final channelList = Obx(() => Skeletonizer(
                enabled: controller.loadingChannels.value,
                effect: const ShimmerEffect(
                  baseColor: Colors.white12,
                  highlightColor: Colors.white24,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: isLandscape
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  itemCount: controller.channels.length,
                  itemBuilder: (_, index) {

                    final channel = controller.channels[index];

                    return ChannelListItem(
                      name: channel["name"]!,
                      desc: channel["desc"]!,
                      logo: channel["logo"]!,
                    );
                  },
                ),
              ));

              final content = Column(
                children: [

                  const ChannelsHeader(),

                  const SizedBox(height: 20),

                  const HomeSearchBar(),

                  const SizedBox(height: 20),

                  CategoryChips(),

                  const SizedBox(height: 20),

                  const LiveSectionTitle(),

                  const SizedBox(height: 15),

                  if (isLandscape)
                    channelList
                  else
                    Expanded(child: channelList),

                ],
              );

              return Padding(
                padding: const EdgeInsets.all(20),
                child: isLandscape
                    ? SingleChildScrollView(child: content)
                    : content,
              );
            },
          ),
        ),
      ),
    );
  }
}