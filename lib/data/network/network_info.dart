import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final List<ConnectivityResult> _connectivityResult;

  NetworkInfoImpl(this._connectivityResult);

  @override
  Future<bool> get isConnected async {
    if (_connectivityResult.single == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
