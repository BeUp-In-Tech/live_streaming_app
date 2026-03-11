import 'package:get/get.dart';

class SplitScreenController extends GetxController {
  final availableChannels = [
    {
      "title": "ESPN HD",
      "desc": "NBA: Lakers vs Celtics",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "Sky Sports Main Event",
      "desc": "Premier League",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "TNT Sports 1",
      "desc": "ATP Tour Masters",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "Fox Sports",
      "desc": "MLB Live",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "NBC Sports",
      "desc": "NHL Game",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "CBS Sports",
      "desc": "NFL Sunday",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "DAZN 1",
      "desc": "Boxing Live",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "Eurosport 1",
      "desc": "Tennis ATP",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "Eurosport 2",
      "desc": "Cycling Tour",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "BeIN Sports",
      "desc": "La Liga",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "BeIN Sports 2",
      "desc": "Serie A",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "BT Sport 1",
      "desc": "Champions League",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "BT Sport 2",
      "desc": "Europa League",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "Sky Sports F1",
      "desc": "Formula 1 Live",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "F1 TV",
      "desc": "Grand Prix",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "NFL Network",
      "desc": "NFL Live",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "NBA TV",
      "desc": "NBA Highlights",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "MLB Network",
      "desc": "Baseball Live",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "UFC Fight Pass",
      "desc": "MMA Live",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
    {
      "title": "Red Bull TV",
      "desc": "Extreme Sports",
      "image": "",
      "url": "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
    },
  ];

  final streams = <Map<String, String>>[].obs;

  var selectedAudio = 0.obs;

  void selectAudio(int index) {
    selectedAudio.value = index;
  }

  void addStream(Map<String, String> channel) {
    if (streams.length >= 4) {
      Get.snackbar("Limit reached", "Maximum 4 streams allowed");
      return;
    }

    if (!streams.contains(channel)) {
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
