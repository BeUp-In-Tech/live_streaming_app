import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_screen.dart';
import '../navigation/main_navigation_screen.dart';

class ActivationController extends GetxController {
  final List<TextEditingController> controllers =
      List.generate(7, (_) => TextEditingController());

  void connectDevice() {
    String code = controllers.map((e) => e.text).join();

    debugPrint("Activation Code: $code");

    Get.offAll(() => const MainNavigationScreen());
  }
}
