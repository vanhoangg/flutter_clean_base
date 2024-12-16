import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/mock_data.dart';
import '../../presentation.dart';
import 'player_controller.dart';

class DefaultPlayer extends StatefulWidget {
  const DefaultPlayer({super.key});

  @override
  _DefaultPlayerState createState() => _DefaultPlayerState();
}

class _DefaultPlayerState extends BaseState<DefaultPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    playerController.addListener(() => _updateChangePlayer);

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(mockData['items'][0]['trailer_url']),
        closedCaptionFile: _loadCaptions(),
      ),
    );
  }

  ///If you have subtitle assets

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/images/bumble_bee_captions.srt');
    await flickManager.flickControlManager!.toggleSubtitle();
    return SubRipCaptionFile(fileContents);
  }

  ///If you have subtitle urls

  // Future<ClosedCaptionFile> _loadCaptions() async {
  //   final url = Uri.parse('SUBTITLE URL LINK');
  //   try {
  //     final data = await http.get(url);
  //     final srtContent = data.body.toString();
  //     print(srtContent);
  //     return SubRipCaptionFile(srtContent);
  //   } catch (e) {
  //     print('Failed to get subtitles for ${e}');
  //     return SubRipCaptionFile('');
  //   }
  //}
  void _updateChangePlayer() {
    setState(() {});
  }

  @override
  void dispose() {
    flickManager.dispose();
    playerController.removeListener(() => _updateChangePlayer);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: playerController.size == PlayerSizeState.minimize ? 400 : 800,
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: const FlickVideoWithControls(
            closedCaptionTextStyle: TextStyle(fontSize: 8),
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
        ),
      ),
    );
  }
}
