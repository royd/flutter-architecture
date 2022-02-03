import 'dart:async';

import 'package:get_it/get_it.dart';

abstract class Screen3Navigator {
  void completeAccumulation(int value3);
}

class Screen3Bloc implements Disposable {
  final Screen3Navigator _navigator;
  final int value1;
  final int value2;

  Screen3Bloc(this.value1, this.value2, this._navigator);

  void acceptValue3(int v) {
    _navigator.completeAccumulation(v);
  }

  @override
  FutureOr onDispose() {}
}
