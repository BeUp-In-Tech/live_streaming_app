// import 'package:get/get.dart';
// import '../ activation/activation_screen.dart';
// import '../../../services/device_service.dart';
// import '../../../core/utils/device_utils.dart';
// import '../navigation/main_navigation_screen.dart';
//
// class SplashController extends GetxController {
//   var progress = 0.0.obs;
//
//   final DeviceService _service = DeviceService();
//
//   final String deviceCode = "0472302";
//
//   @override
//   void onInit() {
//     super.onInit();
//     _startLoading();
//   }
//
//   void _startLoading() async {
//     for (int i = 0; i <= 100; i++) {
//       await Future.delayed(const Duration(milliseconds: 25));
//       progress.value = i / 100;
//     }
//
//     try {
//       final device = await _service.getDevice(deviceCode);
//
//       if (device["device_status"] == "active") {
//         Get.offAll(() => const MainNavigationScreen());
//       } else {
//         Get.offAll(() => const ActivationScreen());
//       }
//     } catch (e) {
//       Get.offAll(() => const ActivationScreen());
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../ activation/activation_screen.dart';
import '../../../services/device_service.dart';
import '../navigation/main_navigation_screen.dart';

class SplashController extends GetxController {
  var progress = 0.0.obs;

  final DeviceService _service = DeviceService();
  final GetStorage _box = GetStorage();

  String? deviceCode;

  @override
  void onInit() {
    super.onInit();
    deviceCode = _box.read("device_code");
    _startLoading();
  }

  void _startLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 25));
      progress.value = i / 100;
    }

    if (deviceCode == null) {
      Get.offAll(() => const ActivationScreen());
      return;
    }

    try {
      final device = await _service.getDevice(deviceCode!);

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
