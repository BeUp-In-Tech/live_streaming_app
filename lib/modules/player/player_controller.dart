import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class PlayerController extends GetxController {
  final String streamUrl;

  PlayerController(this.streamUrl);

  late VideoPlayerController videoController;

  var isPlaying = false.obs;
  var isMuted = false.obs;
  var captionsEnabled = false.obs;
  var isFullscreen = false.obs;
  var selectedServer = 0.obs;

  var isLoading = true.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("🎬 PlayerController initialized");
    print("📡 Stream URL: $streamUrl");
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    try {
      print("⚙️ Initializing video player...");

      if (streamUrl.isEmpty) {
        print("❌ Stream URL is empty!");
        hasError.value = true;
        isLoading.value = false;
        return;
      }

      final uri = Uri.parse(streamUrl);

      print("🌐 Parsed URI: $uri");

      videoController = VideoPlayerController.networkUrl(
        uri,
        httpHeaders: {
          "User-Agent": "Mozilla/5.0",
        },
      );

      await videoController.initialize();

      videoController.addListener(() {
        if (videoController.value.hasError) {
          print("🚨 Runtime Player Error:");
          print(videoController.value.errorDescription);

          hasError.value = true;
          update();
        }

        if (videoController.value.isBuffering) {
          print("⏳ Buffering...");
        }
      });

      videoController.play();

      isPlaying.value = true;
      isLoading.value = false;

      print("✅ Video initialized successfully");
      print("📺 Duration: ${videoController.value.duration}");

      update();
    } catch (e, stack) {
      print("🚨 PLAYER ERROR OCCURRED");
      print(e);
      print(stack);

      hasError.value = true;
      isLoading.value = false;

      update();
    }
  }

  void togglePlay() {
    if (!videoController.value.isInitialized) {
      print("⚠️ Toggle play ignored: player not initialized");
      return;
    }

    if (videoController.value.isPlaying) {
      print("⏸ Pausing video");
      videoController.pause();
      isPlaying.value = false;
    } else {
      print("▶️ Playing video");
      videoController.play();
      isPlaying.value = true;
    }

    update();
  }

  void rewind() {
    if (!videoController.value.isInitialized) {
      print("⚠️ Rewind ignored: player not initialized");
      return;
    }

    final position = videoController.value.position;

    print("⏪ Rewind from $position");

    videoController.seekTo(
      position - const Duration(seconds: 10),
    );
  }

  void forward() {
    if (!videoController.value.isInitialized) {
      print("⚠️ Forward ignored: player not initialized");
      return;
    }

    final position = videoController.value.position;

    print("⏩ Forward from $position");

    videoController.seekTo(
      position + const Duration(seconds: 10),
    );
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;

    print("🔊 Mute toggled: ${isMuted.value}");

    videoController.setVolume(
      isMuted.value ? 0 : 1,
    );

    update();
  }

  void toggleCaptions() {
    captionsEnabled.value = !captionsEnabled.value;

    print("💬 Captions enabled: ${captionsEnabled.value}");

    update();
  }

  void changeServer(int index) {
    selectedServer.value = index;

    print("🔄 Switching to server index: $index");
  }

  void toggleFullscreen() {
    isFullscreen.value = !isFullscreen.value;

    print("🖥 Fullscreen toggled: ${isFullscreen.value}");

    if (isFullscreen.value) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky,
      );

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
      );

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    update();
  }

  String getVideoQuality() {
    if (!videoController.value.isInitialized) return "LIVE";

    final height = videoController.value.size.height;

    if (height >= 1080) return "1080p";
    if (height >= 720) return "720p";
    if (height >= 480) return "480p";

    return "SD";
  }

  @override
  void onClose() {
    print("🧹 Disposing video player");

    if (videoController.value.isInitialized) {
      videoController.dispose();
      print("🗑 VideoController disposed");
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.onClose();
  }
}
