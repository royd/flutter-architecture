import 'dart:async';

import 'package:architecture/services/incrementing_service.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

final _get = GetIt.instance;

class HomeBloc implements Disposable {
  final _count = BehaviorSubject.seeded(0);
  final _service = _get<IncrementingService>();

  ValueStream<int> get count => _count.stream;

  void increment() {
    _count.value = _service.increment(_count.value);
  }

  @override
  FutureOr onDispose() {
    _count.close();
  }
}
