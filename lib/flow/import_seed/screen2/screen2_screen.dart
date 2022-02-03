import 'package:architecture/flow/import_seed/Screen2/Screen2_bloc.dart';
import 'package:architecture/get.dart';
import 'package:flutter/material.dart';

class Screen2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Screen2Contents()
    );
  }
}

class Screen2Contents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Screen2ContentsState();
}

class Screen2ContentsState extends State<Screen2Contents> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Welcome to screen 2"),
          Text("Previous value ${ get<Screen2Bloc>().value1}"),
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
          ),
          TextButton(
              onPressed: () {
                final v = int.tryParse(_controller.text);
                if(v == null) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: Text("Ok"))
                        ],
                        content: Text('${_controller.text} is not a valid number'),
                      )
                  );
                  return;
                }
                final bloc = get<Screen2Bloc>();
                bloc.acceptValue2(v);
              },
              child: Text("Accept")
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}