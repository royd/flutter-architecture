import 'dart:async';

import 'package:get_it/get_it.dart';

abstract class Screen2Navigator {
  Future<void> showScreen3(int value2);
}

class Screen2Bloc implements Disposable {
  final Screen2Navigator _navigator;
  final int value1;

  Screen2Bloc(this.value1, this._navigator);

  void acceptValue2(int v) {
    _navigator.showScreen3(v);
  }

  @override
  FutureOr onDispose() {}
}
