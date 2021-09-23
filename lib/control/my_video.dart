import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class MyVideo extends ChangeNotifier {
  late Duration totalDuration;
  late Duration position;
  late String audioState;

  String get state => audioState;

  MyVideo() {
    initVideo();
  }

  late ChewieController chewieController;

  initVideo() {
    chewieController.addListener(() {
      if (chewieController.isPlaying) {
        audioState = "Playing";
      } else {
        audioState = "Stopped";
      }

      if (chewieController.videoPlayerController.value.position ==
          chewieController.videoPlayerController.value.duration) {
        audioState = "End";
      }
      notifyListeners();
    });
  }

  playVideo() {
    chewieController.play();
    notifyListeners();
  }

  pauseVideo() {
    chewieController.pause();
    notifyListeners();
  }

  seekVideo(Duration durationToSeek) {
    chewieController.seekTo(durationToSeek);
    notifyListeners();
  }
}
