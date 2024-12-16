import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoList = ['A', 'b', 'C', 'D'];
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
        ],
      ),
    );
  }
}
