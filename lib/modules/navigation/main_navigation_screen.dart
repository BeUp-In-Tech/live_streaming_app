import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzza_max/modules/settings/settings_screen.dart';
import 'package:uzza_max/modules/split_screen/split_screen_screen.dart';

import '../home/home_controller.dart';
import '../home/home_screen.dart';
import '../channels/channels_screen.dart';
import '../home/widgets/bottom_nav_bar.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    final pages = [
      const HomeScreen(),
      const ChannelsScreen(),
      const SplitScreenScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() => Stack(
            children: [
              IndexedStack(
                index: controller.selectedNavIndex.value,
                children: pages,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavBar(),
              )
            ],
          )),
    );
  }
}
