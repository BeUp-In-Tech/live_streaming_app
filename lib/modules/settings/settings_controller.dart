import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class SettingsController extends GetxController {
  var streamQuality = "Auto".obs;
  var refreshing = false.obs;

  late String deviceId;

  final qualities = [
    "Auto",
    "4K Ultra HD",
    "1080p Full HD",
    "720p HD",
    "480p SD"
  ];

  @override
  void onInit() {
    super.onInit();
    deviceId = _generateDeviceId();
  }

  String _generateDeviceId() {
    final rand = Random();
    return "UZZU-${rand.nextInt(9000) + 1000}-XM${rand.nextInt(9)}";
  }

  void copyDeviceId() {
    Clipboard.setData(ClipboardData(text: deviceId));
    Get.snackbar(
      "Copied",
      "Device ID copied to clipboard",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void changeQuality(String quality) {
    streamQuality.value = quality;
  }

  Future<void> refreshPlaylist() async {
    refreshing.value = true;

    await Future.delayed(const Duration(seconds: 2));

    refreshing.value = false;

    Get.snackbar(
      "Playlist Updated",
      "Channels and EPG refreshed",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
