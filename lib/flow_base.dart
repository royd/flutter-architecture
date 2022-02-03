import 'package:architecture/get.dart';
import 'package:architecture/services/incrementing_service.dart';
import 'package:architecture/services/single_incrementing_service.dart';
import 'package:flutter/material.dart';

abstract class FlowBase<X extends FlowBaseState> extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => createFlowState();

  X createFlowState();
}

abstract class FlowBaseState<X> extends State<FlowBase> {
  final GlobalKey<NavigatorState> _navStateKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navStateKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => buildSFirstScreen(context),
      )
    );
    // return buildSFirstScreen(context);
  }

  Widget buildSFirstScreen(BuildContext context);

  Future<X?> showPage<X>(WidgetBuilder pageBuilder) {
    return _navStateKey.currentState!.push<X>(
        MaterialPageRoute(
            builder: pageBuilder
        )
    );
  }

  void completeFlow<X>([ X? result ]) {
    Navigator.pop(context, result);
  }
}