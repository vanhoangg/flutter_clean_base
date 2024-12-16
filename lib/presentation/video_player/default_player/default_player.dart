import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../presentation.dart';
import '../component/custom_portrait_controls.dart';
import 'player_controller.dart';

class DefaultPlayer extends StatefulWidget {
  const DefaultPlayer({super.key});

  @override
  _DefaultPlayerState createState() => _DefaultPlayerState();
}

class _DefaultPlayerState extends BaseState<DefaultPlayer> {
  @override
  void initState() {
    super.initState();
  }

  ///If you have subtitle assets

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

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(playerController.flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          playerController.flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          playerController.flickManager.flickControlManager?.autoResume();
        }
      },
      child: FlickVideoPlayer(
        flickManager: playerController.flickManager,
        flickVideoWithControls: FlickVideoWithControls(
          closedCaptionTextStyle: const TextStyle(fontSize: 8),
          controls: playerController.size == PlayerSizeState.full
              ? const CustomPortraitControls()
              : null,
        ),
        flickVideoWithControlsFullscreen: const FlickVideoWithControls(
          controls: FlickLandscapeControls(),
        ),
      ),
    );
  }
}
