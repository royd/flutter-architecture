import 'dart:async';

import 'package:architecture/services/incrementing_service.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

final _get = GetIt.instance;

///
/// Use the Bloc suffix.
/// Implement Disposable for cleanup when unregistered.
///
class HomeBloc implements Disposable {
  ///
  /// Use a Subject:
  ///   BehaviorSubject -> has a current value
  ///   PublishSubject  -> does not have a current value
  ///   ReplaySubject   -> sends a listener all previous values
  ///
  final _count = BehaviorSubject.seeded(0);

  ///
  /// Depend on a minimal abstraction, not a concretion.
  ///
  final _service = _get<IncrementingService>();

  ///
  /// Outputs are from ValueStreams or Streams
  ///
  ValueStream<int> get count => _count.stream;

  ///
  /// Inputs are from methods.
  ///
  void increment() {
    _count.value = _service.increment(_count.value);
  }

  @override
  FutureOr onDispose() {
    ///
    /// Close Subjects
    ///
    _count.close();
  }
}
