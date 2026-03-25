import 'package:flick_video_player/flick_video_player.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/mock_data.dart';

enum PlayerSizeState { minimize, full, off }

class PlayerController extends ChangeNotifier {
  static PlayerController? _instance;

  PlayerSizeState _size;

  late FlickManager flickManager;

  PlayerSizeState get size => _size;

  PlayerController._internal(
    this._size,
  );

  factory PlayerController() {
    _instance ??= PlayerController._internal(PlayerSizeState.off);

    return _instance!;
  }
  void onOpenVideoPlayer({required VideoObject videoDetail}) {
    final VideoPlayerController videoPlayerController =
        VideoPlayerController.networkUrl(
      Uri.parse(videoDetail.videoUrl),
    );
    videoPlayerController.setVolume(0);

    flickManager = FlickManager(
      videoPlayerController: videoPlayerController,
    );

    _size = PlayerSizeState.full;
    notifyListeners();
  }

  void onChangeSizeState({PlayerSizeState? state}) {
    if (state != null) {
      _size = state;
    } else {
      _size = _size == PlayerSizeState.minimize
          ? PlayerSizeState.full
          : PlayerSizeState.minimize;
    }
    notifyListeners();
  }

  void onDismissPlayer() {
    _size = PlayerSizeState.off;
    flickManager.dispose();
    notifyListeners();
  }
}
