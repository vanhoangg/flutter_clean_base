import 'routes_manager.dart';
import 'package:flutter/material.dart';

class SnackBarUtil {
  static SnackBar getSnackBar(
      BuildContext context, String message, Color color) {
    return SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      getSnackBar(context, message, Theme.of(context).colorScheme.error),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      getSnackBar(context, message, Theme.of(context).focusColor),
    );
  }

  static void showSuccessSnackBarGloballly(String message) {
    final BuildContext context = navigatorState.context;
    ScaffoldMessenger.of(context).showSnackBar(
      getSnackBar(context, message, Theme.of(context).focusColor),
    );
  }
}
