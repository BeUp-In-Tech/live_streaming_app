import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';

import '../ activation/activation_screen.dart';
import '../../../services/device_service.dart';

class SettingsController extends GetxController {
  var streamQuality = "Auto".obs;
  var refreshing = false.obs;

  var userEmail = "".obs;
  var deviceId = "".obs;
  var deviceStatus = "".obs;

  final DeviceService _service = DeviceService();
  final GetStorage _box = GetStorage();

  int refreshInterval = 0;
  Timer? refreshTimer;

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
    loadDeviceInfo();
  }

  void copyDeviceId() {
    if (deviceId.value.isEmpty) return;

    Clipboard.setData(ClipboardData(text: deviceId.value));

    Get.snackbar(
      "Copied",
      "Device ID copied to clipboard",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void changeQuality(String quality) {
    streamQuality.value = quality;
  }

  Future<void> loadDeviceInfo() async {
    print("🔥 loadDeviceInfo called");

    final code = _box.read("device_code");
    print("📱 device_code: $code");

    if (code == null) {
      print("❌ No device code found");
      return;
    }

    try {
      final device = await _service.getDevice(code);
      print("📡 API RESPONSE: $device");

      deviceId.value = device["device_id"] ?? "";
      deviceStatus.value = device["device_status"] ?? "";

      userEmail.value = device["site"]?["support_email"] ?? "";

      refreshInterval = device["site"]?["refresh_time"] ?? 0;

      print("✅ Device ID: ${deviceId.value}");
      print("✅ Status: ${deviceStatus.value}");
      print("✅ Email: ${userEmail.value}");

      _startAutoRefresh();
    } catch (e) {
      print("❌ Error: $e");
    }
  }

  Future<void> refreshPlaylist() async {
    if (refreshing.value) return;

    refreshing.value = true;

    try {
      // TODO: Replace with real API call
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {}

    refreshing.value = false;

    Get.snackbar(
      "Playlist Updated",
      "Channels and EPG refreshed",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _startAutoRefresh() {
    refreshTimer?.cancel();

    if (refreshInterval <= 0) return;

    refreshTimer = Timer.periodic(
      Duration(minutes: refreshInterval),
      (_) {
        refreshPlaylist();
      },
    );
  }

  void disconnectDevice() {
    _box.remove("device_code");

    Get.offAll(() => const ActivationScreen());

    Get.snackbar(
      "Disconnected",
      "Device has been unlinked",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    refreshTimer?.cancel();
    super.onClose();
  }
}
