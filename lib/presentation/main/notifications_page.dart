import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(AppStrings.notifications).tr(),
    );
  }
}
