import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_controller.dart';

class CategoryTabs extends StatelessWidget {
  CategoryTabs({super.key});

  final controller = Get.find<HomeController>();

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
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [

                    Text(
                      controller.categories[index],
                      style: TextStyle(
                        color: selected
                            ? Colors.white
                            : Colors.white60,
                      ),
                    ),

                    const SizedBox(height: 6),

                    if (selected)
                      Container(
                        height: 2,
                        width: 30,
                        color: Colors.blue,
                      )

                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}