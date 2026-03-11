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
import 'widgets/bottom_nav_bar.dart';

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
              bool isLandscape = constraints.maxWidth > constraints.maxHeight;

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
                              "Sports Channels",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.find<HomeController>().changeNavIndex(1);
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
                        Obx(() => Skeletonizer(
                              enabled: controller.loadingChannels.value,
                              effect: const ShimmerEffect(
                                baseColor: Colors.white12,
                                highlightColor: Colors.white24,
                              ),
                              child: ChannelGrid(
                                isLandscape: isLandscape,
                              ),
                            )),
                      ],
                    ),
                  ),
                  // const Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: BottomNavBar(),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
