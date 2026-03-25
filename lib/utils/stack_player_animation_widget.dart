import 'dart:developer';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../app/functions.dart';
import '../presentation/presentation.dart';
import '../presentation/video_player/component/custom_portrait_controls.dart';
import '../presentation/video_player/default_player/player_controller.dart';

class StackPlayerAnimation extends StatefulWidget {
  const StackPlayerAnimation({required this.parent, super.key});

  final Widget parent;

  @override
  _StackPlayerAnimationState createState() => _StackPlayerAnimationState();
}

class _StackPlayerAnimationState extends BaseState<StackPlayerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _verticalPositionAnimation;
  late Animation<double> _horizontalPositionAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define animations
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.4).animate(_controller);

    playerController.addListener(() {
      switch (playerController.size) {
        case PlayerSizeState.minimize:
          _controller.forward();
          return;
        case PlayerSizeState.full:
          _controller.reverse();
          return;
        default:
          return;
      }
    });
  }

  @override
  void dispose() {
    playerController.removeListener(() => null);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    printMediaQueryProperties(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Calculate player size

    // Default height = 30% of screen height
    // Default width = 100% of screen width

    // Minimized height = 30% of screen height * 0.3
    // Minimized width = 100% of screen width * 0.3

    // Define animations
    // Position of the player when minimized
    // 90% of screen height

    final _isMinimized = playerController.size == PlayerSizeState.minimize;

    return Stack(
      children: [
        widget.parent,
        playerController.size == PlayerSizeState.off
            ? const SizedBox.shrink()
            : AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final heightPlayer =
                      screenHeight * 0.4 * _scaleAnimation.value;
                  final widthPlayer = screenWidth * _scaleAnimation.value;

                  final double positionMinizePlayer = screenHeight -
                      (heightPlayer +
                          kBottomNavigationBarHeight +
                          kRadialReactionRadius);
                  _verticalPositionAnimation =
                      Tween<double>(begin: 0.0, end: positionMinizePlayer)
                          .animate(_controller);
                  _horizontalPositionAnimation = Tween<double>(
                          begin: 0.0,
                          end: screenWidth -
                              (screenWidth * _scaleAnimation.value))
                      .animate(_controller);
                  log('_scaleAnimation.value: ${_scaleAnimation.value}');
                  log('screenWidth: $screenWidth');
                  log('screenWidth scale: ${screenWidth * 0.4}');

                  return Positioned(
                    top: _verticalPositionAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: heightPlayer,
                        width: widthPlayer,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: _isMinimized
                              ? BorderRadius.circular(12.0)
                              : BorderRadius.zero,
                        ),
                        child: VisibilityDetector(
                          key: ObjectKey(playerController.flickManager),
                          onVisibilityChanged: (visibility) {
                            if (visibility.visibleFraction == 0 && mounted) {
                              playerController.flickManager.flickControlManager
                                  ?.autoPause();
                              return;
                            }
                            if (visibility.visibleFraction == 1) {
                              playerController.flickManager.flickControlManager
                                  ?.autoResume();
                              return;
                            }
                          },
                          child: FlickVideoPlayer(
                            flickManager: playerController.flickManager,
                            flickVideoWithControls: FlickVideoWithControls(
                              closedCaptionTextStyle:
                                  const TextStyle(fontSize: 8),
                              controls:
                                  playerController.size == PlayerSizeState.full
                                      ? const CustomPortraitControls()
                                      : null,
                            ),
                            flickVideoWithControlsFullscreen:
                                const FlickVideoWithControls(
                              controls: FlickLandscapeControls(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
