import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class PlayerController extends GetxController {
  late VideoPlayerController videoController;

  var isPlaying = false.obs;
  var selectedServer = 0.obs;

  var isMuted = false.obs;
  var captionsEnabled = false.obs;
  var isFullscreen = false.obs;

  @override
  void onInit() {
    super.onInit();

    videoController =
        VideoPlayerController.asset("assets/videos/player_video.mp4")
          ..initialize().then((_) {
            videoController.play();
            isPlaying.value = true;
            update();
          });
  }

  void changeServer(int index) {
    selectedServer.value = index;

    print("Switched to server $index");

    /// Later you can change stream URL here
  }

  void togglePlay() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying.value = false;
    } else {
      videoController.play();
      isPlaying.value = true;
    }

    update();
  }

  void forward() {
    final position = videoController.value.position;

    videoController.seekTo(
      position + const Duration(seconds: 10),
    );
  }

  void rewind() {
    final position = videoController.value.position;

    videoController.seekTo(
      position - const Duration(seconds: 10),
    );
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;

    videoController.setVolume(
      isMuted.value ? 0 : 1,
    );

    update();
  }

  void toggleCaptions() {
    captionsEnabled.value = !captionsEnabled.value;

    print("Captions ${captionsEnabled.value ? "ON" : "OFF"}");

    update();
  }

  void toggleFullscreen() {
    isFullscreen.value = !isFullscreen.value;

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

  @override
  void onClose() {
    videoController.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.onClose();
  }
}
