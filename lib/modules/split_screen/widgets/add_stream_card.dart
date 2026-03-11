import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../split_screen_controller.dart';

class AddStreamCard extends StatelessWidget {
  const AddStreamCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplitScreenController>();

    return GestureDetector(
      onTap: () {
        Get.dialog(
          Dialog(
            backgroundColor: Colors.black87,
            child: SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: controller.availableChannels.length,
                itemBuilder: (_, index) {
                  final channel = controller.availableChannels[index];

                  return ListTile(
                    title: Text(
                      channel["title"] ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      channel["desc"] ?? "",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onTap: () {
                      controller.addStream(channel);
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.blueAccent.withValues(alpha: .6),
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Add Stream",
                style: TextStyle(color: Colors.blueAccent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
