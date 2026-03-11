import 'package:get/get.dart';

class SettingsController extends GetxController {
  var streamQuality = "4K Ultra HD".obs;

  void changeQuality(String quality) {
    streamQuality.value = quality;
  }

  void refreshPlaylist() {
    print("Refreshing playlist...");
  }
}
