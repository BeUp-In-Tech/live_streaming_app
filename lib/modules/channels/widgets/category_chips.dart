import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../channels_controller.dart';
import '../../../core/widgets/glass_container.dart';

class CategoryChips extends StatelessWidget {
  CategoryChips({super.key});

  final controller = Get.find<ChannelsController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          controller.categories.length,
              (index) {

            bool selected =
                controller.selectedCategory.value == index;

            return GestureDetector(
              onTap: () =>
              controller.selectedCategory.value = index,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GlassContainer(
                  borderRadius: 30,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 10),
                  child: Text(
                    controller.categories[index],
                    style: TextStyle(
                      color: selected
                          ? Colors.white
                          : Colors.white70,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}