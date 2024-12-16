import 'package:flutter/foundation.dart';

enum PlayerSizeState { minimize, full, off }

class PlayerController extends ChangeNotifier {
  static PlayerController? _instance;

  PlayerSizeState _size;

  PlayerSizeState get size => _size;

  PlayerController._internal(this._size);

  factory PlayerController() {
    _instance ??= PlayerController._internal(PlayerSizeState.off);

    return _instance!;
  }

  void onChangeSizeState() {
    _size == PlayerSizeState.minimize
        ? PlayerSizeState.full
        : PlayerSizeState.minimize;
    notifyListeners();
  }

  void onDismissPlayer() {
    _size = PlayerSizeState.off;
    notifyListeners();
  }
}
