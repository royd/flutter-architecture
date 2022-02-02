import 'package:architecture/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _get = GetIt.instance;

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    _get.registerLazySingleton(() => HomeBloc());
  }

  @override
  void dispose() {
    _get.unregister<HomeBloc>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const HomeCountDisplay(),
      floatingActionButton: const HomeIncrementButton(),
    );
  }
}

class HomeCountDisplay extends StatelessWidget {
  const HomeCountDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = _get<HomeBloc>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          StreamBuilder(
            initialData: bloc.count.value,
            stream: bloc.count,
            builder: (context, snapshot) {
              final count = snapshot.data ?? 0;

              return Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeIncrementButton extends StatelessWidget {
  const HomeIncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _get<HomeBloc>().increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
