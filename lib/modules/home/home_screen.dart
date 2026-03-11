import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/theme/app_gradients.dart';
import 'home_controller.dart';

import 'widgets/home_logo.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/category_tabs.dart';
import 'widgets/featured_banner.dart';
import 'widgets/channel_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth > constraints.maxHeight;

              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Skeletonizer(
                              enabled: controller.loadingHeader.value,
                              effect: const ShimmerEffect(
                                baseColor: Colors.white12,
                                highlightColor: Colors.white24,
                              ),
                              child: const HomeLogo(),
                            )),
                        const SizedBox(height: 20),
                        Obx(() => Skeletonizer(
                              enabled: controller.loadingHeader.value,
                              child: const HomeSearchBar(),
                            )),
                        const SizedBox(height: 20),
                        Obx(() => Skeletonizer(
                              enabled: controller.loadingHeader.value,
                              child: CategoryTabs(),
                            )),
                        const SizedBox(height: 20),
                        Obx(() => Skeletonizer(
                              enabled: controller.loadingHeader.value,
                              child: const FeaturedBanner(),
                            )),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Popular Channels",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeNavIndex(1);
                              },
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Obx(() {
                          final isLoading = controller.loadingChannels.value;

                          return Skeletonizer(
                            enabled: isLoading,
                            effect: const ShimmerEffect(
                              baseColor: Colors.white12,
                              highlightColor: Colors.white24,
                            ),
                            child: SizedBox(
                              height:
                                  isLoading ? (isLandscape ? 350 : 500) : null,
                              child: ChannelGrid(
                                isLandscape: isLandscape,
                                limit: 10,
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
