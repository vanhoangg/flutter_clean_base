import 'package:flutter/material.dart';

class YouTubePlayerAnimation extends StatefulWidget {
  const YouTubePlayerAnimation({required this.child, super.key});
  final Widget child;

  @override
  _YouTubePlayerAnimationState createState() => _YouTubePlayerAnimationState();
}

class _YouTubePlayerAnimationState extends State<YouTubePlayerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _verticalPositionAnimation;
  late Animation<double> _horizontalPositionAnimation;

  late Animation<double> _opacityAnimation;

  bool _isMinimized = false;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define animations
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.3).animate(_controller);

    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void togglePlayer() {
    if (_isMinimized) {
      _controller.reverse(); // Open the player
    } else {
      _controller.forward(); // Minimize the player
    }
    _isMinimized = !_isMinimized;
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Calculate player size

    // Default height = 30% of screen height
    // Default width = 100% of screen width

    // Minimized height = 30% of screen height * 0.3
    // Minimized width = 100% of screen width * 0.3
    final heightPlayer = screenHeight * 0.3 * _scaleAnimation.value;
    final widthPlayer = screenWidth * _scaleAnimation.value;

    // Define animations
    // Position of the player when minimized
    // 90% of screen height
    final double positionMinizePlayer =
        screenHeight * 0.9 - kBottomNavigationBarHeight;
    _verticalPositionAnimation =
        Tween<double>(begin: 0.0, end: positionMinizePlayer)
            .animate(_controller);
    _horizontalPositionAnimation =
        Tween<double>(begin: 0.0, end: screenWidth / 3).animate(_controller);

    print('screenWidth: $screenWidth');
    print('screenHeight: $screenHeight');

    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          Positioned.fill(
            child: Container(
              color: Colors.blue[100],
              child: Center(
                child: ElevatedButton(
                  onPressed: togglePlayer,
                  child: Text(
                    _isMinimized ? 'Open Player' : 'Minimize Player',
                  ),
                ),
              ),
            ),
          ),

          // Animated Player
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              print(
                  '_verticalPositionAnimation: ${_verticalPositionAnimation.value}');
              print(
                  '_horizontalPositionAnimation: ${_horizontalPositionAnimation.value}');
              return Positioned(
                top: _verticalPositionAnimation.value,
                left: _horizontalPositionAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  alignment: Alignment.topCenter,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: GestureDetector(
                      onTap: () {
                        if (_isMinimized) togglePlayer();
                      },
                      child: Container(
                        height: heightPlayer,
                        width: widthPlayer,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: _isMinimized
                              ? BorderRadius.circular(12.0)
                              : BorderRadius.zero,
                        ),
                        child: widget.child,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
