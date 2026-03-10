import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/glass_container.dart';
import '../home_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<HomeController>();

    final icons = [
      Icons.home,
      Icons.tv,
      Icons.splitscreen,
      Icons.settings,
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: GlassContainer(
        borderRadius: 40,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
                (index) {

              final selected =
                  controller.selectedNavIndex.value == index;

              return GestureDetector(
                onTap: () {
                  print("Tapped icon index: $index");
                  controller.changeNavIndex(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(10),
                  decoration: selected
                      ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.08),
                    border: Border.all(
                      color: Colors.white.withOpacity(.25),
                    ),
                  )
                      : null,
                  child: Icon(
                    icons[index],
                    color: selected
                        ? Colors.white
                        : Colors.white70,
                  ),
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}