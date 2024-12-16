import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

import '../base/base_state.dart';
import '../home/home_screen.dart';
import '../video_player/default_player/default_player.dart';
import 'notifications_page.dart';
import 'search_page.dart';
import 'settings_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen> {
  List<Widget> pages = [
    const HomeScreen(),
    const SearchPage(),
    const NotificationsPage(),
    const SettingsPage()
  ];
  List<String> titles = [
    AppStrings.home.tr(),
    AppStrings.search.tr(),
    AppStrings.notifications.tr(),
    AppStrings.settings.tr(),
  ];
  var _title = AppStrings.home.tr();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[_currentIndex],
          GestureDetector(
            onPanDown: (details) {
              playerController.onChangeSizeState();
            },
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: DefaultPlayer(),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.lightGrey, spreadRadius: AppSize.s1)
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: AppStrings.search.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: AppStrings.notifications.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppStrings.settings.tr()),
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
