import 'package:flutter/material.dart';
import 'package:market_app/config.dart';
import 'package:market_app/run.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: temaP,
      home: const Run(),
    );
  }
}
