import 'package:architecture/flow/import_seed/Screen3/Screen3_bloc.dart';
import 'package:architecture/get.dart';
import 'package:flutter/material.dart';

class Screen3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Screen3Contents()
    );
  }
}

class Screen3Contents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Screen3ContentsState();
}

class Screen3ContentsState extends State<Screen3Contents> {
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
          Text("Previous values [ ${ get<Screen3Bloc>().value1}, ${ get<Screen3Bloc>().value2} ]"),
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
                final bloc = get<Screen3Bloc>();
                bloc.acceptValue3(v);
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