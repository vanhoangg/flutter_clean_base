import 'package:flutter/material.dart';

import '../../presentation.dart';
import '../default_player/default_player.dart';
import 'package:shared/shared.dart';

import '../default_player/player_controller.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends BaseState<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        print('onPanUpdate dx: ${details.delta.dx}');
        if (details.delta.dx > 0) {
          playerController.onChangeSizeState(state: PlayerSizeState.full);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        color: Colors.white,
        height: 100,
        child: Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DefaultPlayer(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playerController.videoDetail.title,
                    style: getSemiBoldStyle(color: ColorManager.black),
                  ),
                  Text(
                    playerController.videoDetail.artist,
                    style: getRegularStyle(color: ColorManager.black),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                playerController.onDismissPlayer();
                // Close mini player
              },
              child: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
