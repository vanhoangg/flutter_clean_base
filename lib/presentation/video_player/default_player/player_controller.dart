import 'package:flick_video_player/flick_video_player.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/mock_data.dart';
import '../mini_player/mini_player.dart';
import 'default_player.dart';

enum PlayerSizeState { minimize, full, off }

class PlayerController extends ChangeNotifier {
  static PlayerController? _instance;

  PlayerSizeState _size;

  late VideoObject videoDetail;
  late FlickManager flickManager;
  set size(PlayerSizeState value) {}

  PlayerSizeState get size => _size;

  PlayerController._internal(
    this._size,
  );

  factory PlayerController() {
    _instance ??= PlayerController._internal(PlayerSizeState.off);

    return _instance!;
  }
  void onOpenVideoPlayer({required VideoObject videoDetail}) {
    this.videoDetail = videoDetail;
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(videoDetail.videoUrl),
      ),
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
    notifyListeners();
  }

  Widget get child {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300), child: _buildPlayer());
  }

  Widget _buildPlayer() {
    switch (_size) {
      case PlayerSizeState.minimize:
        return const MiniPlayer();
      case PlayerSizeState.full:
        return const DefaultPlayer();
      default:
        return const SizedBox();
    }
  }
}
