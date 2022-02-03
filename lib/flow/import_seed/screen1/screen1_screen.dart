import 'package:architecture/flow/import_seed/screen1/screen1_bloc.dart';
import 'package:architecture/get.dart';
import 'package:flutter/material.dart';

class Screen1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Screen1Contents()
    );
  }
}

class Screen1Contents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Screen1ContentsState();
}

class Screen1ContentsState extends State<Screen1Contents> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Welcome to screen 1"),
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
                final bloc = get<Screen1Bloc>();
                bloc.acceptValue1(v);
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