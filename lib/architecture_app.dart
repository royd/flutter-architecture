import 'package:architecture/home.dart';
import 'package:architecture/services/incrementing_service.dart';
import 'package:architecture/services/single_incrementing_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _get = GetIt.instance;

class ArchitectureApp extends StatefulWidget {
  const ArchitectureApp({Key? key}) : super(key: key);

  @override
  _ArchitectureAppState createState() => _ArchitectureAppState();
}

class _ArchitectureAppState extends State<ArchitectureApp> {
  @override
  void initState() {
    super.initState();

    _get.registerLazySingleton<IncrementingService>(
        () => SingleIncrementingService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Architecture Home Page'),
    );
  }
}
