import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

import '../../utils/mock_data.dart';
import '../presentation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
              itemCount: audioExamples.length,
              itemBuilder: (context, index) {
                final objectVideo = audioExamples.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    // Open full screen player
                    playerController.onOpenVideoPlayer(
                        videoDetail: objectVideo);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(AppMargin.m12),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(AppPadding.p16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: objectVideo.imageUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                objectVideo.title,
                                style:
                                    getSemiBoldStyle(color: ColorManager.white),
                              ),
                              Text(
                                objectVideo.artist,
                                style:
                                    getRegularStyle(color: ColorManager.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
