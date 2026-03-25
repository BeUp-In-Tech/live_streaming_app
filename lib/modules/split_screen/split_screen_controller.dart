import 'package:get/get.dart';
import '../home/home_controller.dart';

class SplitScreenController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  final streams = <Map<String, String>>[].obs;

  var selectedAudio = 0.obs;

  List<Map<String, String>> get availableChannels => homeController.channels;

  void selectAudio(int index) {
    selectedAudio.value = index;
  }

  void addStream(Map<String, String> channel) {
    if (streams.length >= 4) {
      Get.snackbar("Limit reached", "Maximum 4 streams allowed");
      return;
    }

    if (!streams.any((c) => c["url"] == channel["url"])) {
      streams.add(channel);
    }
  }

  void removeStream(int index) {
    streams.removeAt(index);

    if (selectedAudio.value >= streams.length) {
      selectedAudio.value = 0;
    }
  }
}
