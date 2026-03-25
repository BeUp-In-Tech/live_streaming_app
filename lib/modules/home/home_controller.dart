import 'package:get/get.dart';
import '../../services/playlist_service.dart';
import '../../core/utils/m3u_parser.dart';

class HomeController extends GetxController {
  var selectedNavIndex = 0.obs;

  void changeNavIndex(int index) {
    selectedNavIndex.value = index;
  }

  var loadingHeader = true.obs;
  var loadingChannels = true.obs;

  final categories = [
    "All",
    "Sports",
    "News",
    "Movies",
    "Kids",
  ].obs;

  var selectedCategory = 0.obs;

  final channels = <Map<String, String>>[].obs;
  final filteredChannels = <Map<String, String>>[].obs;

  var searchQuery = "".obs;

  final PlaylistService _playlistService = PlaylistService();

  final String playlistUrl = "https://springtv.me/get/rtaylor4197@gmail.com";

  @override
  void onInit() {
    super.onInit();
    loadHome();
  }

  Future<void> loadHome() async {
    try {
      final playlist = await _playlistService.fetchPlaylist(playlistUrl);

      final parsedChannels = parseM3U(playlist);

      channels.assignAll(parsedChannels);

      applyFilters();

      loadingChannels.value = false;
      loadingHeader.value = false;
    } catch (e) {
      print("Playlist error: $e");
    }
  }

  void applyFilters() {
    List<Map<String, String>> result = List.from(channels);

    final selectedCat = categories[selectedCategory.value];

    if (selectedCat != "All") {
      result = result.where((channel) {
        final group = channel["group"]?.toLowerCase() ?? "";
        return group.contains(selectedCat.toLowerCase());
      }).toList();
    }

    if (searchQuery.value.isNotEmpty) {
      result = result.where((channel) {
        final name = channel["name"]?.toLowerCase() ?? "";
        return name.contains(searchQuery.value.toLowerCase());
      }).toList();
    }

    filteredChannels.assignAll(result);
  }

  void searchChannels(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  void changeCategory(int index) {
    selectedCategory.value = index;
    applyFilters();
  }
}
