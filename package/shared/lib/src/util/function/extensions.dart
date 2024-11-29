import 'dart:math';

import 'package:flutter/material.dart';

extension StringX on String {
  String get hardcode => this;
}

extension NumX on num {
  SizedBox get vertical => SizedBox(height: toDouble());
  SizedBox get horizontal => SizedBox(width: toDouble());
}

extension ColorX on Color {
  static Color get random {
    final Random random = Random();
    return Color.fromARGB(
      255, // Alpha value, set to fully opaque
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }
}
// extension on String

const EMPTY = '';
const ZERO = 0;
const IDNullable = -1;
const BOOL = false;

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}
