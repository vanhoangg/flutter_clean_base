import 'package:flutter/widgets.dart';

import '../../app/di.dart';
import '../../shared/shared.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  Route get route => instance();

  String get name => widget.runtimeType.toString();
  WidgetUtil get widgetUtil => instance();

  Size get deviceSize => MediaQuery.sizeOf(context);

  @override
  void initState() {
    Log.d('[$name] initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Log.d('[$name] didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Log.d('[$name] build');

    return Container();
  }

  @override
  void dispose() {
    Log.d('[$name] dispose');
    super.dispose();
  }
}
