import 'package:architecture/flow/import_seed/screen1/screen1_bloc.dart';
import 'package:architecture/flow/import_seed/screen1/screen1_screen.dart';
import 'package:architecture/flow/import_seed/screen2/screen2_bloc.dart';
import 'package:architecture/flow/import_seed/screen2/screen2_screen.dart';
import 'package:architecture/flow/import_seed/screen3/screen3_bloc.dart';
import 'package:architecture/flow/import_seed/screen3/screen3_screen.dart';
import 'package:architecture/flow_base.dart';
import 'package:architecture/get.dart';
import 'package:flutter/cupertino.dart';

class ImportSeedFlow extends FlowBase<ImportSeedFlowState> {
  @override
  ImportSeedFlowState createFlowState() => ImportSeedFlowState();
}

class ImportSeedFlowState
    extends FlowBaseState<ImportSeedFlow>
    implements Screen1Navigator,
                Screen2Navigator,
                Screen3Navigator
{
  final List<int> _accumulatedValues = <int>[0, 0, 0];

  @override
  void dispose() {
    get.unregister<Screen1Bloc>();
    get.unregister<Screen2Bloc>();
    get.unregister<Screen3Bloc>();
    super.dispose();
  }

  Widget buildSFirstScreen(BuildContext context) {
    get.registerSingleton<Screen1Bloc>(Screen1Bloc(this));
    return Screen1Screen();
  }

  @override
  void completeAccumulation(int value3) {
    _accumulatedValues[2] = value3;
    completeFlow(_accumulatedValues);
  }

  @override
  Future<void> showScreen2(int value1) {
    _accumulatedValues[0] = value1;
    get.registerSingleton<Screen2Bloc>(Screen2Bloc(value1, this));
    return showPage((context) {
      return Screen2Screen();
    });
  }

  @override
  Future<void> showScreen3(int value2) {
    _accumulatedValues[1] = value2;
    get.registerSingleton<Screen3Bloc>(Screen3Bloc(_accumulatedValues[0], _accumulatedValues[1], this));

    return showPage((context) {
      return Screen3Screen();
    });
  }
}