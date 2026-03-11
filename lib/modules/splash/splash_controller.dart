import 'package:get/get.dart';
import '../ activation/activation_screen.dart';
import '../../../services/device_service.dart';
import '../../../core/utils/device_utils.dart';
import '../navigation/main_navigation_screen.dart';

class SplashController extends GetxController {
  var progress = 0.0.obs;

  final DeviceService _service = DeviceService();

  final String deviceCode = "0472302";

  @override
  void onInit() {
    super.onInit();
    _startLoading();
  }

  void _startLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 25));
      progress.value = i / 100;
    }

    try {
      final device = await _service.getDevice(deviceCode);

      if (device["device_status"] == "active") {
        Get.offAll(() => const MainNavigationScreen());
      } else {
        Get.offAll(() => const ActivationScreen());
      }
    } catch (e) {
      Get.offAll(() => const ActivationScreen());
    }
  }
}
