import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

import '../video_player/default_player/default_player.dart';

enum VideoSize {
  minimize,
  full,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Current y position of drag gesture
  ///
  VideoSize defaultVideoSize = VideoSize.minimize;
  Size minSize = const Size(40, 40);

  double dx = 500;

  ///Used to determine SnapPosition
  double dy = 40;
  List<String> todoList = ['A', 'b', 'C', 'D'];
  double fullOpacity = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverList.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(AppMargin.m12),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(AppPadding.p16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black),
                      child: Text(
                        todoList[index],
                        style: getSemiBoldStyle(color: ColorManager.white),
                      ),
                    );
                  })
            ],
          ),
          LayoutBuilder(builder: (context, snapshot) {
            return GestureDetector(
                onPanUpdate: (details) {
                  Log.d('globalPosition ${details.globalPosition}');
                  Log.d('localPosition ${details.localPosition}');
                  details.localPosition.dx < minSize.width
                      ? null
                      : dx = details.localPosition.dx;
                  details.localPosition.dy < minSize.height
                      ? null
                      : dy = details.localPosition.dy;

                  setState(() {});
                  Log.d('delta ${details.delta}');
                  Log.d('primaryDelta ${details.primaryDelta}');
                },
                child: SizedBox(
                    height: dy,
                    child: Opacity(
                        opacity: fullOpacity, child: const DefaultPlayer())));
          })
        ],
      ),
    );
  }
}
