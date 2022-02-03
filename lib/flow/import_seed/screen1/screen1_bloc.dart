import 'dart:async';

import 'package:get_it/get_it.dart';

abstract class Screen1Navigator {
  Future<void> showScreen2(int value1);
}

class Screen1Bloc implements Disposable {
  final Screen1Navigator _navigator;

  Screen1Bloc(this._navigator);

  void acceptValue1(int v) {
    _navigator.showScreen2(v);
  }

  @override
  FutureOr onDispose() {}
}
