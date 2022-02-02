import 'package:architecture/services/incrementing_service.dart';

class SingleIncrementingService implements IncrementingService {
  @override
  int increment(int value) {
    return value + 1;
  }
}
