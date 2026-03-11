import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/device_utils.dart';
import '../../../services/device_service.dart';
import '../navigation/main_navigation_screen.dart';

class ActivationController extends GetxController {
  final List<TextEditingController> controllers =
      List.generate(7, (_) => TextEditingController());

  final DeviceService _service = DeviceService();

  var loading = false.obs;

  void connectDevice() async {
    String code = controllers.map((e) => e.text).join();

    if (code.length != 7) {
      Get.snackbar("Error", "Enter valid activation code");
      return;
    }

    loading.value = true;

    try {
      final deviceId = await DeviceUtils.getDeviceId();

      await _service.linkDevice(code, deviceId);

      Get.offAll(() => const MainNavigationScreen());
    } catch (e) {
      Get.snackbar(
        "Connection Failed",
        "Invalid activation code",
      );
    }

    loading.value = false;
  }
}
