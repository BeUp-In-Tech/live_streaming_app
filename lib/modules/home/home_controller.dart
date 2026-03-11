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
    "Sports",
    "News",
    "Movies",
    "Kids",
    "Entertainment",
  ].obs;

  var selectedCategory = 0.obs;

  void changeCategory(int index) {
    selectedCategory.value = index;
  }

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

      filteredChannels.assignAll(parsedChannels);

      loadingChannels.value = false;
      loadingHeader.value = false;
    } catch (e) {
      print("Playlist error: $e");
    }
  }

  void searchChannels(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredChannels.assignAll(channels);
      return;
    }

    final results = channels.where((channel) {
      final name = channel["name"]?.toLowerCase() ?? "";
      return name.contains(query.toLowerCase());
    }).toList();

    filteredChannels.assignAll(results);
  }
}
