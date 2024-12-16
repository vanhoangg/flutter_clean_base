import 'package:flutter/widgets.dart';

import '../../app/di.dart';

import '../../app/widget_util.dart';
import '../video_player/default_player/player_controller.dart';

abstract class BaseStateLess extends StatelessWidget {
  const BaseStateLess({super.key});

  Route get route => instance();

  WidgetUtil get widgetUtil => instance();
  PlayerController get playerController => instance();
}
