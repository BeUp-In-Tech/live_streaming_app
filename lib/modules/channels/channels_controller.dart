import 'package:get/get.dart';
import '../home/home_controller.dart';

class ChannelsController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  var loadingChannels = true.obs;

  final categories = <String>[].obs;

  var selectedCategory = 0.obs;

  final channels = <Map<String, String>>[].obs;

  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() {
    ever(homeController.channels, (_) {
      _loadChannels();
    });

    if (homeController.channels.isNotEmpty) {
      _loadChannels();
    }
  }

  void _loadChannels() {
    final allChannels = homeController.channels;

    final groups =
        allChannels.map((c) => c["group"] ?? "Other").toSet().toList();

    categories.assignAll(["All Channels", ...groups]);

    channels.assignAll(allChannels);

    loadingChannels.value = false;
  }

  void searchChannels(String query) {
    searchQuery.value = query;

    final baseList = _getCategoryFiltered();

    if (query.isEmpty) {
      channels.assignAll(baseList);
      return;
    }

    final results = baseList.where((channel) {
      final name = channel["name"]?.toLowerCase() ?? "";
      return name.contains(query.toLowerCase());
    }).toList();

    channels.assignAll(results);
  }

  void changeCategory(int index) {
    selectedCategory.value = index;

    final baseList = _getCategoryFiltered();

    channels.assignAll(baseList);
  }

  List<Map<String, String>> _getCategoryFiltered() {
    final category = categories[selectedCategory.value];

    if (category == "All Channels") {
      return homeController.channels;
    }

    return homeController.channels.where((channel) {
      return (channel["group"] ?? "Other") == category;
    }).toList();
  }
}
