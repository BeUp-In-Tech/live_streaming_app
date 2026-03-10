import 'package:get/get.dart';

import '../ activation/activation_screen.dart';

class SplashController extends GetxController {

  var progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _startLoading();
  }

  void _startLoading() async {

    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 40));
      progress.value = i / 100;
    }


    Get.offAll(() => ActivationScreen());
  }

}